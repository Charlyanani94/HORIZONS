import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:horizons/form/signupform.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import 'allinonboardscreen.dart';
import 'appbar.dart';
import 'constant.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'language_provider.dart';

class OnboardScreen extends StatefulWidget {
  //final Function(Locale) changeLanguage;

  OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  bool _isLoading = false;
  Future<void> _navigateToFormu() async {
    setState(() {
      _isLoading = true; // Affiche le Loader
    });

    // Simule un délai de chargement avec Future.delayed
    await Future.delayed(const Duration(seconds: 1));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Formu()),
    );

    setState(() {
      _isLoading = false; // Cache le Loader
    });
  }

  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double bottom = deviceHeight * 0.32; // Valeur par défaut

    if (deviceHeight <= 641.50) {
      print(deviceHeight);
      bottom = deviceHeight * 0.32;
    } else if (deviceHeight > 645) {
      bottom = deviceHeight * 0.4;
    } else {}
    List<AllinOnboardModel> allinonboardlist = [
      AllinOnboardModel(
        "images/food.png",
        AppLocalizations.of(context)!.recommandezHorizons,
        AppLocalizations.of(context)!.gagnezArgent,
      ),
      AllinOnboardModel(
        "images/food.png",
        AppLocalizations.of(context)!.recommandezHorizons,
        AppLocalizations.of(context)!.gagnezArgent,
      ),
      AllinOnboardModel(
        "images/food.png",
        AppLocalizations.of(context)!.recommandezHorizons,
        AppLocalizations.of(context)!.gagnezArgent,
      ),
    ];
    return //MaterialApp(
        /*home:*/ Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: '',
        rightIcons: const [
          Icons.language,
        ],
        rightIconColors: colorAcent,
        onRightIconTaps: [
          () {
            print(deviceHeight);

            showMenu(
              context: context,
              position: const RelativeRect.fromLTRB(100, 0, 0, 100),
              items: [
                PopupMenuItem(
                  child: const DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Arial'), // change this as needed
                    child: Text('French'),
                  ),
                  onTap: () {
                    Provider.of<LanguageProvider>(context, listen: false)
                        .changeLanguage(const Locale('fr', ''));

                    //widget.changeLanguage(const Locale('fr', ''));
                  },
                ),
                PopupMenuItem(
                  child: const DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Gamilia'), // change this as needed
                    child: Text('English'),
                  ),
                  onTap: () {
                    // widget.changeLanguage(const Locale('en', ''));
                    Provider.of<LanguageProvider>(context, listen: false)
                        .changeLanguage(const Locale('en', ''));
                  },
                ),
                // Ajoutez autant d'options que vous le souhaitez
              ],
            );
          },
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: allinonboardlist.length,
              itemBuilder: (context, index) {
                return PageBuilderWidget(
                    title: allinonboardlist[index].titlestr,
                    description: allinonboardlist[index].description,
                    imgurl: allinonboardlist[index].imgStr);
              }),
          Positioned(
            bottom: bottom,
            left: MediaQuery.of(context).size.width * 0.44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                allinonboardlist.length,
                (index) => buildDot(index: index),
              ),
            ),
          ),
          currentIndex < allinonboardlist.length - 1
              ? Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.05,
                  right: MediaQuery.of(context).size.width * 0.025,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const Formu()));
                        },
                        label: Text(AppLocalizations.of(context)!.skip),
                        icon: const Icon(Iconsax.close_square4),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFB2D9CC)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (currentIndex < allinonboardlist.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          } else {
                            // Naviguez vers la page X lorsque "Skip" est appuyé
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Formu()),
                            );
                          }
                        },
                        icon: const Icon(Iconsax.arrow_right),
                        label: Text(AppLocalizations.of(context)!.next),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFB2D9CC)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                    ],
                  ),
                )
              : Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.05,
                  right: MediaQuery.of(context).size.width * 0.18,
                  left: MediaQuery.of(context).size.width * 0.18,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB2D9CC),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    onPressed: () {
                      _navigateToFormu();
                    },
                    icon: _isLoading
                        ? SpinKitChasingDots(
                            size: 30,
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  color:
                                      index.isEven ? Colors.yellow : Colors.red,
                                ),
                              );
                            },
                          )
                        : Container(),
                    label: Text(
                      AppLocalizations.of(context)!.getStarted,
                      style: TextStyle(fontSize: 18, color: primarygreen),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? primarygreen : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;
  PageBuilderWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.imgurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Image.asset(imgurl),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          //Tite Text
          Text(title,
              style: TextStyle(
                  color: primarygreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          //discription
          Text(description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: primarygreen,
                fontSize: 14,
              ))
        ],
      ),
    );
  }
}
