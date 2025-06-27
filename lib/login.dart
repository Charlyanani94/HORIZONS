import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:horizons/error_snack_bar.dart';
import 'package:horizons/google_sign_in.dart';
import 'package:horizons/onboard.dart';
import 'package:horizons/snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  // final Function(Locale) changeLanguage;

  bool isLoading = false;

  LoginPage(
      {Key? key /*, required void Function(Locale locale) changeLanguage*/})
      : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  User? user; // Declare the user variable

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser; // Initialize user in initState
  }

  Future<void> _signInWithGoogle() async {
   // user = await FirebaseAuth.instance.currentUser;

   // print('User: $user');

    setState(() {
      _isLoading = true;
    });

    try {
      final user = await signInWithGoogle();
      print('User: $user');

      // Navigate to the next page if sign in was successful
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardScreen()),
        );
      } else {
        // Ici, vous pouvez gérer le cas où user est null.
        // Par exemple, vous pouvez montrer un message d'erreur.
        showErrorSnackbar(
            'Une erreur inattendue s\'est produite lors de la connexion.',
            scaffoldMessengerKey);
      }
    } catch (e) {
      print('Erreur lors de la connexion : $e');

      showErrorSnackbar('${e}', scaffoldMessengerKey);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 380),
                  child: Image.asset('images/food.png'),
                ),
                /* ElevatedButton(
                  onPressed: () {
                    GoogleSignIn().signOut();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Se déconnecter de Google'),
                ),*/
                const Spacer(),
                Text(
                  AppLocalizations.of(context)!.simplifyYourDailyLife,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: Text(
                    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _isLoading
                        ? SpinKitChasingDots(
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  color:
                                      index.isEven ? Colors.green : Colors.blue,
                                ),
                              );
                            },
                          ) // Show a progress indicator while loading
                        : InkWell(
                            onTap: _signInWithGoogle,
                            child: Container(
                              width: 50,
                              height: 50,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage('images/gooo.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(
                        width:
                            20), // Ajoutez un espace horizontal entre les boutons de connexion
                    InkWell(
                      onTap: () {
                        // Ajoutez votre logique de connexion Apple ici
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(
                              10), // Ajoutez des bords arrondis ici
                          image: const DecorationImage(
                            image: AssetImage(
                                'images/apple.png'), // <-- Utilisez 'Image.asset(...)' ici
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
