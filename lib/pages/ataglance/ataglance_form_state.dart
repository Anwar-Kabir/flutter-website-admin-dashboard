// import 'package:dashboard/shared/constants/url.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class AtaGlanceFormState {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   final TextEditingController schoolNameController = TextEditingController();
//   final TextEditingController schoolAddressController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController eiinController = TextEditingController();
//   final TextEditingController establishedController = TextEditingController();
//   final TextEditingController principleNameController = TextEditingController();
//   final TextEditingController chairmanNameController = TextEditingController();
//   final TextEditingController totalTeacherController = TextEditingController();
//   final TextEditingController totalStaffController = TextEditingController();
//   final TextEditingController totalStudentController = TextEditingController();
//   final TextEditingController whatsappController = TextEditingController();
//   final TextEditingController facebookController = TextEditingController();
//   final TextEditingController twitterController = TextEditingController();
//   final TextEditingController youtubeController = TextEditingController();

//   String selectedDate = 'Tap to select date';
//   String? selectedImageBase64;
//   String? imageError;

//   Future<void> selectDate(BuildContext context) async {
//     final DateTime? d = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1971),
//       lastDate: DateTime(2100),
//     );
//     if (d != null) {
//       selectedDate = DateFormat.yMMMMd("en_US").format(d);
//       establishedController.text = selectedDate;
//     }
//   }

//   Future<void> pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);

//     if (image != null) {
//       final bytes = await image.readAsBytes();
//       selectedImageBase64 = base64Encode(bytes);
//       imageError = null;
//     }
//   }
  

//   //==>text validation
//   String? validateText(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'This field is required';
//     }
//     return null;
//   }
  

//   //==>email validation
//   String? validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your email';
//     }
//     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//       return 'Please enter a valid email address';
//     }
//     return null;
//   }
  

//   //==>phone validation
//   String? validatePhoneNumber(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your phone number';
//     }
//     if (!RegExp(r'^\+?1?\d{9,15}$').hasMatch(value)) {
//       return 'Please enter a valid phone number';
//     }
//     return null;
//   }

//   void validateAndSaveForm() {
//     if (selectedImageBase64 == null) {
//       imageError = 'Please select an image';
//     } else {
//       imageError = null;
//     }

//     if (formKey.currentState!.validate() && imageError == null) {
//       // Handle form submission logic here
//       print('Form is valid and ready to submit');
//     }
//   }


//   Future<void> validateAndSaveTwoForm() async {

//     validateAndSaveForm();
    
//     // if (formKey.currentState!.validate()) {
//     //   formKey.currentState?.save();

//       try {
//         final url = Uri.parse('${AppUrl.baseurl}ataglance');
//         final response = await http.post(
//           url,
//           headers: {
//             'Content-Type': 'application/json',
//           },
//           body: jsonEncode({
//             'year_established': establishedController.text,
//             'chairman_name': chairmanNameController.text,
//             'principal_name': principleNameController.text,
//             'total_teachers': totalTeacherController.text,
//             'total_students': totalStudentController.text,
//             'total_staff': totalStaffController.text,
//             'school_name': schoolNameController.text,
//             'eiin_number': eiinController.text,
//             'email': emailController.text,
//             'phone': phoneController.text,
//             'address': schoolAddressController.text,
//             'whats_app': whatsappController.text,
//             'facebook_url': facebookController.text,
//             'twitter_url': twitterController.text,
//             'youtube_url': youtubeController.text,
//             'logo': selectedImageBase64, // Assuming you're sending base64 image
//           }),
//         );

//         if (response.statusCode == 200 || response.statusCode == 201) {
//           final data = jsonDecode(response.body);
//           print('Response: $data');

//           // Handling the response data
//           final message = data['message'];
//           final atAGlance = data['atAGlance'];

//           print('Message: $message');
//           print('At a Glance Data: $atAGlance');

//           // Optionally, you can show a success dialog or redirect the user
//         } else {
//           print('Failed to save form data: ${response.statusCode}');
//           // Handle server error here
//         }
//       } catch (e) {
//         print('Error occurred: $e');
//         // Handle any other errors (e.g., network issues)
//       }
//   }
  


//   void dispose() {
//     schoolNameController.dispose();
//     schoolAddressController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     eiinController.dispose();
//     establishedController.dispose();
//     principleNameController.dispose();
//     chairmanNameController.dispose();
//     totalTeacherController.dispose();
//     totalStaffController.dispose();
//     totalStudentController.dispose();
//     whatsappController.dispose();
//     facebookController.dispose();
//     twitterController.dispose();
//     youtubeController.dispose();
//   }
// }
