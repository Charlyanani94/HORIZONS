import 'package:flutter/material.dart';

// On crée une clé globale pour le ScaffoldMessengerState
// Utilisez cette clé lors de la création de MaterialApp si vous voulez que showSnackBar fonctionne
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey(debugLabel: 'scaffoldMessengerKey');

// Cette fonction affiche un SnackBar avec le message donné
// tant qu'un ScaffoldMessengerState avec la clé globale scaffoldMessengerKey est présent dans l'arbre des widgets
void showSnackBar(String message) {
  // On obtient l'état actuel du ScaffoldMessenger en utilisant la clé globale
  final messenger = scaffoldMessengerKey.currentState;

  // On affiche le SnackBar avec le message donné
  messenger?.showSnackBar(
    SnackBar(content: Text(message)),
  );
}
