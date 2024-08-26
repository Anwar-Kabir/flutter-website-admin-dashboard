import 'package:dashboard/pages/ataglance/ataglance_form_state.dart';
import 'package:dashboard/pages/global_widget/app_form_state.dart';
import 'package:dashboard/pages/global_widget/app_text_form_field.dart';
import 'package:dashboard/pages/global_widget/app_validation.dart';
import 'package:dashboard/pages/global_widget/labelwithasterisk.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class AtaGlance extends StatefulWidget {
  const AtaGlance({super.key});

  @override
  State<AtaGlance> createState() => _AtaGlanceState();
}

class _AtaGlanceState extends State<AtaGlance> {
  
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Text("Basic > At a Glance"),
                const SizedBox(height: 16),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _appValidation.selectedImageBase64 != null
                            ? MemoryImage(
                                base64Decode(
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
                const LabelWithAsterisk(
                  labelText: "School Name",
                ),
                const SizedBox(height: 5),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.schoolNameController,
                  hintText: "School Name",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(
                  labelText: "School Address",
                ),
                const SizedBox(height: 5),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.schoolAddressController,
                  hintText: "School Address",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(
                  labelText: "Email",
                ),
                const SizedBox(height: 5),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.emailController,
                  hintText: "Email ",
                  validator: _appValidation.validateEmail,
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(
                  labelText: "Phone",
                ),
                const SizedBox(height: 5),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.phoneController,
                  hintText: "Phone",
                  keyboardType: TextInputType.number,
                  validator: _appValidation.validatePhoneNumber,
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(
                  labelText: "EIIN Number",
                ),
                const SizedBox(height: 5),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.eiinController,
                  hintText: "EIIN Number",
                  validator: _appValidation.validateText,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(
                  labelText: "Select Date",
                ),
                const SizedBox(height: 5),
                //date pick
                // AppTextForm(
                //   assetPath: "assets/icons/mail_light.svg",
                //   controller: _appFormState.establishedController,
                //   hintText: _appValidation.selectedDate,
                //   validator: _appValidation.validateText,
                //   onTap: () {
                //     _appValidation.selectDate(context);
                //     setState(() {});
                //   },
                // ),

                
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

                    _appFormState.studentBirthController.text =
                        _appValidation.studentBirth;

                    setState(() {});
                  },
                  readOnly: true,
                ),


                const SizedBox(height: 16),
                const LabelWithAsterisk(
                  labelText: "Principal Name",
                ),
                const SizedBox(height: 5),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.principleNameController,
                  hintText: "Principal Name",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(
                  labelText: "Chairman Name",
                ),
                const SizedBox(height: 5),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.chairmanNameController,
                  hintText: "Chairman Name",
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(
                  labelText: "Total Teacher",
                ),
                const SizedBox(height: 5),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.totalTeacherController,
                  hintText: "Total Teacher",
                  validator: _appValidation.validateText,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(
                  labelText: "Total Staff",
                ),
                const SizedBox(height: 5),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.totalStaffController,
                  hintText: "Total Staff",
                  validator: _appValidation.validateText,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(
                  labelText: "Total Students",
                ),
                const SizedBox(height: 5),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.totalStudentController,
                  hintText: "Total Students",
                  validator: _appValidation.validateText,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(
                  labelText: "What's App",
                ),
                const SizedBox(height: 5),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.whatsappController,
                  hintText: "What's App",
                  validator: _appValidation.validatePhoneNumber,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(
                  labelText: "Facebook URL",
                ),
                const SizedBox(height: 5),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.facebookController,
                  hintText: "Facebook URL",
                  keyboardType: TextInputType.url,
                  validator: _appValidation.validateText,
                ),
                const SizedBox(height: 16),
                const Text("Twitter URL"),
                const SizedBox(height: 5),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.twitterController,
                  hintText: "Twitter URL",
                  keyboardType: TextInputType.url,
                ),
                const SizedBox(height: 16),
                const Text("YouTube URL"),
                const SizedBox(height: 5),
                AppTextForm(
                  assetPath: "assets/icons/mail_light.svg",
                  controller: _appFormState.youtubeController,
                  hintText: "YouTube URL",
                  keyboardType: TextInputType.url,
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                       //_formState.validateAndSaveForm();
                        //await _appFormState.validateAndSaveTwoForm();
                        await _appValidation.validateAndSaveForm();

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




 