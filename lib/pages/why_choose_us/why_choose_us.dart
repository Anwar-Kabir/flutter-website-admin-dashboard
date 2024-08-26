 

 import 'dart:convert';

import 'package:dashboard/pages/global_widget/app_form_state.dart';
import 'package:dashboard/pages/global_widget/app_text_form_field.dart';
import 'package:dashboard/pages/global_widget/app_validation.dart';
import 'package:flutter/material.dart';

class WhyChooseUs extends StatefulWidget {
  const WhyChooseUs({super.key});

  @override
  State<WhyChooseUs> createState() => _WhyChooseUsState();
}

class _WhyChooseUsState extends State<WhyChooseUs> {
  late AppFormState _appFormState;
  late AppValidation _appValidation;

  List<TextEditingController> _featureControllers = [];
  List<Widget> _featureFields = [];

  @override
  void initState() {
    super.initState();
    _appFormState = AppFormState();
    _appValidation = AppValidation();
    _addNewFeatureField();
  }

  @override
  void dispose() {
    for (var controller in _featureControllers) {
      controller.dispose();
    }
    _appFormState.dispose();
    _appValidation.dispose();
    super.dispose();
  }

  void _addNewFeatureField() {
    final controller = TextEditingController();
    _featureControllers.add(controller);

    final featureField = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Why Choose us [${_featureControllers.length}]",
          filled: true,
          fillColor: Colors.white, // Set text field color to white
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
        ),
        //validator: _appValidation.validateText,
        maxLines: 2,
        onChanged: (value) {
          if (value.isNotEmpty && _featureControllers.last == controller) {
            _addNewFeatureField();
          }
        },
      ),
    );

    setState(() {
      _featureFields.add(featureField);
    });
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
                  hintText: "Why Choose us Title",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.phoneController,
                  hintText: "Why Choose us Details",
                  validator: _appValidation.validateText,
                  maxLines: 5,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.phoneController,
                  hintText: "Why Choose us Summary",
                  validator: _appValidation.validateText,
                  maxLines: 5,
                ),
                ..._featureFields, // Display dynamic feature fields
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

 