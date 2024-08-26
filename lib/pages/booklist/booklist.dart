 


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dashboard/pages/global_widget/app_form_state.dart';
import 'package:dashboard/pages/global_widget/app_validation.dart';
import 'package:dashboard/pages/global_widget/app_text_form_field.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  late AppFormState _appFormState;
  late AppValidation _appValidation;

  String? selectedClass;
  final List<String> classOptions = ['1', '2', '3', '4', '5', '6', '7', '8'];

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

                //Class Dropdown
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

                // PDF Picker

                  AppTextForm(
                    readOnly: true,
                    controller: _appFormState.pdfController,
                    assetPath: "assets/icons/mail_light.svg",
                    hintText: _appValidation.selectedPdfPath != null
                        ? _appValidation.selectedPdfPath!
                        : "Select PDF",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a PDF file';
                      }
                      return null;
                    },
                    onTap: () async {
                      await _appValidation.pickPdf();

                      setState(() {
                        if (_appValidation.selectedPdfPath != null) {
                          _appFormState.pdfController.text = _appValidation.selectedPdfPath!;
                        } else {
                          _appFormState.pdfController.clear();
                        }
                      });
                    },
                  ),
                  if (_appValidation.pdfError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _appValidation.pdfError!,
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
