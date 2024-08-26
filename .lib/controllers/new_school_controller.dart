 




// import 'dart:io';
// import 'package:dashboard/api_service/api_service.dart';
// import 'package:dashboard/models/new_school_model.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';


// class RegistrationController extends GetxController {
//   var school = School(
//     name: '',
//     address: '',
//     phone: '',
//     email: '',
//     eiin: '',
//     logo: '',
//     password: '',
//     confirmPassword: '',
//   ).obs;

//   final ApiService apiService = ApiService();
//   final ImagePicker picker = ImagePicker();
//   var selectedImage = Rxn<File>();
//   var isPasswordVisible = false.obs;
//   var isConfirmPasswordVisible = false.obs;

//   Future<void> register() async {
//     if (school.value.password.length < 8) {
//       Get.snackbar('Error', 'Password must be at least 8 characters long');
//       return;
//     }

//     if (school.value.password != school.value.confirmPassword) {
//       Get.snackbar('Error', 'Passwords do not match');
//       return;
//     }

//     bool success = await apiService.registerSchool(school.value);
//     if (success) {
//       Get.snackbar('Success', 'School registered successfully');
//     } else {
//       Get.snackbar('Error', 'Failed to register school. Check logs for details.');
//     }
//   }

//   Future<void> pickImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       selectedImage.value = File(pickedFile.path);
//       school.update((val) {
//         val!.logo = pickedFile.path;
//       });
//     }
//   }
// }


import 'dart:io';
import 'package:dashboard/api_service/api_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dashboard/models/new_school_model.dart';

class RegistrationController extends GetxController {
  var school = School(
    name: '',
    address: '',
    phone: '',
    email: '',
    eiin: '',
    logo: '',
    password: '',
    confirmPassword: '',
  ).obs;

  final ApiService apiService = ApiService();
  final ImagePicker picker = ImagePicker();
  var selectedImage = Rxn<File>();
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  Future<bool> register() async {
    if (school.value.password.length < 8) {
      Get.snackbar('Error', 'Password must be at least 8 characters long');
      return false;
    }

    if (school.value.password != school.value.confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match');
      return false;
    }

    bool success = await apiService.registerSchool(school.value);
    if (success) {
      // Clear form fields
      school.update((val) {
        val!.name = '';
        val.address = '';
        val.phone = '';
        val.email = '';
        val.eiin = '';
        val.logo = '';
        val.password = '';
        val.confirmPassword = '';
      });

      // Navigate to login page
      Get.offNamed('/login'); // Replace with your login page route
      return true;
    } else {
      Get.snackbar('Error', 'Failed to register school. Please try again.');
      return false;
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
      school.update((val) {
        val!.logo = pickedFile.path;
      });
    }
  }
}

