import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:horizons/constant.dart';
import 'package:horizons/form/controller.dart';
import 'package:horizons/language_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../appbar.dart';
import '../error_snack_bar.dart';
import '../menu/menu.dart';
import '../snack_bar.dart';

import 'validators.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Formu extends StatefulWidget {
  //final Function(Locale) changeLanguage;

  const Formu({Key? key}) : super(key: key);

  @override
  State<Formu> createState() => FormuState();
}

class FormuState extends State<Formu> {
  final GlobalKey<ScaffoldMessengerState> profilScaffoldMessengerKey =
      GlobalKey(debugLabel: 'profilScaffoldMessengerKey');
  String? selectedYear;
  String? selectedCountry;
  String? city;
  String? phoneNumber;

  bool? agreeTerms = false;

  bool _isLoading = false;
  Future<void> _navigateToMenu() async {
    setState(() {
      _isLoading = true; // Affiche le Loader
    });

    // Simule un délai de chargement avec Future.delayed
    await Future.delayed(const Duration(seconds: 1));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Menu()),
    );

    setState(() {
      _isLoading = false; // Cache le Loader
    });
  }

  @override
  Widget build(BuildContext context) {
    final double hauteurEcran = MediaQuery.of(context).size.height;
    //final double spaceBtwInputFields = hauteurEcran * 0.02;
    final controller = Get.put(Controller());
    List<String> years =
        List<String>.generate(67, (i) => (1940 + i).toString());
    List<String> countriesFr = [
      'Afghanistan',
      'Albanie',
      'Algérie',
      'Andorre',
      'Angola',
      'Antigua-et-Barbuda',
      'Argentine',
      'Arménie',
      'Australie',
      'Autriche',
      'Azerbaïdjan',
      'Bahamas',
      'Bahreïn',
      'Bangladesh',
      'Barbade',
      'Biélorussie',
      'Belgique',
      'Belize',
      'Bénin',
      'Bhoutan',
      'Bolivie',
      'Bosnie-Herzégovine',
      'Botswana',
      'Brésil',
      'Brunei',
      'Bulgarie',
      'Burkina Faso',
      'Burundi',
      'Cambodge',
      'Cameroun',
      'Canada',
      'Cap-Vert',
      'République centrafricaine',
      'Tchad',
      'Chili',
      'Chine',
      'Colombie',
      'Comores',
      'Congo',
      'Congo, République démocratique du',
      'Costa Rica',
      'Côte d\'Ivoire',
      'Croatie',
      'Cuba',
      'Chypre',
      'République tchèque',
      'Danemark',
      'Djibouti',
      'Dominique',
      'République dominicaine',
      'Timor oriental',
      'Équateur',
      'Égypte',
      'Salvador',
      'Guinée équatoriale',
      'Érythrée',
      'Estonie',
      'Eswatini',
      'Éthiopie',
      'Fidji',
      'Finlande',
      'France',
      'Gabon',
      'Gambie',
      'Géorgie',
      'Allemagne',
      'Ghana',
      'Grèce',
      'Grenade',
      'Guatemala',
      'Guinée',
      'Guinée-Bissau',
      'Guyane',
      'Haïti',
      'Honduras',
      'Hongrie',
      'Islande',
      'Inde',
      'Indonésie',
      'Iran',
      'Irak',
      'Irlande',
      'Israël',
      'Italie',
      'Jamaïque',
      'Japon',
      'Jordanie',
      'Kazakhstan',
      'Kenya',
      'Kiribati',
      'Corée, Nord',
      'Corée, Sud',
      'Koweït',
      'Kirghizistan',
      'Laos',
      'Lettonie',
      'Liban',
      'Lesotho',
      'Libéria',
      'Libye',
      'Liechtenstein',
      'Lituanie',
      'Luxembourg',
      'Madagascar',
      'Malawi',
      'Malaisie',
      'Maldives',
      'Mali',
      'Malte',
      'Îles Marshall',
      'Mauritanie',
      'Maurice',
      'Mexique',
      'Micronésie',
      'Moldavie',
      'Monaco',
      'Mongolie',
      'Monténégro',
      'Maroc',
      'Mozambique',
      'Myanmar',
      'Namibie',
      'Nauru',
      'Népal',
      'Pays-Bas',
      'Nouvelle-Zélande',
      'Nicaragua',
      'Niger',
      'Nigeria',
      'Macédoine du Nord',
      'Norvège',
      'Oman',
      'Pakistan',
      'Palaos',
      'Panama',
      'Papouasie-Nouvelle-Guinée',
      'Paraguay',
      'Pérou',
      'Philippines',
      'Pologne',
      'Portugal',
      'Qatar',
      'Roumanie',
      'Russie',
      'Rwanda',
      'Saint-Kitts-et-Nevis',
      'Sainte-Lucie',
      'Saint-Vincent-et-les-Grenadines',
      'Samoa',
      'Saint-Marin',
      'Sao Tomé-et-Principe',
      'Arabie saoudite',
      'Sénégal',
      'Serbie',
      'Seychelles',
      'Sierra Leone',
      'Singapour',
      'Slovaquie',
      'Slovénie',
      'Îles Salomon',
      'Somalie',
      'Afrique du Sud',
      'Espagne',
      'Sri Lanka',
      'Soudan',
      'Soudan, Sud',
      'Suriname',
      'Suède',
      'Suisse',
      'Syrie',
      'Taïwan',
      'Tadjikistan',
      'Tanzanie',
      'Thaïlande',
      'Togo',
      'Tonga',
      'Trinité-et-Tobago',
      'Tunisie',
      'Turquie',
      'Turkménistan',
      'Tuvalu',
      'Ouganda',
      'Ukraine',
      'Émirats arabes unis',
      'Royaume-Uni',
      'États-Unis',
      'Uruguay',
      'Ouzbékistan',
      'Vanuatu',
      'Vatican',
      'Venezuela',
      'Vietnam',
      'Yémen',
      'Zambie',
      'Zimbabwe'
    ];
    List<String> countriesEn = ['Benin', 'Nigeria', 'Togo', 'United States'];

    List<String> countries;
    if (Localizations.localeOf(context).languageCode == 'fr') {
      countries = countriesFr;
    } else {
      countries = countriesEn;
    }

    InputDecoration getInputDecoration(
        {required String label, required IconData icon}) {
      return InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 0.80,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.red, // Change this to your desired color
            style: BorderStyle.solid,
            width: 0.80,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.grey, // Change this to your desired color
            style: BorderStyle.solid,
            width: 0.80,
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Assurez-vous que cette ligne est ici

      scaffoldMessengerKey: profilScaffoldMessengerKey,
      home: Scaffold(
        //backgroundColor: colorAcent,
        appBar: CustomAppBar(
          backgroundColor: colorAcent,
          title: AppLocalizations.of(context)!.profil,
          rightIcons: const [Iconsax.global],
          rightIconColors: lightgreenshede,
          onRightIconTaps: [
            () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(100, 0, 0, 100),
                items: [
                  PopupMenuItem(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Arial'), // change this as needed
                      child: Text(AppLocalizations.of(context)!.french),
                    ),
                    onTap: () {
                      Provider.of<LanguageProvider>(context, listen: false)
                          .changeLanguage(const Locale('fr', ''));

                      //widget.changeLanguage(const Locale('fr', ''));
                    },
                  ),
                  PopupMenuItem(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Gamilia'), // change this as needed
                      child: Text(AppLocalizations.of(context)!.english),
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
            Padding(
              padding: EdgeInsets.only(
                top: hauteurEcran * 0.025,
                left: MediaQuery.of(context).size.width * 0.01,
                right: MediaQuery.of(context).size.width * 0.01,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: controller.uniqueKey2,
                    child: Column(
                      children: [
                        //first and last nameUniqueKey
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: controller.firstNameController,
                                expands: false,
                                decoration: getInputDecoration(
                                    label: Texts.firstname(context),
                                    icon: Iconsax.user),
                                validator: (value) =>
                                    Validators.validateFirstName(
                                        value, context),
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.02),
                            Expanded(
                              child: TextFormField(
                                controller: controller.lastNameController,
                                expands: false,
                                decoration: getInputDecoration(
                                    label: Texts.lastname(context),
                                    icon: Iconsax.user),
                                validator: (value) =>
                                    Validators.validateLastName(value, context),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),

                        // Year of birth

                        Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor:
                                lightgreenshede, // change la couleur de fond
                            buttonTheme: ButtonTheme.of(context).copyWith(
                              alignedDropdown: true, // centre le menu déroulant
                            ),
                          ),
                          child: DropdownButtonFormField<String>(
                            decoration: getInputDecoration(
                                label: Texts.yearofbirth(context),
                                icon: Iconsax.calendar),
                            value: selectedYear,
                            items: years.map((String year) {
                              return DropdownMenuItem<String>(
                                value: year,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    year,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedYear = newValue;
                              });
                            },
                            validator: (value) =>
                                Validators.validateYear(value, context),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor:
                                lightgreenshede, // Change la couleur de fond
                            buttonTheme: ButtonTheme.of(context).copyWith(
                              alignedDropdown: true, // Centre le menu déroulant
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                          child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            decoration: getInputDecoration(
                                label: Texts.country(context),
                                icon: Iconsax
                                    .flag // Remplacez ceci par l'icône de votre choix
                                ),
                            value: selectedCountry,
                            items: countries.map((String country) {
                              return DropdownMenuItem<String>(
                                value: country,
                                child: Text(country),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCountry = newValue;
                              });
                            },
                            validator: (value) =>
                                Validators.validateCountry(value, context),
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        // City
                        TextFormField(
                          controller: controller.cityController,
                          expands: false,
                          decoration: getInputDecoration(
                              label: Texts.city(context),
                              icon: Iconsax.location),
                          onChanged: (value) {
                            city = value;
                          },
                          validator: (value) =>
                              Validators.validateCity(value, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        // Phone number
                        TextFormField(
                          controller: controller.phoneNumberController,
                          expands: false,
                          keyboardType: TextInputType
                              .phone, // This line ensures that the numeric keyboard is shown

                          decoration: getInputDecoration(
                              label: Texts.phonenumber(context),
                              icon: Iconsax.call),

                          onChanged: (value) {
                            phoneNumber = value;
                          },
                          validator: (value) =>
                              Validators.validatePhoneNumber(value, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        CheckboxListTile(
                          title: GestureDetector(
                            onTap: () async {
                              final Uri url =
                                  Uri.parse('https://www.google.com');
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Text(
                              AppLocalizations.of(context)!.terms,
                              style: const TextStyle(color: Colors.lightBlue),
                            ),
                          ),
                          value: agreeTerms,
                          onChanged: (bool? value) {
                            setState(() {
                              agreeTerms = value;
                              print(
                                  'La valeur de agreeTerms est maintenant : $agreeTerms');
                            });
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),

                        /*   ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Menu()),
                              );
                            },
                            child: const Text('skip')),*/
                        // Register button
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                colorAcent, // Couleur du texte et de l'icône
                            textStyle: const TextStyle(
                              fontSize: 18, // Taille du texte
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12), // Padding du bouton
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Rayon du bord arrondi
                            ),
                          ),
                          onPressed: () {
                            if (!agreeTerms!) {
                              if (Localizations.localeOf(context)
                                      .languageCode ==
                                  'en') {
                                showErrorSnackbar(
                                    'You must accept the terms and conditions',
                                    profilScaffoldMessengerKey);
                              } else {
                                showErrorSnackbar(
                                    'Vous devez accepter les termes et conditions',
                                    profilScaffoldMessengerKey);
                              }
                            } else if (controller.uniqueKey2.currentState!
                                .validate()) {
                              // Tous les champs sont valides, vous pouvez soumettre le formulaire

                              print(
                                  'Prénom: ${controller.lastNameController.text.trim()}');
                              print(
                                  'Nom: ${controller.firstNameController.text.trim()}');
                              print('Année de naissance: $selectedYear');
                              print('Pays: $selectedCountry');
                              print(
                                  'Ville: ${controller.cityController.text.trim()}');
                              print(
                                  'Numéro de téléphone: ${controller.phoneNumberController.text.trim()}');

                              // Affichez le SnackBar avec le message de succès

                              if (Localizations.localeOf(context)
                                      .languageCode ==
                                  'fr') {
                                showSnackBar('Le formulaire a été soumis');
                              } else {
                                showSnackBar('The form has been submitted');
                              }

                              // Réinitialisez les champs du formulaire
                              Controller.instance.resetForm();
                              // Réinitialisez également la valeur de agreeTerms et les valeurs des listes déroulantes
                              setState(() {
                                agreeTerms = false;
                                selectedYear = null;
                                selectedCountry = null;
                              });

                              _navigateToMenu();
                            }
                          },
                          icon: _isLoading
                              ? SpinKitChasingDots(
                                  size: 30,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: index.isEven
                                            ? Colors.green
                                            : Colors.blue,
                                      ),
                                    );
                                  },
                                )
                              : const Icon(Icons
                                  .save), // Remplacez ceci par votre icône Iconsax
                          label: Text(AppLocalizations.of(context)!.register),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Texts {
  static String firstname(BuildContext context) =>
      AppLocalizations.of(context)!.firstname;
  static String lastname(BuildContext context) =>
      AppLocalizations.of(context)!.lastname;
  static String yearofbirth(BuildContext context) =>
      AppLocalizations.of(context)!.yearofbirth;
  static String country(BuildContext context) =>
      AppLocalizations.of(context)!.country;
  static String city(BuildContext context) =>
      AppLocalizations.of(context)!.city;
  static String phonenumber(BuildContext context) =>
      AppLocalizations.of(context)!.phonenumber;
}
