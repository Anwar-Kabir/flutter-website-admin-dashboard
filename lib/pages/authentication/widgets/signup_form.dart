// import 'dart:convert';
// import 'package:dashboard/api_service/api_servoice.dart';
// import 'package:flutter/material.dart';

// import 'package:dashboard/pages/global_widget/app_form_state.dart';
// import 'package:dashboard/pages/global_widget/app_text_form_field.dart';
// import 'package:dashboard/pages/global_widget/app_validation.dart';
// import 'package:dashboard/pages/global_widget/labelwithasterisk.dart';
// import 'package:dashboard/theme/app_colors.dart';
// import 'package:http/http.dart' as http;

// class SignupForm extends StatefulWidget {
//   const SignupForm({super.key});

//   @override
//   State<SignupForm> createState() => _SignupFormState();
// }

// class _SignupFormState extends State<SignupForm> {
//   late AppFormState _appFormState;
//   late AppValidation _appValidation;

//   bool _isLoading = false;
//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;

//   @override
//   void initState() {
//     super.initState();
//     _appFormState = AppFormState();
//     _appValidation = AppValidation();
//   }

//   @override
//   void dispose() {
//     _appFormState.dispose();
//     _appValidation.dispose();
//     super.dispose();
//   }



//   Future<void> _registerSchool() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final url = Uri.parse('http://localhost:8000/api/register');
//     final headers = {'Content-Type': 'application/json'};
//     final body = json.encode({
//       'name': _appFormState.schoolNameController.text,
//       'address': _appFormState.schoolAddressController.text,
//       'phone': _appFormState.phoneController.text,
//       'email': _appFormState.emailController.text,
//       'eiin': _appFormState.eiinController.text,
//       'password': _appFormState.passwordController.text,
//       'image': _appValidation.selectedImageBase64,
//     });

//     try {
//       final response = await http.post(url, headers: headers, body: body);

