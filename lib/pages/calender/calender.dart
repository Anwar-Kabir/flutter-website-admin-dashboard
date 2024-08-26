


import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/pages/global_widget/app_form_state.dart';
import 'package:dashboard/pages/global_widget/app_validation.dart';
import 'package:dashboard/pages/global_widget/app_text_form_field.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  late AppFormState _appFormState;
  late AppValidation _appValidation;

  String? selectedCalenderPdfPath;
  String? selectedHolidayPdfPath;

  String? calenderPdfError;
  String? holidayPdfError;

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

  Future<void> pickPdf({required bool isCalenderPdf}) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        if (kIsWeb) {
          Uint8List? fileBytes = result.files.single.bytes;
          String fileName = result.files.single.name;
          if (isCalenderPdf) {
            selectedCalenderPdfPath = fileName;
          } else {
            selectedHolidayPdfPath = fileName;
          }
        } else {
          String? filePath = result.files.single.path;
          if (filePath != null) {
            String fileName = path.basename(filePath);
            if (isCalenderPdf) {
              selectedCalenderPdfPath = fileName;
            } else {
              selectedHolidayPdfPath = fileName;
            }
          }
        }
        if (isCalenderPdf) {
          calenderPdfError = null;
        } else {
          holidayPdfError = null;
        }
      } else {
        if (isCalenderPdf) {
          calenderPdfError = 'No file selected';
        } else {
          holidayPdfError = 'No file selected';
        }
      }
    } on PlatformException catch (e) {
      if (isCalenderPdf) {
        calenderPdfError = 'Failed to pick PDF file: ${e.message}';
      } else {
        holidayPdfError = 'Failed to pick PDF file: ${e.message}';
      }
    } catch (e) {
      if (isCalenderPdf) {
        calenderPdfError = 'An unexpected error occurred: $e';
      } else {
        holidayPdfError = 'An unexpected error occurred: $e';
      }
    }
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

                // Calendar PDF Picker
                AppTextForm(
                  readOnly: true,
                  controller: _appFormState.calenderpdfController,
                  assetPath: "assets/icons/mail_light.svg",
                  hintText: selectedCalenderPdfPath ?? "Select PDF",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a PDF file';
                    }
                    return null;
                  },
                  onTap: () async {
                    await pickPdf(isCalenderPdf: true);

                    setState(() {
                      if (selectedCalenderPdfPath != null) {
                        _appFormState.calenderpdfController.text = selectedCalenderPdfPath!;
                      } else {
                        _appFormState.calenderpdfController.clear();
                      }
                    });
                  },
                ),
                if (calenderPdfError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      calenderPdfError!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                const SizedBox(height: 16),

                // Holiday PDF Picker
                AppTextForm(
                  readOnly: true,
                  controller: _appFormState.holidaypdfController,
                  assetPath: "assets/icons/mail_light.svg",
                  hintText: selectedHolidayPdfPath ?? "Select PDF",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a PDF file';
                    }
                    return null;
                  },
                  onTap: () async {
                    await pickPdf(isCalenderPdf: false);

                    setState(() {
                      if (selectedHolidayPdfPath != null) {
                        _appFormState.holidaypdfController.text = selectedHolidayPdfPath!;
                      } else {
                        _appFormState.holidaypdfController.clear();
                      }
                    });
                  },
                ),
                if (holidayPdfError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      holidayPdfError!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {
                    if (_appValidation.formKey.currentState?.validate() ?? false) {
                      _appValidation.validateAndSaveForm();
                    } else {
                      setState(() {});
                    }
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

