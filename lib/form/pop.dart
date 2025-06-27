import 'package:flutter/material.dart';
import 'package:horizons/constant.dart';

class C extends StatelessWidget {
  const C({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorAcent,
      title: const Text("Profil"),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert), // Icône de menu
          onSelected: (String result) {
            // Gérez la sélection ici
            print("Option sélectionnée : $result");
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Français',
              child: Text('Français'),
            ),
            const PopupMenuItem<String>(
              value: 'Anglais',
              child: Text('Anglais'),
            ),
          ],
        ),
      ],
    );
  }
}
