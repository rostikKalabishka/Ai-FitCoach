import 'package:ai_fit_coach/ui/widgets/custom_textfield/custom_textfield.dart';
import 'package:ai_fit_coach/ui/widgets/custom_textfield/regexp_strings.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmYourPassword = TextEditingController();
  String? _errorMsg;
  bool obscurePassword = true;
  bool obscuredConfirmedPassword = true;
  IconData iconPassword = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
        backgroundColor: themeDark.scaffoldBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.width * 0.12,
                child: CustomTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email_outlined),
                  errorMsg: _errorMsg,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please enter something here';
                    } else if (!emailRexExp.hasMatch(val)) {
                      return 'Please enter a correct email';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.width * 0.12,
                child: CustomTextfield(
                  controller: nameController,
                  hintText: 'Username',
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  prefixIcon: Icon(Icons.person),
                  errorMsg: _errorMsg,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please enter something here';
                    } else if (val.length > 30) {
                      return 'Please enter shorter username';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.width * 0.12,
                child: CustomTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: obscurePassword,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icon(Icons.lock_outline),
                  errorMsg: _errorMsg,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please enter something here';
                    } else if (!passwordRexExp.hasMatch(val)) {
                      return 'Please enter a correct password';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      icon: Icon(obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.width * 0.12,
                child: CustomTextfield(
                  controller: confirmYourPassword,
                  hintText: 'Confirm your password',
                  obscureText: obscuredConfirmedPassword,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icon(Icons.lock),
                  errorMsg: _errorMsg,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please enter something here';
                    } else if (passwordController != confirmYourPassword) {
                      return 'Please confirm your password';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscuredConfirmedPassword =
                              !obscuredConfirmedPassword;
                        });
                      },
                      icon: Icon(obscuredConfirmedPassword
                          ? Icons.visibility
                          : Icons.visibility_off)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.width * 0.12,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: themeDark.textTheme.labelSmall,
                  )),
            )
          ],
        ));
  }
}
