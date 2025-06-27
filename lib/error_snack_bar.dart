import 'package:flutter/material.dart';
import 'package:horizons/palette.dart';

void showErrorSnackbar(
    String errorMessage, GlobalKey<ScaffoldMessengerState> key,
    {SnackBarAction? action}) {
  final messenger = key.currentState;
  final palette = Palette();
  final text = RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: 'Error: ',
          style: TextStyle(color: palette.redPen, fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: errorMessage,
          style: TextStyle(
            color: palette.ink,
          ),
        ),
      ],
    ),
  );

  final duration = Duration(milliseconds: errorMessage.characters.length * 60);

  messenger
    ?..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: text,
        margin: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
        behavior: SnackBarBehavior.floating,
        duration: duration,
        backgroundColor: palette.backgroundMain,
        dismissDirection: DismissDirection.horizontal,
        action: action,
      ),
    );
}
