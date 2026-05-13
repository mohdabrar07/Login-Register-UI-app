import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController =
      TextEditingController();

  bool isPasswordHidden = true;

  bool isConfirmPasswordHidden = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Form(
  key: _formKey,

  child: Column(
              

              children: [

                const SizedBox(height: 40),

                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                CustomTextField(
                controller: nameController,
                hintText: 'Name',
                icon: Icons.person,

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return 'Name required';
                  }

                  if (RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Name cannot contain numbers';
                  }

                  return null;
                },
              ),

                const SizedBox(height: 20),

                CustomTextField(
                  controller: emailController,
                  hintText: 'Email',
                  icon: Icons.email,

                  validator: (value) {

                    if (value == null || value.isEmpty) {
                      return 'Email required';
                    }

                    if (!value.contains('@') ||
                        !value.contains('.')) {
                      return 'Enter valid email';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  controller: phoneController,
                  hintText: 'Phone Number',
                  icon: Icons.phone,

                  validator: (value) {

                    if (value == null || value.isEmpty) {
                      return 'Phone required';
                    }

                    if (!RegExp(r'^[0-9]{10}$')
                        .hasMatch(value)) {

                      return 'Enter valid 10 digit number';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  icon: Icons.lock,
                  obscureText: isPasswordHidden,

                  validator: (value) {

                    if (value == null || value.isEmpty) {
                      return 'Password required';
                    }

                    if (value.length < 6) {
                      return 'Minimum 6 characters';
                    }

                    return null;
                  },

                  suffixIcon: IconButton(

                    onPressed: () {

                      setState(() {
                        isPasswordHidden =
                            !isPasswordHidden;
                      });

                    },

                    icon: Icon(
                      isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  icon: Icons.lock,
                  obscureText: isConfirmPasswordHidden,

                  validator: (value) {

                    if (value == null || value.isEmpty) {
                      return 'Confirm your password';
                    }

                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }

                    return null;
                  },

                  suffixIcon: IconButton(

                    onPressed: () {

                      setState(() {
                        isConfirmPasswordHidden =
                            !isConfirmPasswordHidden;
                      });

                    },

                    icon: Icon(
                      isConfirmPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                CustomButton(
                  text: 'Register',
                  onPressed: () {

                    if (_formKey.currentState!.validate()) {

                      ScaffoldMessenger.of(context).showSnackBar(

                        const SnackBar(
                          content: Text(
                            'Registration Successful',
                          ),
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    const Text(
                      'Already have an account?',
                    ),

                    TextButton(

                      onPressed: () {

                        Navigator.pop(context);

                      },

                      child: const Text(
                        'Login',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}