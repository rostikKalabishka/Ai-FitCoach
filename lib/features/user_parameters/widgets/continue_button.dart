import 'package:ai_fit_coach/blocs/settings_cubit/settings_cubit.dart';
import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/bloc/user_parameters_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required this.pageController,
    this.isNextEnabled = false,
    this.isSubmitEnabled = false,
  });

  final bool isNextEnabled;
  final PageController pageController;
  final bool isSubmitEnabled;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserParametersBloc>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: isSubmitEnabled
                  ? () {
                      bloc.add(SubmitParameters(
                          context.read<AuthenticationBloc>().state.user!.id));

                      context.read<SettingsCubit>().setUserParametersScreen();
                    }
                  : isNextEnabled
                      ? () {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text('CONTINUE',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
