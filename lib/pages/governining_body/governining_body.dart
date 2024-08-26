import 'dart:convert';

import 'package:dashboard/pages/global_widget/app_form_state.dart';
import 'package:dashboard/pages/global_widget/app_text_form_field.dart';
import 'package:dashboard/pages/global_widget/app_validation.dart';
 
import 'package:flutter/material.dart';

class GoverniningBody extends StatefulWidget {
  const GoverniningBody({super.key});

  @override
  State<GoverniningBody> createState() => _GoverniningBodyState();
}

class _GoverniningBodyState extends State<GoverniningBody> {

 // late AtaGlanceFormState _formState;
  late AppFormState _appFormState;
  late AppValidation _appValidation;



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
                  controller: _appFormState.nameController,
                  hintText: "Name",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.designationController,
                  hintText: "Designation",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.gbphoneController,
                  hintText: "Phone",
                  validator: _appValidation.validatePhoneNumber,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.gbemailController,
                  hintText: "Email",
                  validator: _appValidation.validateEmail,
                ),
                const SizedBox(height: 16),
                 
                 
                AppTextForm(
                assetPath: "assets/icons/mail_light.svg",
                controller: _appFormState.dateController,
                hintText: _appValidation.selectedDate,
                validator: (value) {
                   
                  if (value == null || value.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
                onTap: () async {
                  
                  await _appValidation.selectDate(context);

                  
                  _appFormState.dateController.text = _appValidation.selectedDate;

                  
                  setState(() {});
                },
                readOnly: true,  
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



 
 