//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         // Handle the success response
//         print('Registration Successful');
//         print('Token: ${responseData['token']}');
//         print('School ID: ${responseData['school']['id']}');
//         // You can navigate to another screen or show a success message here
//       } else {
//         // Handle the error response
//         print('Registration Failed');
//         print('Error: ${response.body}');
//         // Show an error message to the user
//       }
//     } catch (error) {
//       // Handle any exceptions
//       print('An error occurred: $error');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SizedBox(
//         child: Form(
//           key: _appValidation.formKey,
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 16),
//                   Center(
//                     child: Stack(
//                       children: [
//                         CircleAvatar(
//                           radius: 50,
//                           backgroundImage: _appValidation.selectedImageBase64 !=
//                                   null
//                               ? MemoryImage(base64Decode(
//                                   _appValidation.selectedImageBase64!))
//                               : const AssetImage('assets/icons/mail_light.svg')
//                                   as ImageProvider,
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           right: 0,
//                           child: InkWell(
//                             onTap: () async {
//                               await _appValidation.pickImage();
//                               setState(() {});
//                             },
//                             child: CircleAvatar(
//                               radius: 18,
//                               backgroundColor: Colors.grey.shade200,
//                               child: Icon(
//                                 Icons.camera_alt,
//                                 color: Colors.grey.shade800,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   if (_appValidation.imageError != null)
//                     Padding(
//                       padding: const EdgeInsets.only(top: 8.0),
//                       child: Center(
//                         child: Text(
//                           _appValidation.imageError!,
//                           style: const TextStyle(color: Colors.red),
//                         ),
//                       ),
//                     ),
//                   const SizedBox(height: 16),
//                   const LabelWithAsterisk(labelText: "School Name"),
//                   const SizedBox(height: 5),
//                   AppTextForm(
//                     assetPath: "assets/icons/mail_light.svg",
//                     controller: _appFormState.schoolNameController,
//                     hintText: "School Name",
//                     validator: _appValidation.validateText,
//                     fillColor: AppColors.bgLight,
//                     hoverColor: AppColors.bgLight,
//                   ),
//                   const SizedBox(height: 16),
//                   const LabelWithAsterisk(labelText: "School Address"),
//                   const SizedBox(height: 5),
//                   AppTextForm(
//                     assetPath: "assets/icons/mail_light.svg",
//                     controller: _appFormState.schoolAddressController,
//                     hintText: "School Address",
//                     validator: _appValidation.validateText,
//                     fillColor: AppColors.bgLight,
//                     hoverColor: AppColors.bgLight,
//                   ),
//                   const SizedBox(height: 16),
//                   const LabelWithAsterisk(labelText: "Email"),
//                   const SizedBox(height: 5),
//                   AppTextForm(
//                     assetPath: "assets/icons/mail_light.svg",
//                     controller: _appFormState.emailController,
//                     hintText: "Email",
//                     validator: _appValidation.validateEmail,
//                     fillColor: AppColors.bgLight,
//                     hoverColor: AppColors.bgLight,
//                   ),
//                   const SizedBox(height: 16),
//                   const LabelWithAsterisk(labelText: "Phone"),
//                   const SizedBox(height: 5),
//                   AppTextForm(
//                     assetPath: "assets/icons/mail_light.svg",
//                     controller: _appFormState.phoneController,
//                     hintText: "Phone",
//                     keyboardType: TextInputType.number,
//                     validator: _appValidation.validatePhoneNumber,
//                     fillColor: AppColors.bgLight,
//                     hoverColor: AppColors.bgLight,
//                   ),
//                   const SizedBox(height: 16),
//                   const Text("EIIN Number"),
//                   const SizedBox(height: 5),
//                   AppTextForm(
//                     assetPath: "assets/icons/mail_light.svg",
//                     controller: _appFormState.eiinController,
//                     hintText: "EIIN Number",
//                     validator: _appValidation.validateText,
//                     keyboardType: TextInputType.number,
//                     fillColor: AppColors.bgLight,
//                     hoverColor: AppColors.bgLight,
//                   ),
//                   const SizedBox(height: 16),
//                   const LabelWithAsterisk(labelText: "Password"),
//                   const SizedBox(height: 5),
//                   AppTextForm(
//                     assetPath: "assets/icons/mail_light.svg",
//                     controller: _appFormState.passwordController,
//                     hintText: "Password",
//                     obscureText: !_isPasswordVisible,
//                     validator: _appValidation.validatePassword,
//                     fillColor: AppColors.bgLight,
//                     hoverColor: AppColors.bgLight,
//                     maxLines: 1,
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isPasswordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isPasswordVisible = !_isPasswordVisible;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   const LabelWithAsterisk(labelText: "Confirm Password"),
//                   const SizedBox(height: 5),
//                   AppTextForm(
//                     assetPath: "assets/icons/mail_light.svg",
//                     controller: _appFormState.confirmController,
//                     hintText: "Confirm Password",
//                     obscureText: !_isConfirmPasswordVisible,
//                     fillColor: AppColors.bgLight,
//                     hoverColor: AppColors.bgLight,
//                     maxLines: 1,
//                     validator: (value) {
//                       if (value != _appFormState.passwordController.text) {
//                         return 'Passwords do not match';
//                       }
//                       return _appValidation.validatePassword(value);
//                     },
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isConfirmPasswordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isConfirmPasswordVisible =
//                               !_isConfirmPasswordVisible;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 16),
                  
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: _isLoading
//                           ? null
//                           : () {
//                               if (_appValidation.validateAndSaveForm()) {
//                                 _registerSchool();
//                               }
//                             },
//                       child: _isLoading
//                           ? const CircularProgressIndicator()
//                           : const Text("Save"),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:dashboard/pages/global_widget/app_form_state.dart';
import 'package:dashboard/pages/global_widget/app_text_form_field.dart';
import 'package:dashboard/pages/global_widget/app_validation.dart';
import 'package:dashboard/pages/global_widget/labelwithasterisk.dart';
import 'package:dashboard/theme/app_colors.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late AppFormState _appFormState;
  late AppValidation _appValidation;

  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String _errorMessage = ''; // Add this for error messages

  @override
  void initState() {
    super.initState();
    _appFormState = AppFormState();
    _appValidation = AppValidation();
  }

  @override
  void dispose() {
    _appFormState.dispose();
    _appValidation.dispose();
    super.dispose();
  }

  Future<void> _registerSchool() async {
    setState(() {
      _isLoading = true;
      _errorMessage = ''; // Reset the error message
    });

     final url = Uri.parse('http://localhost:8000/api/register');
    //final url = Uri.parse('http://127.0.0.1:8000/api/register');
    //final url = Uri.parse('https://dummyjson.com/posts');

    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'name': _appFormState.schoolNameController.text,
      'address': _appFormState.schoolAddressController.text,
      'phone': _appFormState.phoneController.text,
      'email': _appFormState.emailController.text,
      'eiin': _appFormState.eiinController.text,
      'password': _appFormState.passwordController.text,
      'image': _appValidation.selectedImageBase64,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        // Handle the success response
        print('Registration Successful');
        print('Token: ${responseData['token']}');
        print('School ID: ${responseData['school']['id']}');
        // You can navigate to another screen or show a success message here
      } else {
        // Handle the error response
        print('Registration Failed');
        print('Error: ${response.body}');
        setState(() {
          _errorMessage = 'Registration failed: ${response.body}';
        });
      }
    } catch (error) {
      // Handle any exceptions
      print('An error occurred: $error');
      setState(() {
        _errorMessage = 'An error occurred: $error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Form(
          key: _appValidation.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: _appValidation.selectedImageBase64 !=
                                  null
                              ? MemoryImage(base64Decode(
                                  _appValidation.selectedImageBase64!))
                              : const AssetImage('assets/icons/mail_light.svg')
                                  as ImageProvider,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () async {
                              await _appValidation.pickImage();
                              setState(() {});
                            },
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.grey.shade200,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_appValidation.imageError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(
                        child: Text(
                          _appValidation.imageError!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  const LabelWithAsterisk(labelText: "School Name"),
                  const SizedBox(height: 5),
                  AppTextForm(
                    assetPath: "assets/icons/mail_light.svg",
                    controller: _appFormState.schoolNameController,
                    hintText: "School Name",
                    validator: _appValidation.validateText,
                    fillColor: AppColors.bgLight,
                    hoverColor: AppColors.bgLight,
                  ),
                  const SizedBox(height: 16),
                  const LabelWithAsterisk(labelText: "School Address"),
                  const SizedBox(height: 5),
                  AppTextForm(
                    assetPath: "assets/icons/mail_light.svg",
                    controller: _appFormState.schoolAddressController,
                    hintText: "School Address",
                    validator: _appValidation.validateText,
                    fillColor: AppColors.bgLight,
                    hoverColor: AppColors.bgLight,
                  ),
                  const SizedBox(height: 16),
                  const LabelWithAsterisk(labelText: "Email"),
                  const SizedBox(height: 5),
                  AppTextForm(
                    assetPath: "assets/icons/mail_light.svg",
                    controller: _appFormState.emailController,
                    hintText: "Email",
                    validator: _appValidation.validateEmail,
                    fillColor: AppColors.bgLight,
                    hoverColor: AppColors.bgLight,
                  ),
                  const SizedBox(height: 16),
                  const LabelWithAsterisk(labelText: "Phone"),
                  const SizedBox(height: 5),
                  AppTextForm(
                    assetPath: "assets/icons/mail_light.svg",
                    controller: _appFormState.phoneController,
                    hintText: "Phone",
                    keyboardType: TextInputType.number,
                    validator: _appValidation.validatePhoneNumber,
                    fillColor: AppColors.bgLight,
                    hoverColor: AppColors.bgLight,
                  ),
                  const SizedBox(height: 16),
                  const Text("EIIN Number"),
                  const SizedBox(height: 5),
                  AppTextForm(
                    assetPath: "assets/icons/mail_light.svg",
                    controller: _appFormState.eiinController,
                    hintText: "EIIN Number",
                    validator: _appValidation.validateText,
                    keyboardType: TextInputType.number,
                    fillColor: AppColors.bgLight,
                    hoverColor: AppColors.bgLight,
                  ),
                  const SizedBox(height: 16),
                  const LabelWithAsterisk(labelText: "Password"),
                  const SizedBox(height: 5),
                  AppTextForm(
                    assetPath: "assets/icons/mail_light.svg",
                    controller: _appFormState.passwordController,
                    hintText: "Password",
                    obscureText: !_isPasswordVisible,
                    validator: _appValidation.validatePassword,
                    fillColor: AppColors.bgLight,
                    hoverColor: AppColors.bgLight,
                    maxLines: 1,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const LabelWithAsterisk(labelText: "Confirm Password"),
                  const SizedBox(height: 5),
                  AppTextForm(
                    assetPath: "assets/icons/mail_light.svg",
                    controller: _appFormState.confirmController,
                    hintText: "Confirm Password",
                    obscureText: !_isConfirmPasswordVisible,
                    fillColor: AppColors.bgLight,
                    hoverColor: AppColors.bgLight,
                    maxLines: 1,
                    validator: (value) {
                      if (value != _appFormState.passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return _appValidation.validatePassword(value);
                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () {
                              if (_appValidation.validateAndSaveForm()) {
                                _registerSchool();
                              }
                            },
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const Text("Save"),
                    ),
                  ),
                  if (_errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Center(
                        child: Text(
                          _errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

