import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'google_sign_in.dart';
import 'snack_bar.dart';

class GoogleSignInPage extends StatelessWidget {
  const GoogleSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Se connecter avec Google'),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => signInWithGoogle(),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Se connecter avec Google'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  GoogleSignIn().signOut();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text('Se déconnecter de Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
