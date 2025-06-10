import 'package:ai_fit_coach/ui/widgets/custom_textfield/custom_textfield.dart';
import 'package:ai_fit_coach/ui/widgets/custom_textfield/regexp_strings.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? _errorMsg;
  bool obscurePassword = true;
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
                          if (obscurePassword) {
                            iconPassword = Icons.visibility_off;
                          } else {
                            iconPassword = Icons.visibility;
                          }
                        });
                      },
                      icon: Icon(iconPassword)),
                ),
              ),
            ),
            SizedBox(
              height: 108,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85
              ,
              height: MediaQuery.of(context).size.width * 0.12,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Sign In',
                    style: themeDark.textTheme.labelSmall,
                  )),
            )
          ],
        ));
  }
}
