import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SpinKitChasingDots(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.green : Colors.blue,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Loader0 extends StatelessWidget {
  const Loader0({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SpinKitChasingDots(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.yellow : Colors.red,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class LoaderLight extends StatelessWidget {
  const LoaderLight({super.key});

  @override
  Widget build(BuildContext context) {
    // Définir une liste de couleurs
    List<Color> colors = [Colors.red, Colors.blue, Colors.yellow];
    // Créer une instance de Random
    Random random = Random();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SpinKitChasingDots(
            itemBuilder: (BuildContext context, int index) {
              // Sélectionner une couleur aléatoire
              Color color = colors[random.nextInt(colors.length)];

              return DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
