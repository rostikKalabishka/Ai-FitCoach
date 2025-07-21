import 'package:ai_fit_coach/blocs/settings_cubit/settings_cubit.dart';
import 'package:ai_fit_coach/features/onboarding/model/model.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;
  final List<OnboardingModel> arr = OnboardingModel.onboardingList;
  double _formOpacity = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _formOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    final localizations = S.of(context);

    return Scaffold(
      body: SafeArea(
        child: AnimatedOpacity(
          opacity: _formOpacity,
          duration: Duration(milliseconds: 1000),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: arr.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    final model = arr[index];
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: _size.height * 0.05),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: SizedBox(
                                width: double.infinity,
                                child: Image.asset(
                                  model.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              model.getTitle(localizations),
                              textAlign: TextAlign.center,
                              style: theme.textTheme.labelMedium,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              model.getDescription(localizations),
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineLarge,
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(arr.length, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: _currentIndex == index ? 18 : 12,
                    height: _currentIndex == index ? 18 : 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? theme.colorScheme.primary
                          : Colors.grey,
                    ),
                  );
                }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: CustomButtonWidget(
                  backgroundColor: _currentIndex == arr.length - 1
                      ? theme.colorScheme.primary
                      : Colors.grey[800],
                  onPressed: () {
                    handleOnboardingAction(context);
                  },
                  child: Text(
                    _currentIndex == arr.length - 1
                        ? localizations.start
                        : localizations.next,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void handleOnboardingAction(BuildContext context) {
    if (_currentIndex < arr.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      context.read<SettingsCubit>().setOnboardingShown();
      AutoRouter.of(context)
          .pushAndPopUntil(WelcomeRoute(), predicate: (route) => false);
    }
  }
}
