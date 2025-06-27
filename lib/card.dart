import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horizons/constant.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String title;
  final Color color;
  final double borderRadius;
  final VoidCallback onTap;
  final Color svgColor;

  CustomCard({
    required this.image,
    required this.title,
    required this.color,
    required this.borderRadius,
    required this.onTap,
    required this.svgColor,
  });

  @override
  Widget build(BuildContext context) {
    final double largeurEcran = MediaQuery.of(context).size.width;
    double svgHeight;

    if (largeurEcran < 600) {
      svgHeight = 30.0; // Small screen
    } else if (largeurEcran < 900) {
      svgHeight = 40.0; // Medium screen
    } else {
      svgHeight = 50.0; // Large screen
    }

    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: LayoutBuilder(
        builder: (context, contraintes) {
          return InkWell(
            splashColor: lightgreenshede1,
            highlightColor: Colors.red,
            borderRadius: BorderRadius.circular(10.0),
            onTap: onTap,
            child: Stack(
              children: <Widget>[
                FractionallySizedBox(
                  heightFactor: 0.85,
                  alignment: Alignment.center,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(contraintes.maxWidth * 0.1),
                      child: SvgPicture.asset(
                        image,
                        color: svgColor,
                        height: svgHeight,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: contraintes.maxWidth * 0.04,
                      left: contraintes.maxWidth * 0.05,
                      right: contraintes.maxWidth * 0.05,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
