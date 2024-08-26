import 'dart:convert';

import 'package:dashboard/pages/global_widget/app_form_state.dart';
import 'package:dashboard/pages/global_widget/app_text_form_field.dart';
import 'package:dashboard/pages/global_widget/app_validation.dart';
 
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

 // late AtaGlanceFormState _formState;
  late AppFormState _appFormState;
  late AppValidation _appValidation;

   bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
                
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.nameController,
                  hintText: "Name",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.phoneController,
                  hintText: "phone",
                  validator: _appValidation.validatePhoneNumber,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.emailController,
                  hintText: "Email Address",
                  validator: _appValidation.validateEmail,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.addressController,
                  hintText: "Address",
                 // keyboardType: TextInputType.number,
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.academicCertificateController,
                  hintText: "Principal Name",
                  validator: _appValidation.validateText,
                  keyboardType: TextInputType.number,
                  
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.academicCertificateController,
                  hintText: "Principal Phone",
                  validator: _appValidation.validatePhoneNumber,
                  
                ),
 
                 
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.emailController,
                  hintText: "Principal Email",
                  validator: _appValidation.validateEmail,
                ),

                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.academicCertificateController,
                  hintText: "Admission Contact Person",
                  validator: _appValidation.validateText,
                  keyboardType: TextInputType.number,
                  
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.academicCertificateController,
                  hintText: "Admission Phone",
                  validator: _appValidation.validatePhoneNumber,
                  
                ),
 
                const SizedBox(height: 16),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.emailController,
                  hintText: "Admission Email",
                  validator: _appValidation.validateEmail,
                ),

                 
                              

                
               


                 
                 
          
                
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.academicCertificateController,
                  hintText: "Facebook URL",
                  keyboardType: TextInputType.url,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.academicCertificateController,
                  hintText: "Twitter URL",
                  keyboardType: TextInputType.url,
                ),
                const SizedBox(height: 16),
                 AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.academicCertificateController,
                  hintText: "Youtube",
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



 
 