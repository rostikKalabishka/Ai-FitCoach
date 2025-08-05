import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/selection_button.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DietPreferencePage extends StatefulWidget {
  final PageController pageController;
  final void Function(String?) onDietSelected;

  const DietPreferencePage({
    super.key,
    required this.pageController,
    required this.onDietSelected,
  });

  @override
  State<DietPreferencePage> createState() => _DietPreferencePageState();
}

class _DietPreferencePageState extends State<DietPreferencePage> {
  String? _selectedDiet;
  bool _isNextEnabled = false;
  final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();

  @override
  void initState() {
    super.initState();
    try {
      analyticsRepository.logScreenView(
        screenName: 'diet_preference_screen',
        screenClass: 'DietPreferencePage',
      );
    } catch (e) {
      debugPrint('Error logging screen view: $e');
    }
  }

  void _toggleDiet(String diet) {
    try {
      setState(() {
        if (_selectedDiet == diet) {
          _selectedDiet = null;
          _isNextEnabled = false;
        } else {
          _selectedDiet = diet;
          _isNextEnabled = true;
        }
      });
      widget.onDietSelected(_selectedDiet);
      analyticsRepository.logEvent(
        name: 'diet_selected',
        parameters: {
          'screen_name': 'diet_preference_screen',
          'diet': _selectedDiet ?? 'none',
          'is_selected': (_selectedDiet != null).toString(),
          'user_id':
              context.read<AuthenticationBloc>().state.user?.id ?? 'unknown',
        },
      );
    } catch (e) {
      debugPrint('Error toggling diet: $e');
      analyticsRepository.logEvent(
        name: 'diet_selection_error',
        parameters: {
          'screen_name': 'diet_preference_screen',
          'diet': diet,
          'error_message': e.toString(),
          'user_id':
              context.read<AuthenticationBloc>().state.user?.id ?? 'unknown',
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).whatTypeOfDietDoYouPrefer,
          style: const TextStyle(fontSize: 20),
        ),
        leading: NavigationBackButton(pageController: widget.pageController),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectionButton(
                    text: S.of(context).lowcarb,
                    isSelected: _selectedDiet == 'Low-Carb',
                    onTap: () => _toggleDiet('Low-Carb'),
                    selectedColor: theme.colorScheme.primary,
                  ),
                  SelectionButton(
                    text: S.of(context).highprotein,
                    isSelected: _selectedDiet == 'High-Protein',
                    onTap: () => _toggleDiet('High-Protein'),
                    selectedColor: theme.colorScheme.primary,
                  ),
                  SelectionButton(
                    text: S.of(context).glutenfree,
                    isSelected: _selectedDiet == 'Gluten-Free',
                    onTap: () => _toggleDiet('Gluten-Free'),
                    selectedColor: theme.colorScheme.primary,
                  ),
                  SelectionButton(
                    text: S.of(context).piscatorial,
                    isSelected: _selectedDiet == 'Pescatarian',
                    onTap: () => _toggleDiet('Pescatarian'),
                    selectedColor: theme.colorScheme.primary,
                  ),
                  SelectionButton(
                    text: S.of(context).keto,
                    isSelected: _selectedDiet == 'Keto',
                    onTap: () => _toggleDiet('Keto'),
                    selectedColor: theme.colorScheme.primary,
                  ),
                  SelectionButton(
                    text: S.of(context).vegan,
                    isSelected: _selectedDiet == 'Vegan',
                    onTap: () => _toggleDiet('Vegan'),
                    selectedColor: theme.colorScheme.primary,
                  ),
                  SelectionButton(
                    text: S.of(context).vegetarian,
                    isSelected: _selectedDiet == 'Vegetarian',
                    onTap: () => _toggleDiet('Vegetarian'),
                    selectedColor: theme.colorScheme.primary,
                  ),
                  SelectionButton(
                    text: S.of(context).allfoodDiet,
                    isSelected: _selectedDiet == 'All-food diet',
                    onTap: () => _toggleDiet('All-food diet'),
                    selectedColor: theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              ContinueButton(
                isNextEnabled: _isNextEnabled,
                pageController: widget.pageController,
                onPressed: () {
                  try {
                    analyticsRepository.logEvent(
                      name: 'continue_button_clicked',
                      parameters: {
                        'screen_name': 'diet_preference_screen',
                        'selected_diet': _selectedDiet ?? 'none',
                        'user_id':
                            context.read<AuthenticationBloc>().state.user?.id ??
                                'unknown',
                      },
                    );
                  } catch (e) {
                    debugPrint('Error logging continue button click: $e');
                    analyticsRepository.logEvent(
                      name: 'continue_button_error',
                      parameters: {
                        'screen_name': 'diet_preference_screen',
                        'error_message': e.toString(),
                        'user_id':
                            context.read<AuthenticationBloc>().state.user?.id ??
                                'unknown',
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
