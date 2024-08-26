import 'dart:convert';

import 'package:dashboard/pages/global_widget/app_form_state.dart';
import 'package:dashboard/pages/global_widget/app_text_form_field.dart';
import 'package:dashboard/pages/global_widget/app_validation.dart';
 
import 'package:flutter/material.dart';

class MissionVision extends StatefulWidget {
  const MissionVision({super.key});

  @override
  State<MissionVision> createState() => _MissionVisionState();
}

class _MissionVisionState extends State<MissionVision> {

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
                
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.nameController,
                  hintText: "Mission Title",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.phoneController,
                  hintText: "Mission Details",
                  validator: _appValidation.validateText,
                  maxLines: 5,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.emailController,
                  hintText: "Vision Title",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.addressController,
                  hintText: "Vision Details",
                  validator: _appValidation.validateText,
                  maxLines: 5,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.academicCertificateController,
                  hintText: "Summary",
                  validator: _appValidation.validateText,
                  ),
                 
                 
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



 
 