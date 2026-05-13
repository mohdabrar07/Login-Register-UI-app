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
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  controller: emailController,
                  hintText: 'Email',
                  icon: Icons.email,
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  controller: phoneController,
                  hintText: 'Phone',
                  icon: Icons.phone,
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  icon: Icons.lock,
                  obscureText: isPasswordHidden,

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
                  controller:
                      confirmPasswordController,

                  hintText: 'Confirm Password',

                  icon: Icons.lock,

                  obscureText:
                      isConfirmPasswordHidden,

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
                  onPressed: () {},
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
    );
  }
}