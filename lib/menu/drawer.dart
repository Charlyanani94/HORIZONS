import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:horizons/constant.dart';
import 'package:horizons/login.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: colorAcent),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 1.0, bottom: 20, left: 0, right: 125),
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'images/hori.png',
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Iconsax.profile),
            title: Text(AppLocalizations.of(context)!.myAccount),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Iconsax.star),
            title: Text(AppLocalizations.of(context)!.premiumSubscription),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Iconsax.money),
            title: Text(AppLocalizations.of(context)!.recommendAndEarn),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Iconsax.group),
            title: Text(AppLocalizations.of(context)!.myReferrals),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Iconsax.call),
            title: Text(AppLocalizations.of(context)!.contactUs),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.facebook),
            title: Text(AppLocalizations.of(context)!.followUsOnFacebook),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Iconsax.document),
            title: Text(AppLocalizations.of(context)!.termsOfUse),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Iconsax.logout),
            title: Text(AppLocalizations.of(context)!.logout),
            onTap: () async {
              await GoogleSignIn().signOut();
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
