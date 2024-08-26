import 'package:flutter/material.dart';
 

class AppFormState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // bool isPasswordVisible = false;
  // bool isConfirmPasswordVisible = false;

  //AT A Glance
  final TextEditingController establishedController = TextEditingController();
  final TextEditingController principleNameController = TextEditingController();
  final TextEditingController totalTeacherController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController twitterController = TextEditingController();
  final TextEditingController youtubeController = TextEditingController();
  final TextEditingController totalStaffController = TextEditingController();
  final TextEditingController totalStudentController = TextEditingController();



 
  //scholl reg
  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController schoolAddressController = TextEditingController();
  final TextEditingController eiinController = TextEditingController();


  //staff
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController academicCertificateController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  //govverniningbody 
  // final TextEditingController gBInfoController = TextEditingController();
  // final TextEditingController gBdetailsController = TextEditingController();
  // final TextEditingController gBSummaryController = TextEditingController();
  final TextEditingController gBNameController = TextEditingController();
  final TextEditingController gBDesignationController = TextEditingController();
  final TextEditingController gbphoneController = TextEditingController();
  final TextEditingController gbemailController = TextEditingController();

  //chairman message
  final TextEditingController chairmanNameController = TextEditingController();
  final TextEditingController chairmanDesignationController = TextEditingController();
  final TextEditingController chairmanPhoneController = TextEditingController();
  final TextEditingController chairmanEmailController = TextEditingController();
  final TextEditingController chairmanoInfoController = TextEditingController();
  final TextEditingController chairmanDetailsController = TextEditingController();
  final TextEditingController chairmanSummaryController = TextEditingController();

  
  //chairman message
  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController studentGenderController = TextEditingController();
  final TextEditingController studentReligionController = TextEditingController();
  final TextEditingController studentBirthCerController = TextEditingController();
  final TextEditingController studentNIDController = TextEditingController();
  final TextEditingController studentPassportController = TextEditingController();
  final TextEditingController studentPhoneController = TextEditingController();
  final TextEditingController studentEmailController = TextEditingController();
  final TextEditingController studentFatherNameController = TextEditingController();
  final TextEditingController studentFatherNIDController = TextEditingController();
  final TextEditingController studentFatherOccupationController = TextEditingController();
  final TextEditingController studentMotherNameController = TextEditingController();
  final TextEditingController studentMotherNIDController = TextEditingController();
  final TextEditingController studentMotherOccupationController = TextEditingController();
  final TextEditingController studentSiblingsController = TextEditingController();
  final TextEditingController studentPermanateAddressController = TextEditingController();
  final TextEditingController studentPresentController = TextEditingController();
  final TextEditingController studentAdmisionDateController = TextEditingController();
  final TextEditingController studentClassAdmissionController = TextEditingController();
  final TextEditingController studentPasswordController = TextEditingController();
  final TextEditingController studentConfirmPasswordController = TextEditingController();
  final TextEditingController studentfacebookController = TextEditingController();
  final TextEditingController studentBirthController = TextEditingController();


  //booklist
  final TextEditingController pdfController = TextEditingController();


  //GuardianOpinion
   final TextEditingController goNameController = TextEditingController();


   //booklist
  final TextEditingController calenderpdfController = TextEditingController();
  final TextEditingController holidaypdfController = TextEditingController();





  void dispose() {
     //==>staff
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    academicCertificateController.dispose();
    dateController.dispose();
    designationController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    //==>govverniningbody 
    // gBInfoController.dispose();
    // gBdetailsController.dispose();
    // gBSummaryController.dispose();
    gBNameController.dispose();
    gBDesignationController.dispose();
     
  }
}



 