import 'package:ai_fit_coach/common/lib/form_validator.dart';
import 'package:ai_fit_coach/features/auth/bloc/auth_bloc.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/widgets/custom_textfield.dart';

import 'package:auto_route/auto_route.dart';

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
  bool obscurePassword = true;
  bool obscuredConfirmedPassword = true;
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
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 16),
                            _buildField(
                              context,
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
                            ),
                            _buildField(
                              context,
                              CustomTextfield(
                                controller: nameController,
                                hintText: S.of(context).username,
                                obscureText: false,
                                keyboardType: TextInputType.name,
                                prefixIcon: Icon(Icons.person,
                                    color: theme.colorScheme.primary),
                                validator: (val) =>
                                    FormValidators.usernameValidator(val),
                              ),
                            ),
                            _buildField(
                              context,
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
                                  color: theme.colorScheme.primary,
                                  icon: Icon(obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                              ),
                            ),
                            _buildField(
                              context,
                              CustomTextfield(
                                controller: confirmYourPassword,
                                hintText: S.of(context).confirmYourPassword,
                                obscureText: obscuredConfirmedPassword,
                                keyboardType: TextInputType.visiblePassword,
                                prefixIcon: Icon(Icons.lock,
                                    color: theme.colorScheme.primary),
                                validator: (val) =>
                                    FormValidators.confirmPasswordValidator(
                                        val, passwordController.text),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscuredConfirmedPassword =
                                          !obscuredConfirmedPassword;
                                    });
                                  },
                                  color: theme.colorScheme.primary,
                                  icon: Icon(obscuredConfirmedPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.12,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => _signUp(context),
                                  child: Text(
                                    S.of(context).signUp,
                                    style: theme.textTheme.displaySmall
                                        ?.copyWith(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }

  Widget _buildField(BuildContext context, Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: child,
      ),
    );
  }

  void _signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(SignUpEvent(
            email: emailController.text,
            password: passwordController.text,
            userName: nameController.text,
          ));
    }
  }
}
