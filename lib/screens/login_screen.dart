import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool isPasswordHidden = true;
  bool isLoading = false;
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

                  const SizedBox(height: 50),

                  Image.asset(
                    'assets/logo.jpg',
                    height: 120,
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// EMAIL FIELD
                  CustomTextField(

                    controller: emailController,

                    hintText: 'Email',

                    icon: Icons.email,

                    validator: (value) {

                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }

                      if (!value.contains('@') ||
                          !value.contains('.')) {

                        return 'Enter valid email';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  /// PASSWORD FIELD
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

                  const SizedBox(height: 10),

                  /// FORGOT PASSWORD
                  Align(

                    alignment: Alignment.centerRight,

                    child: TextButton(

                      onPressed: () {},

                      child: const Text(
                        'Forgot Password?',
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// LOGIN BUTTON
                 isLoading

                ? const CircularProgressIndicator()

                : CustomButton(

                    text: 'Login',

                    onPressed: () async {

                      if (_formKey.currentState!.validate()) {

                        setState(() {

                          isLoading = true;

                        });

                        await Future.delayed(

                          const Duration(seconds: 2),
                        );

                        setState(() {

                          isLoading = false;

                        });

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (context) =>
                                const HomeScreen(),
                          ),
                        );
                      }
                    },
                  ),

                  const SizedBox(height: 20),

                  /// REGISTER NAVIGATION
                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [

                      const Text(
                        "Don't have an account?",
                      ),

                      TextButton(

                        onPressed: () {

                          Navigator.push(

                            context,

                            MaterialPageRoute(

                              builder: (context) =>
                              const RegisterScreen(),
                            ),
                          );
                        },

                        child: const Text(
                          'Register',
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