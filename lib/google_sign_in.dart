import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:horizons/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'error_snack_bar.dart';

Future<UserCredential?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Si googleUser est null, on lance une exception
    if (googleUser == null) {
      throw Exception('La connexion avec Google a échoué.');
    }

    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    return userCredential;
  } on FirebaseAuthException catch (e) {
    showErrorSnackbar('${e.message}', scaffoldMessengerKey);
    throw e; // On relance l'exception pour pouvoir la gérer plus haut dans le code
  } on FormatException catch (e) {
    showErrorSnackbar('$e', scaffoldMessengerKey);
    throw e; // On relance l'exception pour pouvoir la gérer plus haut dans le code
  } on PlatformException catch (e) {
    if (e.code == '7') {
      showErrorSnackbar(
          'Désolé, nous ne pouvons pas accéder aux services Google pour le moment. Veuillez vérifier votre connexion Internet et réessayer.',
          scaffoldMessengerKey);
    } else {
      showErrorSnackbar('${e.message}', scaffoldMessengerKey);
    }
    throw e; // On relance l'exception pour pouvoir la gérer plus haut dans le code
  } catch (e) {
    showErrorSnackbar(
        'Une erreur inattendue s\'est produite lors de la connexion.',
        scaffoldMessengerKey);
    throw e; // On relance l'exception pour pouvoir la gérer plus haut dans le code
  }
}
