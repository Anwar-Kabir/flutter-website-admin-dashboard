import 'dart:convert';

import 'package:dashboard/pages/global_widget/app_text_form_field.dart';
import 'package:dashboard/pages/global_widget/app_validation.dart';
import 'package:dashboard/pages/teacher/teacher_state.dart';
import 'package:flutter/material.dart';

class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {

 // late AtaGlanceFormState _formState;
  late TeacherFormState _teacherFormState;
  late AppValidation _appValidation;

   bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
   // _formState = AtaGlanceFormState();
    _teacherFormState = TeacherFormState();
    _appValidation = AppValidation();
  }

  @override
  void dispose() {
    _teacherFormState.dispose();
    _appValidation.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Form(
          key: _appValidation.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _appValidation.selectedImageBase64 != null
                            ? MemoryImage(base64Decode(_appValidation.selectedImageBase64!))
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
                    child: Text(
                      _appValidation.imageError!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _teacherFormState.nameController,
                  hintText: "Name",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _teacherFormState.phoneController,
                  hintText: "phone",
                  validator: _appValidation.validatePhoneNumber,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _teacherFormState.emailController,
                  hintText: "Email Address",
                  validator: _appValidation.validateEmail,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _teacherFormState.addressController,
                  hintText: "Address",
                 // keyboardType: TextInputType.number,
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _teacherFormState.academicCertificateController,
                  hintText: "Academic Certificate",
                  validator: _appValidation.validateText,
                  // keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 16),

                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _teacherFormState.subjectClassController,
                  hintText: "Subject Class",
                  validator: _appValidation.validateText,
                   
                ),

                 
                const SizedBox(height: 16),

              

                const SizedBox(height: 16),

                AppTextForm(
                assetPath: "assets/icons/mail_light.svg",
                controller: _teacherFormState.dateController,
                hintText: _appValidation.selectedDate,
                validator: (value) {
                  // Ensure validation only fails if no date is selected
                  if (value == null || value.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
                onTap: () async {
                  // Select date and set the selected date to the controller
                  await _appValidation.selectDate(context);

                  // Manually update the controller with the selected date
                  _teacherFormState.dateController.text = _appValidation.selectedDate;

                  // Remove the validation error for the date field
                  //_appValidation.formKey.currentState?.validate();

                  // Update the UI
                  setState(() {});
                },
                readOnly: true, // Prevents the keyboard from showing up
              ),
                              

                
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _teacherFormState.designationController,
                  hintText: "designation",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),


                 // Password field
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _teacherFormState.passwordController,
                  hintText: "Password",
                  obscureText: !_isPasswordVisible,
                  validator: _appValidation.validatePassword,
                   maxLines: 1,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),


                //conform password
                 
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _teacherFormState.confirmController,
                  hintText: "Confirm Password",
                  obscureText: !_isConfirmPasswordVisible,
                   maxLines: 1,
                  validator: (value) {
                    if (value != _teacherFormState.passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return _appValidation.validatePassword(value);
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),


                const SizedBox(height: 16),
                 
          
                
                const SizedBox(height: 16),
                // AppTextForm(
                //   assetPath: "assets/icons/mail_light.svg",
                //   controller: _teacherFormState.facebookController,
                //   hintText: "Facebook URL",
                //   keyboardType: TextInputType.url,
                // ),
                // const SizedBox(height: 16),
                // AppTextForm(
                //   assetPath: "assets/icons/mail_light.svg",
                //   controller: _teacherFormState.twitterController,
                //   hintText: "Twitter URL",
                //   keyboardType: TextInputType.url,
                // ),
                const SizedBox(height: 16),
                 
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _appValidation.validateAndSaveForm();
                    setState(() {}); 
                  },
                  child: const Text("Save"),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



 
 