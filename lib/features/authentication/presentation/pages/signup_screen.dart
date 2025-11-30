import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/authentication/domain/entity/user.dart';
import 'package:my_blog/features/authentication/presentation/cubits/signup/signup_cubit.dart';
import 'package:my_blog/features/authentication/presentation/cubits/signup/singup_state.dart';
import 'package:my_blog/features/authentication/presentation/di/signup_di.dart';
import 'package:my_blog/features/authentication/presentation/pages/login_screen.dart';
import '../../../main/presentation/pages/main_container.dart';
import '../widgets/button_login_custom.dart';
import '../widgets/text_field_login.dart';
import '../widgets/text_with_line.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final fullNameController = TextEditingController();
    final passwordController = TextEditingController();
    final passAgainController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            state.whenOrNull(
              loading: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(days: 1),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.blueAccent,
                    content: Row(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          'SignUp...',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
              success: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                    content: Text(
                      'SignUp Success!',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );

                Future.delayed(const Duration(seconds: 2));

                if (context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                }
              },
              error: (e) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.red,
                    content: Text(
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      e,
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            );
          },
          builder: (ctx, state) {
            return Stack(
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
                          'Sign Up.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        SizedBox(height: 20),

                        // * Form
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFieldLogin(
                                hintText: 'Enter your email here',
                                title: 'Email',
                                controller: emailController,
                                type: FieldType.email,
                              ),
                              SizedBox(height: 20),
                              TextFieldLogin(
                                hintText: 'Enter your full name here',
                                title: 'User\'s full name',
                                controller: fullNameController,
                                type: FieldType.fullName,
                              ),
                              SizedBox(height: 20),
                              TextFieldLogin(
                                hintText: 'Enter password',
                                title: 'Password',
                                controller: passwordController,
                                type: FieldType.password,
                              ),
                              SizedBox(height: 20),
                              TextFieldLogin(
                                hintText: 'Re-enter password',
                                title: 'Confirm Password',
                                controller: passAgainController,
                                type: FieldType.confirmPassword,
                                compareController: passwordController,
                              ),
                              SizedBox(height: 30),
                              ButtonLoginCustom(
                                text: 'Sign Up',
                                onPress: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<SignUpCubit>().signUp(
                                      UserEntity(
                                        fullName: fullNameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                  }
                                },
                              ),
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
            );
          },
        ),
      ),
    );
  }
}
