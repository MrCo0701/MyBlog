import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/authentication/presentation/cubits/login/login_cubit.dart';
import 'package:my_blog/features/authentication/presentation/cubits/login/login_state.dart';
import 'package:my_blog/features/authentication/presentation/di/login_di.dart';
import 'package:my_blog/features/authentication/presentation/pages/signup_screen.dart';
import 'package:my_blog/features/authentication/presentation/widgets/button_login_custom.dart';
import 'package:my_blog/features/authentication/presentation/widgets/text_field_login.dart';
import 'package:my_blog/features/authentication/presentation/widgets/text_with_line.dart';
import 'package:my_blog/features/main/presentation/pages/main_container.dart';

import '../di/signup_di.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => loginProvider(),
          child: BlocConsumer<LoginCubit, LoginState>(
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
                            'SingIn...',
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
                        'SingIn Success!',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );

                  Future.delayed(const Duration(seconds: 2));

                  if (context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const MainContainer()),
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
            builder: (context, state) {
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
                                  title: 'Email/Username',
                                  controller: emailController,
                                  type: FieldType.email,
                                ),
                                SizedBox(height: 20),
                                TextFieldLogin(
                                  hintText: 'Enter password',
                                  title: 'Password',
                                  controller: passwordController,
                                  type: FieldType.password,
                                ),
                                SizedBox(height: 20),
                                ButtonTextWithLine(
                                  text: 'Forgot Password',
                                  color: Colors.blueAccent,
                                  size: 14,
                                  onPress: () {},
                                ),
                                SizedBox(height: 30),
                                ButtonLoginCustom(
                                  text: 'Sign In',
                                  onPress: () =>
                                      context.read<LoginCubit>().login(
                                        emailController.text,
                                        passwordController.text,
                                      ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),
                          Center(
                            child: ButtonTextWithLine(
                              text: 'Continue as a guest',
                              color: Colors.black54,
                              size: 16,
                              onPress: () {},
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
                                'Don\'t have an account?',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 5),
                              ButtonTextWithLine(
                                text: 'Sign Up',
                                color: Colors.black45,
                                size: 15,
                                onPress: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BlocProvider(
                                      create: (_) => signUpProvider(),
                                      child: SignupScreen(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
