import 'package:flutter/material.dart';

class Validators {
  static String? validateFirstName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      if (Localizations.localeOf(context).languageCode == 'en') {
        return 'Firstname is required';
      } else {
        return 'Le prénom est requis'; // Ceci est la version française
      }
    }
    return null;
  }

  static String? validateLastName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      if (Localizations.localeOf(context).languageCode == 'en') {
        return 'Lastname is required';
      } else {
        return 'Le nom de famille est requis'; // Ceci est la version française
      }
    }
    return null;
  }

  static String? validateYear(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      if (Localizations.localeOf(context).languageCode == 'en') {
        return 'Please select a year';
      } else {
        return 'Veuillez sélectionner une année'; // Ceci est la version française
      }
    }
    return null;
  }

  static String? validateCountry(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      if (Localizations.localeOf(context).languageCode == 'en') {
        return 'Please select your country';
      } else {
        return 'Veuillez sélectionner votre pays'; // Ceci est la version française
      }
    }
    return null;
  }

  static String? validateCity(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      if (Localizations.localeOf(context).languageCode == 'en') {
        return 'City is required';
      } else {
        return 'La ville est requise'; // Ceci est la version française
      }
    } else if (!RegExp(r'^[a-zA-Z\s-]*$').hasMatch(value)) {
      if (Localizations.localeOf(context).languageCode == 'en') {
        return 'Invalid city name';
      } else {
        return 'Nom de ville invalide'; // Ceci est la version française
      }
    }
    return null;
  }

  static String? validatePhoneNumber(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      if (Localizations.localeOf(context).languageCode == 'en') {
        return 'Phone number is required';
      } else {
        return 'Le numéro de téléphone est requis'; // Ceci est la version française
      }
    }

    // Vérifiez si le numéro de téléphone est valide
    String pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s./0-9]*$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      if (Localizations.localeOf(context).languageCode == 'en') {
        return 'Please enter a valid phone number';
      } else {
        return 'Veuillez entrer un numéro de téléphone valide'; // Ceci est la version française
      }
    }

    // Vérifiez si le numéro de téléphone a au moins 8 chiffres
    String digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length < 8) {
      if (Localizations.localeOf(context).languageCode == 'en') {
        return 'Phone number must contain at least 8 digits';
      } else {
        return 'Le numéro de téléphone doit contenir au moins 8 chiffres'; // Ceci est la version française
      }
    }

    return null;
  }
}
