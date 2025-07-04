// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/ui/theme/app_const.dart';

class OnboardingModel {
  final String descriptionKey;
  final String titleKey;
  final String image;

  const OnboardingModel({
    required this.descriptionKey,
    required this.titleKey,
    required this.image,
  });

  String getTitle(S s) {
    switch (titleKey) {
      case 'onboarding1_title':
        return s.onboarding1_title;
      case 'onboarding2_title':
        return s.onboarding2_title;
      case 'onboarding3_title':
        return s.onboarding3_title;
      case 'onboarding4_title':
        return s.onboarding4_title;
      case 'onboarding5_title':
        return s.onboarding5_title;
      default:
        return '';
    }
  }

  String getDescription(S s) {
    switch (descriptionKey) {
      case 'onboarding1_description':
        return s.onboarding1_description;
      case 'onboarding2_description':
        return s.onboarding2_description;
      case 'onboarding3_description':
        return s.onboarding3_description;
      case 'onboarding4_description':
        return s.onboarding4_description;
      case 'onboarding5_description':
        return s.onboarding5_description;
      default:
        return '';
    }
  }

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      titleKey: 'onboarding1_title',
      descriptionKey: 'onboarding1_description',
      image: AppConst.onboardingStep1Image,
    ),
    OnboardingModel(
      titleKey: 'onboarding2_title',
      descriptionKey: 'onboarding2_description',
      image: AppConst.onboardingStep2Image,
    ),
    OnboardingModel(
      titleKey: 'onboarding3_title',
      descriptionKey: 'onboarding3_description',
      image: AppConst.onboardingStep3Image,
    ),
    OnboardingModel(
      titleKey: 'onboarding4_title',
      descriptionKey: 'onboarding4_description',
      image: AppConst.onboardingStep4Image,
    ),
    OnboardingModel(
      titleKey: 'onboarding5_title',
      descriptionKey: 'onboarding5_description',
      image: AppConst.onboardingStep5Image,
    ),
  ];
}
