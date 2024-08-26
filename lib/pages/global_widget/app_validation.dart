import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io' as io show Platform;
import 'dart:typed_data';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;

class AppValidation {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController dateController = TextEditingController();
  final TextEditingController admissionDateController = TextEditingController();
  final TextEditingController studentBirthController = TextEditingController();

  String selectedDate = 'Tap to select date';
  String selectedAdmissionDate = 'Tap to select admission date';
  String studentBirth = 'Tap to select Birth date';
  String? selectedImageBase64;
  String? imageError;

  String? selectedPdfPath;
  String? pdfError;

  String? selectedCalenderPdfPath;
  String? selectedHolidayPdfPath;

  String? calenderPdfError;
  String? holidayPdfError;

  //pdf pick
  Future<void> pickPdf() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        if (kIsWeb) {
          // Web-specific handling
          Uint8List? fileBytes = result.files.single.bytes;
          String fileName = result.files.single.name;
          selectedPdfPath = fileName;
          // Optionally, handle the fileBytes as needed
        } else {
          // Android/iOS handling
          String? filePath = result.files.single.path;

          if (filePath != null) {
            // Extract just the file name from the full path
            String fileName = path.basename(filePath);
            selectedPdfPath = fileName;
          }
        }
        pdfError = null; // Clear the error if a file was successfully picked
      } else {
        pdfError = 'No file selected';
      }
    } on PlatformException catch (e) {
      pdfError = 'Failed to pick PDF file: ${e.message}';
    } catch (e) {
      pdfError = 'An unexpected error occurred: $e';
    }
  }

  //date pick
  Future<void> selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1971),
      lastDate: DateTime(2100),
    );
    if (d != null) {
      selectedDate = DateFormat.yMMMMd("en_US").format(d);
      dateController.text = selectedDate;
    }
  }

  //admisstion date
  Future<void> selectAdmissionDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1971),
      lastDate: DateTime(2100),
    );
    if (d != null) {
      selectedAdmissionDate = DateFormat.yMMMMd("en_US").format(d);
      admissionDateController.text =
          selectedAdmissionDate; // Update admission date controller
    }
  }

  //birth day pick
  Future<void> selectBirthDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1971),
      lastDate: DateTime(2100),
    );
    if (d != null) {
      studentBirth = DateFormat.yMMMMd("en_US").format(d);
      studentBirthController.text =
          studentBirth; // Update admission date controller
    }
  }

  //image pick
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final bytes = await image.readAsBytes();
      selectedImageBase64 = base64Encode(bytes);
      imageError = null;
    }
  }

  //password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  //text
  String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  //email
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  //phone
  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!RegExp(r'^\+?1?\d{9,15}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  //validateAndSaveForm
  // void validateAndSaveForm() {
  //   if (selectedImageBase64 == null) {
  //     imageError = 'Please select an image';
  //   } else {
  //     imageError = null;
  //   }

  //   if (selectedPdfPath == null) {
  //     pdfError = 'Please select a PDF file';
  //   } else {
  //     pdfError = null;
  //   }

  //   if (formKey.currentState!.validate() &&
  //       imageError == null &&
  //       pdfError == null) {
  //     print('Form is valid and ready to submit');
  //   }
  // }

  bool validateAndSaveForm() {
    bool isValid = true;

    if (selectedImageBase64 == null) {
      imageError = 'Please select an image';
      isValid = false;
    } else {
      imageError = null;
    }

    if (selectedPdfPath == null) {
      pdfError = 'Please select a PDF file';
      isValid = false;
    } else {
      pdfError = null;
    }

    if (formKey.currentState!.validate() && isValid) {
      print('Form is valid and ready to submit');
      return true;
    }

    return false;
  }

  void dispose() {
    dateController.dispose();
  }
}



 