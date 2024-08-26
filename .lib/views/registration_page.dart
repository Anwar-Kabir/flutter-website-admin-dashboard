 



// import 'package:dashboard/controllers/new_school_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class RegistrationPage extends StatelessWidget {
//   final RegistrationController controller = Get.put(RegistrationController());
//   final _formKey = GlobalKey<FormState>();

//   RegistrationPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('School Registration'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextFormField(
//                   onChanged: (value) => controller.school.update((val) => val!.name = value),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the name';
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(labelText: 'Name'),
//                 ),
//                 TextFormField(
//                   onChanged: (value) => controller.school.update((val) => val!.address = value),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the address';
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(labelText: 'Address'),
//                 ),
//                 TextFormField(
//                   onChanged: (value) => controller.school.update((val) => val!.phone = value),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the phone number';
//                     }
//                     // Additional phone number validation logic can be added here
//                     return null;
//                   },
//                   decoration: const InputDecoration(labelText: 'Phone'),
//                 ),
//                 TextFormField(
//                   onChanged: (value) => controller.school.update((val) => val!.email = value),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the email';
//                     }
//                     // Additional email validation logic can be added here
//                     return null;
//                   },
//                   decoration: const InputDecoration(labelText: 'Email'),
//                 ),
//                 TextFormField(
//                   onChanged: (value) => controller.school.update((val) => val!.eiin = value),
//                   decoration: const InputDecoration(labelText: 'EIIN (Optional)'),
//                 ),
//                 Obx(() => controller.selectedImage.value == null
//                     ? Container()
//                     : Image.file(controller.selectedImage.value!)),
//                 ElevatedButton(
//                   onPressed: () => controller.pickImage(),
//                   child: const Text('Pick Image'),
//                 ),
//                 Obx(() => TextFormField(
//                   onChanged: (value) => controller.school.update((val) => val!.password = value),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the password';
//                     }
//                     if (value.length < 8) {
//                       return 'Password must be at least 8 characters long';
//                     }
//                     return null;
//                   },
//                   obscureText: !controller.isPasswordVisible.value,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         controller.isPasswordVisible.value
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
//                       },
//                     ),
//                   ),
//                 )),
//                 Obx(() => TextFormField(
//                   onChanged: (value) => controller.school.update((val) => val!.confirmPassword = value),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please confirm the password';
//                     }
//                     if (value != controller.school.value.password) {
//                       return 'Passwords do not match';
//                     }
//                     return null;
//                   },
//                   obscureText: !controller.isConfirmPasswordVisible.value,
//                   decoration: InputDecoration(
//                     labelText: 'Confirm Password',
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         controller.isConfirmPasswordVisible.value
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         controller.isConfirmPasswordVisible.value =
//                             !controller.isConfirmPasswordVisible.value;
//                       },
//                     ),
//                   ),
//                 )),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       controller.register();
//                     }
//                   },
//                   child: const Text('Register'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:dashboard/controllers/new_school_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());
  final _formKey = GlobalKey<FormState>();

  RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) => controller.school.update((val) => val!.name = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  onChanged: (value) => controller.school.update((val) => val!.address = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the address';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
                TextFormField(
                  onChanged: (value) => controller.school.update((val) => val!.phone = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the phone number';
                    }
                    // Additional phone number validation logic can be added here
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Phone'),
                ),
                TextFormField(
                  onChanged: (value) => controller.school.update((val) => val!.email = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the email';
                    }
                    // Additional email validation logic can be added here
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  onChanged: (value) => controller.school.update((val) => val!.eiin = value),
                  decoration: const InputDecoration(labelText: 'EIIN (Optional)'),
                ),
                Obx(() => controller.selectedImage.value == null
                    ? Container()
                    : Image.file(controller.selectedImage.value!)),
                ElevatedButton(
                  onPressed: () => controller.pickImage(),
                  child: const Text('Pick Image'),
                ),
                Obx(() => TextFormField(
                  onChanged: (value) => controller.school.update((val) => val!.password = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  obscureText: !controller.isPasswordVisible.value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
                      },
                    ),
                  ),
                )),
                Obx(() => TextFormField(
                  onChanged: (value) => controller.school.update((val) => val!.confirmPassword = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm the password';
                    }
                    if (value != controller.school.value.password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  obscureText: !controller.isConfirmPasswordVisible.value,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isConfirmPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        controller.isConfirmPasswordVisible.value =
                            !controller.isConfirmPasswordVisible.value;
                      },
                    ),
                  ),
                )),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool success = await controller.register();
                      if (!success) {
                        Get.snackbar('Error', 'Failed to register school. Please try again.');
                      }
                    }
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

