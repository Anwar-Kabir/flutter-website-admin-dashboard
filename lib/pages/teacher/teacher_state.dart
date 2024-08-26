import 'package:flutter/material.dart';
 

class TeacherFormState {
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController academicCertificateController = TextEditingController();
  final TextEditingController subjectClassController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  

  

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    academicCertificateController.dispose();
    subjectClassController.dispose();
    dateController.dispose();
    designationController.dispose();
    passwordController.dispose();
    confirmController.dispose();
     
  }
}



 