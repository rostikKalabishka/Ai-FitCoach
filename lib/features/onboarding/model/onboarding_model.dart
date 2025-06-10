import 'package:ai_fit_coach/ui/theme/app_const.dart';

class OnboardingModel {
  final String description;
  final String title;
  final String image;

  const OnboardingModel(
      {required this.description, required this.title, required this.image});

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      title: 'Train Anywhere!',
      description:
          'Train at home or at the gym — your choice! Follow our ready-made workout and meal plans to lose weight, build muscle, tone your glutes, and sculpt your body.',
      image: AppConst.onboardingStep1Image,
    ),
    OnboardingModel(
      title: 'Build Your Own Workout Plan',
      description:
          'Create a workout routine tailored just for you with the help of our comprehensive exercise database — fully free and customizable.',
      image: AppConst.onboardingStep2Image,
    ),
    OnboardingModel(
      title: 'Join the Fitness Community',
      description:
          'Become part of an active fitness community. Share your achievements in the Sports Feed, ask questions, and connect with like-minded members. The more engaged the community, the more fun your fitness journey becomes!',
      image: AppConst.onboardingStep3Image,
    ),
    OnboardingModel(
      title: 'Track Your Progress',
      description:
          'Monitor your achievements and stay motivated! Track your weight, body measurements, workout history, and personal records — all in one place.',
      image: AppConst.onboardingStep4Image,
    ),
    OnboardingModel(
      title: 'Smart Reminders & Notifications',
      description:
          'Never miss a workout! Stay on track with personalized reminders and helpful tips to keep your motivation high.',
      image: AppConst.onboardingStep5Image,
    ),
  ];
}
