import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class RegPage extends StatefulWidget {
  const RegPage({Key? key}) : super(key: key);

  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  var focusNodeEmail = FocusNode();
  var focusNodePassword = FocusNode();
  var focusNodeSchoolName = FocusNode();
  var focusNodeSchoolAddress = FocusNode();
  var focusNodeSchoolPhone = FocusNode();
  var focusNodeEIIN = FocusNode();
  var focusNodeConfirmPassword = FocusNode();

  bool isFocusedEmail = false;
  bool isFocusedPassword = false;
  bool isFocusedSchoolName = false;
  bool isFocusedSchoolAddress = false;
  bool isFocusedSchoolPhone = false;
  bool isFocusedEIIN = false;
  bool isFocusedConfirmPassword = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController schoolAddressController = TextEditingController();
  TextEditingController schoolPhoneController = TextEditingController();
  TextEditingController eiinController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    focusNodeEmail.addListener(() {
      setState(() {
        isFocusedEmail = focusNodeEmail.hasFocus;
      });
    });
    focusNodePassword.addListener(() {
      setState(() {
        isFocusedPassword = focusNodePassword.hasFocus;
      });
    });
    focusNodeSchoolName.addListener(() {
      setState(() {
        isFocusedSchoolName = focusNodeSchoolName.hasFocus;
      });
    });
    focusNodeSchoolAddress.addListener(() {
      setState(() {
        isFocusedSchoolAddress = focusNodeSchoolAddress.hasFocus;
      });
    });
    focusNodeSchoolPhone.addListener(() {
      setState(() {
        isFocusedSchoolPhone = focusNodeSchoolPhone.hasFocus;
      });
    });
    focusNodeEIIN.addListener(() {
      setState(() {
        isFocusedEIIN = focusNodeEIIN.hasFocus;
      });
    });
    focusNodeConfirmPassword.addListener(() {
      setState(() {
        isFocusedConfirmPassword = focusNodeConfirmPassword.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    focusNodeSchoolName.dispose();
    focusNodeSchoolAddress.dispose();
    focusNodeSchoolPhone.dispose();
    focusNodeEIIN.dispose();
    focusNodeConfirmPassword.dispose();
    super.dispose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    String pattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  String? validateSchoolName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter school name';
    }
    return null;
  }

  String? validateSchoolAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter school address';
    }
    return null;
  }

  String? validateSchoolPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter school phone number';
    }
    return null;
  }

  String? validateEIIN(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter EIIN number';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      delay: const Duration(milliseconds: 900),
                      duration: const Duration(milliseconds: 1000),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    FadeInDown(
                      delay: const Duration(milliseconds: 800),
                      duration: const Duration(milliseconds: 900),
                      child: const Text(
                        "Let's Sign You Up",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    FadeInDown(
                      delay: const Duration(milliseconds: 700),
                      duration: const Duration(milliseconds: 800),
                      child: const Text(
                        'Welcome.',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 700),
                      child: const Text(
                        'You\'ve been missed!',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const SizedBox(height: 16),
                    const SizedBox(height: 16),
                    FadeInDown(
                      delay: const Duration(milliseconds: 400),
                      duration: const Duration(milliseconds: 500),
                      child: const Text(
                        'School Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 300),
                      duration: const Duration(milliseconds: 400),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isFocusedSchoolName
                              ? Colors.white
                              : const Color(0xFFF1F0F5),
                          border: Border.all(
                              width: 1, color: const Color(0xFFD2D2D4)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isFocusedSchoolName
                              ? [
                                  BoxShadow(
                                    color:
                                        const Color(0xFF835DF1).withOpacity(.3),
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                  ),
                                ]
                              : [],
                        ),
                        child: TextFormField(
                          controller: schoolNameController,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'School Name',
                          ),
                          focusNode: focusNodeSchoolName,
                          validator: validateSchoolName,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(focusNodeSchoolAddress),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    FadeInDown(
                      delay: const Duration(milliseconds: 300),
                      duration: const Duration(milliseconds: 400),
                      child: const Text(
                        'School Address',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isFocusedSchoolAddress
                              ? Colors.white
                              : const Color(0xFFF1F0F5),
                          border: Border.all(
                              width: 1, color: const Color(0xFFD2D2D4)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isFocusedSchoolAddress
                              ? [
                                  BoxShadow(
                                    color:
                                        const Color(0xFF835DF1).withOpacity(.3),
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                  ),
                                ]
                              : [],
                        ),
                        child: TextFormField(
                          controller: schoolAddressController,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'School Address',
                          ),
                          focusNode: focusNodeSchoolAddress,
                          validator: validateSchoolAddress,
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(focusNodeSchoolPhone),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    FadeInDown(
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 300),
                      child: const Text(
                        'School Phone',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 100),
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isFocusedSchoolPhone
                              ? Colors.white
                              : const Color(0xFFF1F0F5),
                          border: Border.all(
                              width: 1, color: const Color(0xFFD2D2D4)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isFocusedSchoolPhone
                              ? [
                                  BoxShadow(
                                    color:
                                        const Color(0xFF835DF1).withOpacity(.3),
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                  ),
                                ]
                              : [],
                        ),
                        child: TextFormField(
                          controller: schoolPhoneController,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'School Phone',
                          ),
                          focusNode: focusNodeSchoolPhone,
                          validator: validateSchoolPhone,
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(focusNodeEIIN),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    FadeInDown(
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 300),
                      child: const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 100),
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isFocusedEmail
                              ? Colors.white
                              : const Color(0xFFF1F0F5),
                          border: Border.all(
                              width: 1, color: const Color(0xFFD2D2D4)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isFocusedEmail
                              ? [
                                  BoxShadow(
                                    color:
                                        const Color(0xFF835DF1).withOpacity(.3),
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                  ),
                                ]
                              : [],
                        ),
                        child: TextFormField(
                          controller: emailController,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Your Email',
                          ),
                          focusNode: focusNodeEmail,
                          validator: validateEmail,
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(focusNodePassword),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 100),
                      duration: const Duration(milliseconds: 200),
                      child: const Text(
                        'EIIN Number',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    FadeInDown(
                      duration: const Duration(milliseconds: 100),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isFocusedEIIN
                              ? Colors.white
                              : const Color(0xFFF1F0F5),
                          border: Border.all(
                              width: 1, color: const Color(0xFFD2D2D4)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isFocusedEIIN
                              ? [
                                  BoxShadow(
                                    color:
                                        const Color(0xFF835DF1).withOpacity(.3),
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                  ),
                                ]
                              : [],
                        ),
                        child: TextFormField(
                          controller: eiinController,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'EIIN Number',
                          ),
                          focusNode: focusNodeEIIN,
                          validator: validateEIIN,
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(focusNodeConfirmPassword),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 600),
                      child: const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 400),
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isFocusedPassword
                              ? Colors.white
                              : const Color(0xFFF1F0F5),
                          border: Border.all(
                              width: 1, color: const Color(0xFFD2D2D4)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isFocusedPassword
                              ? [
                                  BoxShadow(
                                    color:
                                        const Color(0xFF835DF1).withOpacity(.3),
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                  ),
                                ]
                              : [],
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                          focusNode: focusNodePassword,
                          validator: validatePassword,
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                          obscureText: !_isPasswordVisible,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(focusNodeSchoolName),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    FadeInDown(
                      duration: const Duration(milliseconds: 100),
                      child: const Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    FadeInDown(
                      duration: const Duration(milliseconds: 100),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isFocusedConfirmPassword
                              ? Colors.white
                              : const Color(0xFFF1F0F5),
                          border: Border.all(
                              width: 1, color: const Color(0xFFD2D2D4)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isFocusedConfirmPassword
                              ? [
                                  BoxShadow(
                                    color:
                                        const Color(0xFF835DF1).withOpacity(.3),
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                  ),
                                ]
                              : [],
                        ),
                        child: TextFormField(
                          controller: confirmPasswordController,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isConfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isConfirmPasswordVisible =
                                      !_isConfirmPasswordVisible;
                                });
                              },
                            ),
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
                          ),
                          focusNode: focusNodeConfirmPassword,
                          validator: validateConfirmPassword,
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                          obscureText: !_isConfirmPasswordVisible,
                          textInputAction: TextInputAction.done,
                         // onEditingComplete: () => _submitForm(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    FadeInUp(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 700),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              //onPressed: _submitForm,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                              child: FadeInUp(
                                delay: const Duration(milliseconds: 700),
                                duration: const Duration(milliseconds: 800),
                                child: const Text('Sign Up'),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Satoshi',
                                ),
                                backgroundColor: const Color(0xFF835DF1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    FadeInUp(
                      delay: const Duration(milliseconds: 800),
                      duration: const Duration(milliseconds: 900),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Already have an account? Sign In here.',
                          style: TextStyle(
                            color: Color(0xFF835DF1),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void _submitForm() {
  //   // Validate form fields
  //   if (emailController.text.isEmpty) {
  //     // Handle empty email field
  //     return;
  //   }
  //   if (passwordController.text.isEmpty) {
  //     // Handle empty password field
  //     return;
  //   }
  //   if (schoolNameController.text.isEmpty) {
  //     // Handle empty school name field
  //     return;
  //   }
  //   if (schoolAddressController.text.isEmpty) {
  //     // Handle empty school address field
  //     return;
  //   }
  //   if (schoolPhoneController.text.isEmpty) {
  //     // Handle empty school phone field
  //     return;
  //   }
  //   if (eiinController.text.isEmpty) {
  //     // Handle empty EIIN field
  //     return;
  //   }
  //   if (confirmPasswordController.text.isEmpty) {
  //     // Handle empty confirm password field
  //     return;
  //   }

  //   // Perform registration logic here
  //   // For example, you can navigate to another screen or perform API calls
  // }
}
