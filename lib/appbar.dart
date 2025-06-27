import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final IconData? leftIcon;
  final List<IconData>? rightIcons;
  final VoidCallback? onLeftIconTap;
  final List<VoidCallback>? onRightIconTaps;
  final Color? leftIconColor;
  final Color? rightIconColors;

  CustomAppBar({
    required this.title,
    required this.backgroundColor,
    this.leftIcon,
    this.rightIcons,
    this.onLeftIconTap,
    this.onRightIconTaps,
    this.leftIconColor,
    // Nouveau paramètre pour la couleur de l'icône de gauche
    this.rightIconColors, // Nouveau paramètre pour les couleurs des icônes de droite
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      backgroundColor: backgroundColor,
      leading: leftIcon != null
          ? IconButton(
              icon: Icon(
                leftIcon,
                size: 28.0,
                color: leftIconColor, // Utilisez le paramètre de couleur
              ),
              onPressed: onLeftIconTap,
            )
          : null,
      actions: rightIcons
          ?.map((icon) => IconButton(
                icon: Icon(
                  icon,
                  size: 28.0,
                  color: rightIconColors, // Utilisez le paramètre de couleur
                ),
                onPressed: onRightIconTaps != null &&
                        rightIcons!.indexOf(icon) < onRightIconTaps!.length
                    ? onRightIconTaps![rightIcons!.indexOf(icon)]
                    : null,
              ))
          .toList(),
    );
  }
}


/*


CustomAppBar(
  title: 'Mon Application',
  leftIcon: Icons.menu,
  onLeftIconTap: () {
    // Action lorsque l'utilisateur appuie sur l'icône de gauche
  },
  rightIcons: [Icons.language, Icons.settings],
  onRightIconTaps: [
    () {
      // Action pour la première icône de droite
    },
    () {
      // Action pour la deuxième icône de droite
    },
    // Ajoutez d'autres fonctions de rappel pour les icônes supplémentaires
  ],
)
*/