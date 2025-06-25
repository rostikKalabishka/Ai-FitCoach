import 'package:ai_fit_coach/common/lib/form_validator.dart';
import 'package:ai_fit_coach/features/auth/bloc/auth_bloc.dart';
import 'package:ai_fit_coach/ui/widgets/custom_textfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Form(
          key: _formKey,
          child: Column(
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
                      validator: (val) => FormValidators.emailValidator(val)),
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
                      validator: (val) =>
                          FormValidators.usernameValidator(val)),
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
                    validator: (val) => FormValidators.passwordValidator(val),
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
                    validator: (val) => FormValidators.confirmPasswordValidator(
                        val, passwordController.text),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              obscuredConfirmedPassword =
                                  !obscuredConfirmedPassword;
                            },
                          );
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
                    onPressed: () {
                      _signUp(context);
                    },
                    child: Text(
                      'Sign Up',
                      style: theme.textTheme.labelSmall,
                    )),
              )
            ],
          ),
        ));
  }

  void _signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(SignUpEvent(
          email: emailController.text,
          password: passwordController.text,
          userName: nameController.text));
    }
  }
}
