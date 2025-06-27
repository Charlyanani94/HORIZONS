import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  static Controller get instance => Get.find();

  //variables
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> uniqueKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> uniqueKey2 = GlobalKey<FormState>(); //libre
  GlobalKey<FormState> uniqueKey3 = GlobalKey<FormState>();
  GlobalKey<FormState> uniqueKey4 = GlobalKey<FormState>();

  void resetForm() {
    uniqueKey3.currentState?.reset();
    // Réinitialisez également les valeurs des contrôleurs de texte
    firstNameController.clear();
    lastNameController.clear();
    cityController.clear();
    phoneNumberController.clear();
  }
}
