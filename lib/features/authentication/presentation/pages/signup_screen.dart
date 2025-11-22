import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/button_login_custom.dart';
import '../widgets/text_field_login.dart';
import '../widgets/text_with_line.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final userNameController = TextEditingController();
    final fullNameController = TextEditingController();
    final passwordController = TextEditingController();
    final passAgainController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/background/background_login.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80),
                    // * Logo
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo/logoB.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 70,
                      width: 70,
                    ),
                    SizedBox(height: 40),

                    Text(
                      'Sign In.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(height: 20),

                    // * Form
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldLogin(
                            hintText: 'Enter your email here',
                            title: 'Email',
                            controller: emailController,
                          ),
                          SizedBox(height: 20),
                          TextFieldLogin(
                            hintText: 'Enter your username here',
                            title: 'Username',
                            controller: emailController,
                          ),
                          SizedBox(height: 20),
                          TextFieldLogin(
                            hintText: 'Enter your full name here',
                            title: 'User\'s full name',
                            controller: emailController,
                          ),
                          SizedBox(height: 20),
                          TextFieldLogin(
                            hintText: 'Enter password',
                            title: 'Password',
                            controller: emailController,
                          ),
                          SizedBox(height: 20),
                          TextFieldLogin(
                            hintText: 'Re-enter password',
                            title: 'Confirm Password',
                            controller: emailController,
                          ),
                          SizedBox(height: 30),
                          ButtonLoginCustom(text: 'Sign In', onPress: () {}),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.2),
                      height: 2,
                    ),

                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Already a member?',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 5),
                        ButtonTextWithLine(
                          text: 'Sign In',
                          color: Colors.black,
                          size: 16,
                          onPress: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
