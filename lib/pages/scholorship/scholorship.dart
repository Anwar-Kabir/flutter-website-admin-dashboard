 

 import 'dart:convert';

import 'package:dashboard/pages/global_widget/app_form_state.dart';
import 'package:dashboard/pages/global_widget/app_text_form_field.dart';
import 'package:dashboard/pages/global_widget/app_validation.dart';
import 'package:flutter/material.dart';

class Scholorship extends StatefulWidget {
  const Scholorship({super.key});

  @override
  State<Scholorship> createState() => _ScholorshipState();
}

class _ScholorshipState extends State<Scholorship> {
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.nameController,
                  hintText: "Scholorship Title",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.addressController,
                  hintText: "Scholorship Details",
                  validator: _appValidation.validateText,
                  maxLines: 5,
                ),
                const SizedBox(height: 16),

                

               

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffB2DFDB)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Scholorship Event 1"),
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
                    controller: _appFormState.chairmanDetailsController,
                    hintText: "Scholorship Event Title",
                    validator: _appValidation.validateText,
                    maxLines: 1,
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

                    
                  ],
                    ),
                  ),
                ),



                const SizedBox(height: 16),

               

                const SizedBox(height: 16),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffB2DFDB)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Scholorship Event 2"),
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
                    controller: _appFormState.chairmanDetailsController,
                    hintText: "Scholorship Event Title",
                    validator: _appValidation.validateText,
                    maxLines: 1,
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

                    
                  ],
                    ),
                  ),
                ),
            
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _appValidation.validateAndSaveForm();
                      setState(() {});
                    },
                    child: const Text("Save"),
                  ),
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

 