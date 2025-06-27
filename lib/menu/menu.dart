import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horizons/appbar.dart';
import 'package:horizons/card.dart';
import 'package:horizons/constant.dart';
import 'package:horizons/menu/drawer.dart';
import 'package:horizons/menu/slider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double largeurEcran = MediaQuery.of(context).size.width;
    final double hauteurEcran = MediaQuery.of(context).size.height;

    final User? user = FirebaseAuth.instance.currentUser;

    // Determine the number of grid items based on screen width
    int crossAxisCount = largeurEcran < 600
        ? 3
        : largeurEcran < 300
            ? 2
            : largeurEcran > 900
                ? 4
                : 3;

    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: lightgreenshede,
      appBar: CustomAppBar(
        title: 'Horizons',
        backgroundColor: colorAcent,
        leftIcon: Iconsax.menu5,
        onLeftIconTap: () {
          scaffoldKey.currentState?.openDrawer();
        },
        rightIcons: const [Iconsax.notification, Icons.more_vert],
        onRightIconTaps: [],
        rightIconColors: lightgreenshede,
        leftIconColor: lightgreenshede,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(child: SizedBox()),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12.0),
            sliver: SliverGrid.count(
              crossAxisCount: crossAxisCount,
              children: [
                CustomCard(
                  image: 'images/pros.svg',
                  title: 'Pros',
                  color: yellowOrangeTint,
                  borderRadius: 24.0,
                  svgColor: Colors.white,
                  onTap: () {
                    print('Pro tapped');
                  },
                ),
                CustomCard(
                  image: 'images/emploi.svg',
                  title: 'Emploi',
                  color: lightBrown,
                  borderRadius: 24.0,
                  onTap: () {
                    print('Emploi tapped');
                  },
                  svgColor: Colors.white,
                ),
                CustomCard(
                  image: 'images/annonces.svg',
  title: AppLocalizations.of(context)!.announcements,
                  color: vividYellowShade0,
                  borderRadius: 24.0,
                  onTap: () {
                    print('Annonces tapped');
                  },
                  svgColor: Colors.white,
                ),
                CustomCard(
                  image: 'images/tree.svg',
title: AppLocalizations.of(context)!.underTheTree,
                  color: navyBlue,
                  borderRadius: 24.0,
                  onTap: () {
                    print('Tree tapped');
                  },
                  svgColor: Colors.white,
                ),
                CustomCard(
                  image: 'images/shopping.svg',
                  title: 'Shopping',
                  color: vividBlueShade0,
                  borderRadius: 24.0,
                  onTap: () {
                    print('Shopping tapped');
                  },
                  svgColor: Colors.white,
                ),
                CustomCard(
                  image: 'images/repas.svg',
title: AppLocalizations.of(context)!.meals,
                  color: orangeRed,
                  borderRadius: 24.0,
                  onTap: () {
                    print('Repas tapped');
                  },
                  svgColor: Colors.white,
                ),
                CustomCard(
                  image: 'images/colis.svg',
title: AppLocalizations.of(context)!.boxes,
                  color: colorAcent0,
                  borderRadius: 24.0,
                  onTap: () {
                    print('Colis tapped');
                  },
                  svgColor: Colors.white,
                ),
                CustomCard(
                  image: 'images/sante.svg',
title: AppLocalizations.of(context)!.health,
                  color: primaryGreen,
                  borderRadius: 24.0,
                  onTap: () {
                    print('Sante tapped');
                  },
                  svgColor: Colors.white,
                ),
                CustomCard(
                  image: 'images/video.svg',
title: AppLocalizations.of(context)!.videos,
                  color: darkYellow,
                  borderRadius: 24.0,
                  onTap: () {
                    print('Videos tapped');
                  },
                  svgColor: Colors.white,
                ),
                CustomCard(
                  image: 'images/podcast.svg',
                  title: 'Podcast',
                  color: cyan0Color,
                  borderRadius: 24.0,
                  onTap: () {
                    print('Podcast tapped');
                  },
                  svgColor: Colors.white,
                ),
                CustomCard(
                  image: 'images/rencontre.svg',
title: AppLocalizations.of(context)!.friendly,
                  color: darkChocolateBrown,
                  borderRadius: 24.0,
                  onTap: () {
                    print('Rencontres tapped');
                  },
                  svgColor: Colors.white,
                ),
                CustomCard(
                  image: 'images/jeux.svg',
title: AppLocalizations.of(context)!.games,
                  color: lightBlue,
                  borderRadius: 24.0,
                  onTap: () {
                    print('Jeux tapped');
                  },
                  svgColor: Colors.white,
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: CarouselClass()),
        ],
      ),
    );
  }
}
