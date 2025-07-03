import 'package:ai_fit_coach/common/lib/form_validator.dart';
import 'package:ai_fit_coach/features/auth/bloc/auth_bloc.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    super.key,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? _errorMsg;
  bool obscurePassword = true;
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.width * 0.12,
                    child: CustomTextfield(
                      controller: emailController,
                      hintText: S.of(context).email,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email_outlined),
                      errorMsg: _errorMsg,
                      validator: (val) => FormValidators.emailValidator(val),
                    ),
                  ),
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.width * 0.12,
                    child: CustomTextfield(
                      controller: passwordController,
                      hintText: S.of(context).password,
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
              ]),
              Padding(
                padding: const EdgeInsets.only(bottom: 58),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.width * 0.12,
                  child: ElevatedButton(
                      onPressed: () {
                        _signIn(context);
                      },
                      child: Text(
                        S.of(context).signIn,
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 18),
                      )),
                ),
              ),
            ],
          ),
        ));
  }

  void _signIn(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            SignInEvent(
                email: emailController.text, password: passwordController.text),
          );
    }
  }
}
