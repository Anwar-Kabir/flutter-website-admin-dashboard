import 'dart:convert';

import 'package:dashboard/pages/global_widget/app_form_state.dart';
import 'package:dashboard/pages/global_widget/app_text_form_field.dart';
import 'package:dashboard/pages/global_widget/app_validation.dart';
 
import 'package:flutter/material.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {

 // late AtaGlanceFormState _formState;
  late AppFormState _appFormState;
  late AppValidation _appValidation;

   bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  String? selectedGender;
  String? selectedReligion;
  String? selectedSiblings;
  String? selectedClass;

  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  final List<String> religionOptions = ['Islam', 'Hinduism', 'Christianity', 'Buddhism', 'Other'];
  final List<String> siblingsOptions = ['1', '2', '3'];
  final List<String> classOptions = ['1', '2', '3','4','5,', '6','7','8'];

  @override
  void initState() {
    super.initState();
   // _formState = AtaGlanceFormState();
    _appFormState = AppFormState();
    _appValidation = AppValidation();
  }

  @override
  void dispose() {
    _appFormState.dispose();
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
                  controller: _appFormState.studentNameController,
                  hintText: "Name",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentBirthCerController,
                  hintText: "Birth Certificate",
                  validator: _appValidation.validateText,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentNIDController,
                  hintText: "NID",
                  validator: _appValidation.validateText,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentPassportController,
                  hintText: "Passport",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                // Gender Dropdown
                DropdownButtonFormField<String>(
                  value: selectedGender,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.person),
                    hintText: "Select Gender",
                  ),
                  items: genderOptions
                      .map((gender) => DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  validator: (value) => value == null ? 'Please select gender' : null,
                ),

                 const SizedBox(height: 16),

              
                const SizedBox(height: 16),

                // Religion Dropdown
                DropdownButtonFormField<String>(
                  value: selectedReligion,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: "Select Religion",
                  ),
                  items: religionOptions
                      .map((religion) => DropdownMenuItem<String>(
                            value: religion,
                            child: Text(religion),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedReligion = value;
                    });
                  },
                  validator: (value) => value == null ? 'Please select religion' : null,
                ),
                const SizedBox(height: 16),

                // Siblings Dropdown
                DropdownButtonFormField<String>(
                  value: selectedSiblings,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: "Select Siblings",
                  ),
                  items: siblingsOptions
                      .map((sibling) => DropdownMenuItem<String>(
                            value: sibling,
                            child: Text(sibling),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSiblings = value;
                    });
                  },
                  validator: (value) => value == null ? 'Please select Siblings' : null,
                ),
                
                 const SizedBox(height: 16),

                // Siblings Dropdown
                DropdownButtonFormField<String>(
                  value: selectedClass,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: "Select Class",
                  ),
                  items: classOptions
                      .map((classop) => DropdownMenuItem<String>(
                            value: classop,
                            child: Text(classop),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedClass = value;
                    });
                  },
                  validator: (value) => value == null ? 'Please select Class' : null,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentPhoneController,
                  hintText: "phone",
                  validator: _appValidation.validatePhoneNumber,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentEmailController,
                  hintText: "Email  ",
                  validator: _appValidation.validateEmail,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentPermanateAddressController,
                  hintText: "Permanate Address",
                 
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentPresentController,
                  hintText: "Present Address",
                  
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
          
                AppTextForm(
                assetPath: "assets/icons/mail_light.svg",
                controller: _appFormState.studentBirthController,
                hintText: _appValidation.studentBirth,
                validator: (value) {
                   
                  if (value == null || value.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
                onTap: () async {
                  
                  await _appValidation.selectBirthDate(context);

                  
                  _appFormState.studentBirthController.text = _appValidation.studentBirth;

                  
                  setState(() {});
                },
                readOnly: true,  
              ),
                              

                
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentFatherNameController,
                  hintText: "Father Name",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentFatherNIDController,
                  hintText: "Father NID",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentFatherOccupationController,
                  hintText: "Father Occupation",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                 AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentMotherNameController,
                  hintText: "Mother Name",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                 AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentMotherNIDController,
                  hintText: "Mother NID",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
               
                 AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentMotherOccupationController,
                  hintText: "Mother Occuption",
                  validator: _appValidation.validateText,
                ),
                
                 const SizedBox(height: 16),

                  AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentAdmisionDateController,
                  hintText: _appValidation.selectedAdmissionDate,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an admission date';
                    }
                    return null;
                  },
                  onTap: () async {
                    // Select date and set the selected date to the controller
                    await _appValidation.selectAdmissionDate(context);

                    // Manually update the controller with the selected admission date
                    _appFormState.studentAdmisionDateController.text = _appValidation.selectedAdmissionDate;

                    // Update the UI
                    setState(() {});
                  },
                  readOnly: true, // Prevents the keyboard from showing up
                ),

                 const SizedBox(height: 16),

                 // Password field
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.passwordController,
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

                const SizedBox(height: 16),


                //conform password
                 
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.confirmController,
                  hintText: "Confirm Password",
                  obscureText: !_isConfirmPasswordVisible,
                  maxLines: 1,
                  validator: (value) {
                    if (value != _appFormState.passwordController.text) {
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
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.studentfacebookController,
                  hintText: "Facebook URL",
                  keyboardType: TextInputType.url,
                ),
                 
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



 
 