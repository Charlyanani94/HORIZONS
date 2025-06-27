import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:horizons/constant.dart';

class CarouselClass extends StatefulWidget {
  const CarouselClass({Key? key}) : super(key: key);

  @override
  State<CarouselClass> createState() => _CarouselClassState();
}

class _CarouselClassState extends State<CarouselClass> {
  List<String> listeImages = [
    "images/6.jpg",
    "images/7.jpg",
    "images/8.jpg",
    "images/9.jpg"
  ];
  int pageActuelle = 0;
  CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final double largeurEcran =
        MediaQuery.of(context).size.width; // Obtenir la largeur de l'écran

    final double hauteurEcran =
        MediaQuery.of(context).size.height; // Obtenir la hauteur de l'écran

    return Container(
      // Removed Scaffold widget as it's not necessary here
      // color: Colors.grey[200],
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: largeurEcran * 0.95, // Set width to 90% of screen size
              height: hauteurEcran * 0.20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: CarouselSlider(
                  carouselController: _controller,
                  items: listeImages.map((image) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    pauseAutoPlayOnTouch: true,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    height: 125.0, // Set a fixed height for the carousel
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        pageActuelle = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: largeurEcran * 0.001,
          ),

          // ... (code existant pour les points indicateurs)

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listeImages.asMap().entries.map((entry) {
              return InkWell(
                onTap: () => _controller.jumpToPage(entry.key),
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: pageActuelle == entry.key
                        ? Colors.lightBlue
                        : colorAcent,
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
