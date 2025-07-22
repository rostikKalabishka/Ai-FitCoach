import 'package:ai_fit_coach/common/lib/form_validator.dart';
import 'package:ai_fit_coach/features/auth/bloc/auth_bloc.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/widgets/custom_textfield.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state is AuthSuccess) {
            AutoRouter.of(context).pushAndPopUntil(
                LoaderRoute(isDefaultMethod: true),
                predicate: (_) => false);
          } else if (state is AuthFailure) {}
        },
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 22,
                          ),
                          CustomTextfield(
                            controller: emailController,
                            hintText: S.of(context).email,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icon(Icons.email_outlined,
                                color: theme.colorScheme.primary),
                            validator: (val) =>
                                FormValidators.emailValidator(val),
                          ),
                          const SizedBox(height: 18),
                          CustomTextfield(
                            controller: passwordController,
                            hintText: S.of(context).password,
                            obscureText: obscurePassword,
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: Icon(Icons.lock_outline,
                                color: theme.colorScheme.primary),
                            validator: (val) =>
                                FormValidators.passwordValidator(val),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width * 0.12,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _signIn(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          S.of(context).signIn,
                          style: theme.textTheme.displaySmall
                              ?.copyWith(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _signIn(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            SignInEvent(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
    }
  }
}
