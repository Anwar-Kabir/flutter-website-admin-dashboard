 

 import 'dart:convert';

import 'package:dashboard/pages/global_widget/app_form_state.dart';
import 'package:dashboard/pages/global_widget/app_text_form_field.dart';
import 'package:dashboard/pages/global_widget/app_validation.dart';
import 'package:flutter/material.dart';

class AimObjective extends StatefulWidget {
  const AimObjective({super.key});

  @override
  State<AimObjective> createState() => _AimObjectiveState();
}

class _AimObjectiveState extends State<AimObjective> {
  late AppFormState _appFormState;
  late AppValidation _appValidation;

  

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
                  hintText: "Aim Objective Title",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.phoneController,
                  hintText: "Aim Objective Details",
                  validator: _appValidation.validateText,
                  maxLines: 5,
                ),
                const SizedBox(height: 16),
                 const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.nameController,
                  hintText: "Aim Objective Summary",
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

 