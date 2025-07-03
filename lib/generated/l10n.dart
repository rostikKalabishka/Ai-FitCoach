// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Start`
  String get start {
    return Intl.message('Start', name: 'start', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Train Anywhere!`
  String get onboarding1_title {
    return Intl.message(
      'Train Anywhere!',
      name: 'onboarding1_title',
      desc: '',
      args: [],
    );
  }

  /// `Train at home or at the gym — your choice! Follow our ready-made workout and meal plans to lose weight, build muscle, tone your glutes, and sculpt your body.`
  String get onboarding1_description {
    return Intl.message(
      'Train at home or at the gym — your choice! Follow our ready-made workout and meal plans to lose weight, build muscle, tone your glutes, and sculpt your body.',
      name: 'onboarding1_description',
      desc: '',
      args: [],
    );
  }

  /// `Build Your Own Workout Plan`
  String get onboarding2_title {
    return Intl.message(
      'Build Your Own Workout Plan',
      name: 'onboarding2_title',
      desc: '',
      args: [],
    );
  }

  /// `Create a workout routine tailored just for you with the help of our comprehensive exercise database — fully free and customizable.`
  String get onboarding2_description {
    return Intl.message(
      'Create a workout routine tailored just for you with the help of our comprehensive exercise database — fully free and customizable.',
      name: 'onboarding2_description',
      desc: '',
      args: [],
    );
  }

  /// `Join the Fitness Community`
  String get onboarding3_title {
    return Intl.message(
      'Join the Fitness Community',
      name: 'onboarding3_title',
      desc: '',
      args: [],
    );
  }

  /// `Become part of an active fitness community. Share your achievements in the Sports Feed, ask questions, and connect with like-minded members. The more engaged the community, the more fun your fitness journey becomes!`
  String get onboarding3_description {
    return Intl.message(
      'Become part of an active fitness community. Share your achievements in the Sports Feed, ask questions, and connect with like-minded members. The more engaged the community, the more fun your fitness journey becomes!',
      name: 'onboarding3_description',
      desc: '',
      args: [],
    );
  }

  /// `Track Your Progress`
  String get onboarding4_title {
    return Intl.message(
      'Track Your Progress',
      name: 'onboarding4_title',
      desc: '',
      args: [],
    );
  }

  /// `Monitor your achievements and stay motivated! Track your weight, body measurements, workout history, and personal records — all in one place.`
  String get onboarding4_description {
    return Intl.message(
      'Monitor your achievements and stay motivated! Track your weight, body measurements, workout history, and personal records — all in one place.',
      name: 'onboarding4_description',
      desc: '',
      args: [],
    );
  }

  /// `Smart Reminders & Notifications`
  String get onboarding5_title {
    return Intl.message(
      'Smart Reminders & Notifications',
      name: 'onboarding5_title',
      desc: '',
      args: [],
    );
  }

  /// `Never miss a workout! Stay on track with personalized reminders and helpful tips to keep your motivation high.`
  String get onboarding5_description {
    return Intl.message(
      'Never miss a workout! Stay on track with personalized reminders and helpful tips to keep your motivation high.',
      name: 'onboarding5_description',
      desc: '',
      args: [],
    );
  }

  /// `Welcome,\nglad to see you!`
  String get welcomeGladToSeeYou {
    return Intl.message(
      'Welcome,\nglad to see you!',
      name: 'welcomeGladToSeeYou',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Facebook`
  String get continueWithFacebook {
    return Intl.message(
      'Continue with Facebook',
      name: 'continueWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Confirm your password`
  String get confirmYourPassword {
    return Intl.message(
      'Confirm your password',
      name: 'confirmYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `No excuses - only results`
  String get noExcusesOnlyResults {
    return Intl.message(
      'No excuses - only results',
      name: 'noExcusesOnlyResults',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Challenges`
  String get challenges {
    return Intl.message('Challenges', name: 'challenges', desc: '', args: []);
  }

  /// `Workout`
  String get workout {
    return Intl.message('Workout', name: 'workout', desc: '', args: []);
  }

  /// `AI assistant`
  String get aiAssistant {
    return Intl.message(
      'AI assistant',
      name: 'aiAssistant',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Error: {error}`
  String errorN(Object error) {
    return Intl.message(
      'Error: $error',
      name: 'errorN',
      desc: '',
      args: [error],
    );
  }

  /// `Create new chat`
  String get createNewChat {
    return Intl.message(
      'Create new chat',
      name: 'createNewChat',
      desc: '',
      args: [],
    );
  }

  /// `how can i help you?`
  String get howCanIHelpYou {
    return Intl.message(
      'how can i help you?',
      name: 'howCanIHelpYou',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `User not authenticated`
  String get userNotAuthenticated {
    return Intl.message(
      'User not authenticated',
      name: 'userNotAuthenticated',
      desc: '',
      args: [],
    );
  }

  /// `Edit the name`
  String get editTheName {
    return Intl.message(
      'Edit the name',
      name: 'editTheName',
      desc: '',
      args: [],
    );
  }

  /// `Delete chat`
  String get deleteChat {
    return Intl.message('Delete chat', name: 'deleteChat', desc: '', args: []);
  }

  /// `Search chat...`
  String get searchChat {
    return Intl.message(
      'Search chat...',
      name: 'searchChat',
      desc: '',
      args: [],
    );
  }

  /// `Chat history`
  String get chatHistory {
    return Intl.message(
      'Chat history',
      name: 'chatHistory',
      desc: '',
      args: [],
    );
  }

  /// `Edit the chat name`
  String get editTheChatName {
    return Intl.message(
      'Edit the chat name',
      name: 'editTheChatName',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `New name`
  String get newName {
    return Intl.message('New name', name: 'newName', desc: '', args: []);
  }

  /// `Trending workout`
  String get trendingWorkout {
    return Intl.message(
      'Trending workout',
      name: 'trendingWorkout',
      desc: '',
      args: [],
    );
  }

  /// `Food recommendation`
  String get foodRecommendation {
    return Intl.message(
      'Food recommendation',
      name: 'foodRecommendation',
      desc: '',
      args: [],
    );
  }

  /// `Trending challenges`
  String get trendingChallenges {
    return Intl.message(
      'Trending challenges',
      name: 'trendingChallenges',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message('About us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Follow {appName} on`
  String followOnName(Object appName) {
    return Intl.message(
      'Follow $appName on',
      name: 'followOnName',
      desc: '',
      args: [appName],
    );
  }

  /// `Something happened, please try again`
  String get somethingHappenedPleaseTryAgain {
    return Intl.message(
      'Something happened, please try again',
      name: 'somethingHappenedPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Unable to rest enough`
  String get unableToRestEnough {
    return Intl.message(
      'Unable to rest enough',
      name: 'unableToRestEnough',
      desc: '',
      args: [],
    );
  }

  /// `Sometimes I drink alcohol`
  String get sometimesIDrinkAlcohol {
    return Intl.message(
      'Sometimes I drink alcohol',
      name: 'sometimesIDrinkAlcohol',
      desc: '',
      args: [],
    );
  }

  /// `I consume a lot of salty food`
  String get iConsumeALotOfSaltyFood {
    return Intl.message(
      'I consume a lot of salty food',
      name: 'iConsumeALotOfSaltyFood',
      desc: '',
      args: [],
    );
  }

  /// `I eat midnight snacks`
  String get iEatMidnightSnacks {
    return Intl.message(
      'I eat midnight snacks',
      name: 'iEatMidnightSnacks',
      desc: '',
      args: [],
    );
  }

  /// `I love sweet candies and chocolate`
  String get iLoveSweetCandiesAndChocolate {
    return Intl.message(
      'I love sweet candies and chocolate',
      name: 'iLoveSweetCandiesAndChocolate',
      desc: '',
      args: [],
    );
  }

  /// `Soda is my best friend`
  String get sodaIsMyBestFriend {
    return Intl.message(
      'Soda is my best friend',
      name: 'sodaIsMyBestFriend',
      desc: '',
      args: [],
    );
  }

  /// `None of the above`
  String get noneOfTheAbove {
    return Intl.message(
      'None of the above',
      name: 'noneOfTheAbove',
      desc: '',
      args: [],
    );
  }

  /// `YOUR HEIGHT:`
  String get yourHeight {
    return Intl.message('YOUR HEIGHT:', name: 'yourHeight', desc: '', args: []);
  }

  /// `YOUR WEIGHT:`
  String get yourWeight {
    return Intl.message('YOUR WEIGHT:', name: 'yourWeight', desc: '', args: []);
  }

  /// `Body parameters`
  String get bodyParameters {
    return Intl.message(
      'Body parameters',
      name: 'bodyParameters',
      desc: '',
      args: [],
    );
  }

  /// `YOUR AGE:`
  String get yourAge {
    return Intl.message('YOUR AGE:', name: 'yourAge', desc: '', args: []);
  }

  /// `Choose your bad habits`
  String get chooseYourBadHabits {
    return Intl.message(
      'Choose your bad habits',
      name: 'chooseYourBadHabits',
      desc: '',
      args: [],
    );
  }

  /// `Choose up to 3 activities\nyou’re interested in`
  String get chooseUpTo3ActivitiesYourInterestedIn {
    return Intl.message(
      'Choose up to 3 activities\nyou’re interested in',
      name: 'chooseUpTo3ActivitiesYourInterestedIn',
      desc: '',
      args: [],
    );
  }

  /// `Dancing`
  String get dancing {
    return Intl.message('Dancing', name: 'dancing', desc: '', args: []);
  }

  /// `Swimming & Water Activities`
  String get swimmingWaterActivities {
    return Intl.message(
      'Swimming & Water Activities',
      name: 'swimmingWaterActivities',
      desc: '',
      args: [],
    );
  }

  /// `Cycling`
  String get cycling {
    return Intl.message('Cycling', name: 'cycling', desc: '', args: []);
  }

  /// `Walking`
  String get walking {
    return Intl.message('Walking', name: 'walking', desc: '', args: []);
  }

  /// `Running`
  String get running {
    return Intl.message('Running', name: 'running', desc: '', args: []);
  }

  /// `Fitness at home`
  String get fitnessAtHome {
    return Intl.message(
      'Fitness at home',
      name: 'fitnessAtHome',
      desc: '',
      args: [],
    );
  }

  /// `Yoga`
  String get yoga {
    return Intl.message('Yoga', name: 'yoga', desc: '', args: []);
  }

  /// `What type of diet do you prefer?`
  String get whatTypeOfDietDoYouPrefer {
    return Intl.message(
      'What type of diet do you prefer?',
      name: 'whatTypeOfDietDoYouPrefer',
      desc: '',
      args: [],
    );
  }

  /// `Low-Carb`
  String get lowcarb {
    return Intl.message('Low-Carb', name: 'lowcarb', desc: '', args: []);
  }

  /// `High-Protein`
  String get highprotein {
    return Intl.message(
      'High-Protein',
      name: 'highprotein',
      desc: '',
      args: [],
    );
  }

  /// `Gluten-Free`
  String get glutenfree {
    return Intl.message('Gluten-Free', name: 'glutenfree', desc: '', args: []);
  }

  /// `Keto`
  String get keto {
    return Intl.message('Keto', name: 'keto', desc: '', args: []);
  }

  /// `Vegan`
  String get vegan {
    return Intl.message('Vegan', name: 'vegan', desc: '', args: []);
  }

  /// `Vegetarian`
  String get vegetarian {
    return Intl.message('Vegetarian', name: 'vegetarian', desc: '', args: []);
  }

  /// `All-food diet`
  String get allfoodDiet {
    return Intl.message(
      'All-food diet',
      name: 'allfoodDiet',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get beginner {
    return Intl.message('Beginner', name: 'beginner', desc: '', args: []);
  }

  /// `Amateur`
  String get amateur {
    return Intl.message('Amateur', name: 'amateur', desc: '', args: []);
  }

  /// `Medium`
  String get medium {
    return Intl.message('Medium', name: 'medium', desc: '', args: []);
  }

  /// `Expert`
  String get expert {
    return Intl.message('Expert', name: 'expert', desc: '', args: []);
  }

  /// `What is your level of physical fitness?`
  String get whatIsYourLevelOfPhysicalFitness {
    return Intl.message(
      'What is your level of physical fitness?',
      name: 'whatIsYourLevelOfPhysicalFitness',
      desc: '',
      args: [],
    );
  }

  /// `Level: {fitnessLevel}`
  String levelFitnessLevel(Object fitnessLevel) {
    return Intl.message(
      'Level: $fitnessLevel',
      name: 'levelFitnessLevel',
      desc: '',
      args: [fitnessLevel],
    );
  }

  /// `What is your main goal?`
  String get whatIsYourMainGoal {
    return Intl.message(
      'What is your main goal?',
      name: 'whatIsYourMainGoal',
      desc: '',
      args: [],
    );
  }

  /// `Lose weight`
  String get loseWeight {
    return Intl.message('Lose weight', name: 'loseWeight', desc: '', args: []);
  }

  /// `Gain muscle mass`
  String get gainMuscleMass {
    return Intl.message(
      'Gain muscle mass',
      name: 'gainMuscleMass',
      desc: '',
      args: [],
    );
  }

  /// `Keep fit`
  String get keepFit {
    return Intl.message('Keep fit', name: 'keepFit', desc: '', args: []);
  }

  /// `Continue`
  String get continueText {
    return Intl.message('Continue', name: 'continueText', desc: '', args: []);
  }

  /// `What motivates you?`
  String get whatMotivatesYou {
    return Intl.message(
      'What motivates you?',
      name: 'whatMotivatesYou',
      desc: '',
      args: [],
    );
  }

  /// `Choose your motivations`
  String get chooseYourMotivations {
    return Intl.message(
      'Choose your motivations',
      name: 'chooseYourMotivations',
      desc: '',
      args: [],
    );
  }

  /// `Reducing stress`
  String get reducingStress {
    return Intl.message(
      'Reducing stress',
      name: 'reducingStress',
      desc: '',
      args: [],
    );
  }

  /// `Preparing for the event`
  String get preparingForTheEvent {
    return Intl.message(
      'Preparing for the event',
      name: 'preparingForTheEvent',
      desc: '',
      args: [],
    );
  }

  /// `Rehabilitation`
  String get rehabilitation {
    return Intl.message(
      'Rehabilitation',
      name: 'rehabilitation',
      desc: '',
      args: [],
    );
  }

  /// `Improving health`
  String get improvingHealth {
    return Intl.message(
      'Improving health',
      name: 'improvingHealth',
      desc: '',
      args: [],
    );
  }

  /// `Building strength`
  String get buildingStrength {
    return Intl.message(
      'Building strength',
      name: 'buildingStrength',
      desc: '',
      args: [],
    );
  }

  /// `Improving immunity`
  String get improvingImmunity {
    return Intl.message(
      'Improving immunity',
      name: 'improvingImmunity',
      desc: '',
      args: [],
    );
  }

  /// `Increase in libido`
  String get increaseInLibido {
    return Intl.message(
      'Increase in libido',
      name: 'increaseInLibido',
      desc: '',
      args: [],
    );
  }

  /// `Terms`
  String get terms {
    return Intl.message('Terms', name: 'terms', desc: '', args: []);
  }

  /// `Do you agree with our terms and policies?`
  String get doYouAgreeWithOurTermsAndPolicies {
    return Intl.message(
      'Do you agree with our terms and policies?',
      name: 'doYouAgreeWithOurTermsAndPolicies',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the Terms of Use and Subscription Terms. I am also aware of the Privacy Notice`
  String get iAgreeToTheTermsOfUseAndSubscriptionTerms {
    return Intl.message(
      'I agree to the Terms of Use and Subscription Terms. I am also aware of the Privacy Notice',
      name: 'iAgreeToTheTermsOfUseAndSubscriptionTerms',
      desc: '',
      args: [],
    );
  }

  /// `For best fitness results choose to train every other day 2 to 5 times a week`
  String get forBestFitnessResultsChooseToTrainEveryOtherDay {
    return Intl.message(
      'For best fitness results choose to train every other day 2 to 5 times a week',
      name: 'forBestFitnessResultsChooseToTrainEveryOtherDay',
      desc: '',
      args: [],
    );
  }

  /// `Choose your training days`
  String get chooseYourTrainingDays {
    return Intl.message(
      'Choose your training days',
      name: 'chooseYourTrainingDays',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get monday {
    return Intl.message('Monday', name: 'monday', desc: '', args: []);
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message('Tuesday', name: 'tuesday', desc: '', args: []);
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message('Wednesday', name: 'wednesday', desc: '', args: []);
  }

  /// `Thursday`
  String get thursday {
    return Intl.message('Thursday', name: 'thursday', desc: '', args: []);
  }

  /// `Friday`
  String get friday {
    return Intl.message('Friday', name: 'friday', desc: '', args: []);
  }

  /// `Saturday`
  String get saturday {
    return Intl.message('Saturday', name: 'saturday', desc: '', args: []);
  }

  /// `Sunday`
  String get sunday {
    return Intl.message('Sunday', name: 'sunday', desc: '', args: []);
  }

  /// `Number of existing workouts`
  String get numberOfExistingWorkouts {
    return Intl.message(
      'Number of existing workouts',
      name: 'numberOfExistingWorkouts',
      desc: '',
      args: [],
    );
  }

  /// `Newbie`
  String get newbie {
    return Intl.message('Newbie', name: 'newbie', desc: '', args: []);
  }

  /// `Advanced`
  String get advanced {
    return Intl.message('Advanced', name: 'advanced', desc: '', args: []);
  }

  /// `Name of workout, what you'll choose`
  String get nameOfWorkoutWhatYoullChoose {
    return Intl.message(
      'Name of workout, what you\'ll choose',
      name: 'nameOfWorkoutWhatYoullChoose',
      desc: '',
      args: [],
    );
  }

  /// `START WORKOUT`
  String get startWorkout {
    return Intl.message(
      'START WORKOUT',
      name: 'startWorkout',
      desc: '',
      args: [],
    );
  }

  /// `HIIT (High Intensity)`
  String get hiitHighIntensity {
    return Intl.message(
      'HIIT (High Intensity)',
      name: 'hiitHighIntensity',
      desc: '',
      args: [],
    );
  }

  /// `FOR YOU`
  String get forYou {
    return Intl.message('FOR YOU', name: 'forYou', desc: '', args: []);
  }

  /// `Account Management`
  String get accountManagement {
    return Intl.message(
      'Account Management',
      name: 'accountManagement',
      desc: '',
      args: [],
    );
  }

  /// `Reserved email`
  String get reservedEmail {
    return Intl.message(
      'Reserved email',
      name: 'reservedEmail',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Automatic Activity Tracking`
  String get automaticActivityTracking {
    return Intl.message(
      'Automatic Activity Tracking',
      name: 'automaticActivityTracking',
      desc: '',
      args: [],
    );
  }

  /// `Step Count`
  String get stepCount {
    return Intl.message('Step Count', name: 'stepCount', desc: '', args: []);
  }

  /// `GPS Tracking`
  String get gpsTracking {
    return Intl.message(
      'GPS Tracking',
      name: 'gpsTracking',
      desc: '',
      args: [],
    );
  }

  /// `Heart Rate`
  String get heartRate {
    return Intl.message('Heart Rate', name: 'heartRate', desc: '', args: []);
  }

  /// `Calorie Goal`
  String get calorieGoal {
    return Intl.message(
      'Calorie Goal',
      name: 'calorieGoal',
      desc: '',
      args: [],
    );
  }

  /// `Set Daily Limit`
  String get setDailyLimit {
    return Intl.message(
      'Set Daily Limit',
      name: 'setDailyLimit',
      desc: '',
      args: [],
    );
  }

  /// `Delete Your Account`
  String get deleteYourAccount {
    return Intl.message(
      'Delete Your Account',
      name: 'deleteYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Intermediate`
  String get intermediate {
    return Intl.message(
      'Intermediate',
      name: 'intermediate',
      desc: '',
      args: [],
    );
  }

  /// `Difficulty Level`
  String get difficultyLevel {
    return Intl.message(
      'Difficulty Level',
      name: 'difficultyLevel',
      desc: '',
      args: [],
    );
  }

  /// `Do Not Disturb Mode`
  String get doNotDisturbMode {
    return Intl.message(
      'Do Not Disturb Mode',
      name: 'doNotDisturbMode',
      desc: '',
      args: [],
    );
  }

  /// `Switch theme mode`
  String get switchThemeMode {
    return Intl.message(
      'Switch theme mode',
      name: 'switchThemeMode',
      desc: '',
      args: [],
    );
  }

  /// `Mute Notifications`
  String get muteNotifications {
    return Intl.message(
      'Mute Notifications',
      name: 'muteNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Weight Loss`
  String get weightLoss {
    return Intl.message('Weight Loss', name: 'weightLoss', desc: '', args: []);
  }

  /// `Muscle Gain`
  String get muscleGain {
    return Intl.message('Muscle Gain', name: 'muscleGain', desc: '', args: []);
  }

  /// `Stay Fit`
  String get stayFit {
    return Intl.message('Stay Fit', name: 'stayFit', desc: '', args: []);
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Fitness Goal`
  String get fitnessGoal {
    return Intl.message(
      'Fitness Goal',
      name: 'fitnessGoal',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `French`
  String get french {
    return Intl.message('French', name: 'french', desc: '', args: []);
  }

  /// `German`
  String get german {
    return Intl.message('German', name: 'german', desc: '', args: []);
  }

  /// `Japanese`
  String get japanese {
    return Intl.message('Japanese', name: 'japanese', desc: '', args: []);
  }

  /// `Portuguese`
  String get portuguese {
    return Intl.message('Portuguese', name: 'portuguese', desc: '', args: []);
  }

  /// `Spanish`
  String get spanish {
    return Intl.message('Spanish', name: 'spanish', desc: '', args: []);
  }

  /// `Ukrainian`
  String get ukrainian {
    return Intl.message('Ukrainian', name: 'ukrainian', desc: '', args: []);
  }

  /// `Language & Localization`
  String get languageLocalization {
    return Intl.message(
      'Language & Localization',
      name: 'languageLocalization',
      desc: '',
      args: [],
    );
  }

  /// `Please select preferred language`
  String get pleaseSelectPreferredLanguage {
    return Intl.message(
      'Please select preferred language',
      name: 'pleaseSelectPreferredLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Location Access`
  String get locationAccess {
    return Intl.message(
      'Location Access',
      name: 'locationAccess',
      desc: '',
      args: [],
    );
  }

  /// `Share Progress`
  String get shareProgress {
    return Intl.message(
      'Share Progress',
      name: 'shareProgress',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message('Privacy', name: 'privacy', desc: '', args: []);
  }

  /// `Rate Us`
  String get rateUs {
    return Intl.message('Rate Us', name: 'rateUs', desc: '', args: []);
  }

  /// `Welcome {user}!`
  String welcomeUser(Object user) {
    return Intl.message(
      'Welcome $user!',
      name: 'welcomeUser',
      desc: '',
      args: [user],
    );
  }

  /// `{appName} account`
  String appNameAccount(Object appName) {
    return Intl.message(
      '$appName account',
      name: 'appNameAccount',
      desc: '',
      args: [appName],
    );
  }

  /// `{number} Days Streak`
  String numberDaysStreak(Object number) {
    return Intl.message(
      '$number Days Streak',
      name: 'numberDaysStreak',
      desc: '',
      args: [number],
    );
  }

  /// `Personal Best: {number}`
  String personalBestNumber(Object number) {
    return Intl.message(
      'Personal Best: $number',
      name: 'personalBestNumber',
      desc: '',
      args: [number],
    );
  }

  /// `User Profile`
  String get userProfile {
    return Intl.message(
      'User Profile',
      name: 'userProfile',
      desc: '',
      args: [],
    );
  }

  /// `Workout Types`
  String get workoutTypes {
    return Intl.message(
      'Workout Types',
      name: 'workoutTypes',
      desc: '',
      args: [],
    );
  }

  /// `Water Balance`
  String get waterBalance {
    return Intl.message(
      'Water Balance',
      name: 'waterBalance',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message('Log out', name: 'logOut', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Age`
  String get age {
    return Intl.message('Age', name: 'age', desc: '', args: []);
  }

  /// `Height`
  String get height {
    return Intl.message('Height', name: 'height', desc: '', args: []);
  }

  /// `Weight`
  String get weight {
    return Intl.message('Weight', name: 'weight', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Please select your gender`
  String get pleaseSelectYourGender {
    return Intl.message(
      'Please select your gender',
      name: 'pleaseSelectYourGender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Activity Level`
  String get activityLevel {
    return Intl.message(
      'Activity Level',
      name: 'activityLevel',
      desc: '',
      args: [],
    );
  }

  /// `Please select your activity level`
  String get pleaseSelectYourActivityLevel {
    return Intl.message(
      'Please select your activity level',
      name: 'pleaseSelectYourActivityLevel',
      desc: '',
      args: [],
    );
  }

  /// `Sedentary`
  String get sedentary {
    return Intl.message('Sedentary', name: 'sedentary', desc: '', args: []);
  }

  /// `Lightly Active`
  String get lightlyActive {
    return Intl.message(
      'Lightly Active',
      name: 'lightlyActive',
      desc: '',
      args: [],
    );
  }

  /// `Moderately Active`
  String get moderatelyActive {
    return Intl.message(
      'Moderately Active',
      name: 'moderatelyActive',
      desc: '',
      args: [],
    );
  }

  /// `Very Active`
  String get veryActive {
    return Intl.message('Very Active', name: 'veryActive', desc: '', args: []);
  }

  /// `Extremely Active`
  String get extremelyActive {
    return Intl.message(
      'Extremely Active',
      name: 'extremelyActive',
      desc: '',
      args: [],
    );
  }

  /// `Daily Reminders`
  String get dailyReminders {
    return Intl.message(
      'Daily Reminders',
      name: 'dailyReminders',
      desc: '',
      args: [],
    );
  }

  /// `Water Intake Goals`
  String get waterIntakeGoals {
    return Intl.message(
      'Water Intake Goals',
      name: 'waterIntakeGoals',
      desc: '',
      args: [],
    );
  }

  /// `Cardio`
  String get cardio {
    return Intl.message('Cardio', name: 'cardio', desc: '', args: []);
  }

  /// `Strength`
  String get strength {
    return Intl.message('Strength', name: 'strength', desc: '', args: []);
  }

  /// `HIIT`
  String get hiit {
    return Intl.message('HIIT', name: 'hiit', desc: '', args: []);
  }

  /// `Effective Date: {effectiveDate}.`
  String privacyPolicyEffectiveDate(Object effectiveDate) {
    return Intl.message(
      'Effective Date: $effectiveDate.',
      name: 'privacyPolicyEffectiveDate',
      desc: '',
      args: [effectiveDate],
    );
  }

  /// `Last Updated: {lastUpdatedDate}.`
  String privacyPolicyLastUpdated(Object lastUpdatedDate) {
    return Intl.message(
      'Last Updated: $lastUpdatedDate.',
      name: 'privacyPolicyLastUpdated',
      desc: '',
      args: [lastUpdatedDate],
    );
  }

  /// `{appName} ("we", "our", or "us") operates the {appName} mobile application (the "App"). This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our App.`
  String privacyPolicyIntro(Object appName) {
    return Intl.message(
      '$appName ("we", "our", or "us") operates the $appName mobile application (the "App"). This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our App.',
      name: 'privacyPolicyIntro',
      desc: '',
      args: [appName],
    );
  }

  /// `Please read this Privacy Policy carefully. If you do not agree with the terms, please do not access the App.`
  String get privacyPolicyAgreement {
    return Intl.message(
      'Please read this Privacy Policy carefully. If you do not agree with the terms, please do not access the App.',
      name: 'privacyPolicyAgreement',
      desc: '',
      args: [],
    );
  }

  /// `1. Information We Collect`
  String get infoCollectTitle {
    return Intl.message(
      '1. Information We Collect',
      name: 'infoCollectTitle',
      desc: '',
      args: [],
    );
  }

  /// `We may collect and process the following types of information:`
  String get infoCollectDescription {
    return Intl.message(
      'We may collect and process the following types of information:',
      name: 'infoCollectDescription',
      desc: '',
      args: [],
    );
  }

  /// `a. Personal Data`
  String get infoCollectPersonalData {
    return Intl.message(
      'a. Personal Data',
      name: 'infoCollectPersonalData',
      desc: '',
      args: [],
    );
  }

  /// `Information you voluntarily provide when you:`
  String get infoCollectPersonalDataDescription {
    return Intl.message(
      'Information you voluntarily provide when you:',
      name: 'infoCollectPersonalDataDescription',
      desc: '',
      args: [],
    );
  }

  /// `Register or create an account (e.g., name, email address, age, etc.)`
  String get infoCollectRegisterAccount {
    return Intl.message(
      'Register or create an account (e.g., name, email address, age, etc.)',
      name: 'infoCollectRegisterAccount',
      desc: '',
      args: [],
    );
  }

  /// `Contact us for support`
  String get infoCollectSupport {
    return Intl.message(
      'Contact us for support',
      name: 'infoCollectSupport',
      desc: '',
      args: [],
    );
  }

  /// `b. Usage Data`
  String get infoCollectUsageData {
    return Intl.message(
      'b. Usage Data',
      name: 'infoCollectUsageData',
      desc: '',
      args: [],
    );
  }

  /// `Automatically collected when using the App:`
  String get infoCollectUsageDataDescription {
    return Intl.message(
      'Automatically collected when using the App:',
      name: 'infoCollectUsageDataDescription',
      desc: '',
      args: [],
    );
  }

  /// `Device information (e.g., device model, OS version)`
  String get infoCollectDeviceInfo {
    return Intl.message(
      'Device information (e.g., device model, OS version)',
      name: 'infoCollectDeviceInfo',
      desc: '',
      args: [],
    );
  }

  /// `Log information (e.g., IP address, crash logs)`
  String get infoCollectLogInfo {
    return Intl.message(
      'Log information (e.g., IP address, crash logs)',
      name: 'infoCollectLogInfo',
      desc: '',
      args: [],
    );
  }

  /// `App usage statistics and interactions`
  String get infoCollectUsageStats {
    return Intl.message(
      'App usage statistics and interactions',
      name: 'infoCollectUsageStats',
      desc: '',
      args: [],
    );
  }

  /// `c. Location Data`
  String get infoCollectLocationData {
    return Intl.message(
      'c. Location Data',
      name: 'infoCollectLocationData',
      desc: '',
      args: [],
    );
  }

  /// `We may collect precise or approximate location information if you grant us permission.`
  String get infoCollectLocationDataDescription {
    return Intl.message(
      'We may collect precise or approximate location information if you grant us permission.',
      name: 'infoCollectLocationDataDescription',
      desc: '',
      args: [],
    );
  }

  /// `2. How We Use Your Information`
  String get howWeUseInfoTitle {
    return Intl.message(
      '2. How We Use Your Information',
      name: 'howWeUseInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `We use your information to:`
  String get howWeUseInfoDescription {
    return Intl.message(
      'We use your information to:',
      name: 'howWeUseInfoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Provide and maintain the App`
  String get howWeUseInfoProvideApp {
    return Intl.message(
      'Provide and maintain the App',
      name: 'howWeUseInfoProvideApp',
      desc: '',
      args: [],
    );
  }

  /// `Improve the App’s performance and user experience`
  String get howWeUseInfoImproveApp {
    return Intl.message(
      'Improve the App’s performance and user experience',
      name: 'howWeUseInfoImproveApp',
      desc: '',
      args: [],
    );
  }

  /// `Send notifications and important updates`
  String get howWeUseInfoNotifications {
    return Intl.message(
      'Send notifications and important updates',
      name: 'howWeUseInfoNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Respond to user inquiries and support requests`
  String get howWeUseInfoSupport {
    return Intl.message(
      'Respond to user inquiries and support requests',
      name: 'howWeUseInfoSupport',
      desc: '',
      args: [],
    );
  }

  /// `Analyze usage and trends to enhance features`
  String get howWeUseInfoAnalytics {
    return Intl.message(
      'Analyze usage and trends to enhance features',
      name: 'howWeUseInfoAnalytics',
      desc: '',
      args: [],
    );
  }

  /// `3. Sharing Your Information`
  String get sharingInfoTitle {
    return Intl.message(
      '3. Sharing Your Information',
      name: 'sharingInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `We do not sell your personal data. We may share data with:`
  String get sharingInfoDescription {
    return Intl.message(
      'We do not sell your personal data. We may share data with:',
      name: 'sharingInfoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Service Providers: To perform services on our behalf (e.g., analytics, crash reporting)`
  String get sharingInfoServiceProviders {
    return Intl.message(
      'Service Providers: To perform services on our behalf (e.g., analytics, crash reporting)',
      name: 'sharingInfoServiceProviders',
      desc: '',
      args: [],
    );
  }

  /// `Legal Requirements: If required by law or in response to legal processes`
  String get sharingInfoLegalRequirements {
    return Intl.message(
      'Legal Requirements: If required by law or in response to legal processes',
      name: 'sharingInfoLegalRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Business Transfers: In connection with a merger, sale, or acquisition`
  String get sharingInfoBusinessTransfers {
    return Intl.message(
      'Business Transfers: In connection with a merger, sale, or acquisition',
      name: 'sharingInfoBusinessTransfers',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get thirdPartyServicesEmpty {
    return Intl.message(
      '',
      name: 'thirdPartyServicesEmpty',
      desc: '',
      args: [],
    );
  }

  /// `4. Third-Party Services`
  String get thirdPartyServicesTitle {
    return Intl.message(
      '4. Third-Party Services',
      name: 'thirdPartyServicesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Our App may include links or integrate with third-party services (e.g., Firebase, Google Analytics). These third parties have their own privacy policies, and we are not responsible for their practices.`
  String get thirdPartyServicesDescription {
    return Intl.message(
      'Our App may include links or integrate with third-party services (e.g., Firebase, Google Analytics). These third parties have their own privacy policies, and we are not responsible for their practices.',
      name: 'thirdPartyServicesDescription',
      desc: '',
      args: [],
    );
  }

  /// `5. Data Security`
  String get dataSecurityTitle {
    return Intl.message(
      '5. Data Security',
      name: 'dataSecurityTitle',
      desc: '',
      args: [],
    );
  }

  /// `We implement appropriate technical and organizational measures to protect your information. However, no method of transmission over the Internet or method of electronic storage is 100% secure.`
  String get dataSecurityDescription {
    return Intl.message(
      'We implement appropriate technical and organizational measures to protect your information. However, no method of transmission over the Internet or method of electronic storage is 100% secure.',
      name: 'dataSecurityDescription',
      desc: '',
      args: [],
    );
  }

  /// `6. Your Rights`
  String get yourRightsTitle {
    return Intl.message(
      '6. Your Rights',
      name: 'yourRightsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Depending on your location, you may have rights under applicable data protection laws, such as:`
  String get yourRightsDescription {
    return Intl.message(
      'Depending on your location, you may have rights under applicable data protection laws, such as:',
      name: 'yourRightsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Access or update your personal data`
  String get yourRightsAccessData {
    return Intl.message(
      'Access or update your personal data',
      name: 'yourRightsAccessData',
      desc: '',
      args: [],
    );
  }

  /// `Request deletion of your data`
  String get yourRightsDeleteData {
    return Intl.message(
      'Request deletion of your data',
      name: 'yourRightsDeleteData',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw consent`
  String get yourRightsWithdrawConsent {
    return Intl.message(
      'Withdraw consent',
      name: 'yourRightsWithdrawConsent',
      desc: '',
      args: [],
    );
  }

  /// `To exercise these rights, please contact us at: {contactEmail}`
  String yourRightsContact(Object contactEmail) {
    return Intl.message(
      'To exercise these rights, please contact us at: $contactEmail',
      name: 'yourRightsContact',
      desc: '',
      args: [contactEmail],
    );
  }

  /// `7. Children’s Privacy`
  String get childrenPrivacyTitle {
    return Intl.message(
      '7. Children’s Privacy',
      name: 'childrenPrivacyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Our App is not intended for children under the age of 13 (or the equivalent minimum age in your jurisdiction), and we do not knowingly collect data from such users.`
  String get childrenPrivacyDescription {
    return Intl.message(
      'Our App is not intended for children under the age of 13 (or the equivalent minimum age in your jurisdiction), and we do not knowingly collect data from such users.',
      name: 'childrenPrivacyDescription',
      desc: '',
      args: [],
    );
  }

  /// `8. Changes to This Privacy Policy`
  String get changesToPolicyTitle {
    return Intl.message(
      '8. Changes to This Privacy Policy',
      name: 'changesToPolicyTitle',
      desc: '',
      args: [],
    );
  }

  /// `We may update this Privacy Policy from time to time. Changes will be posted on this page with an updated "Last Updated" date.`
  String get changesToPolicyDescription {
    return Intl.message(
      'We may update this Privacy Policy from time to time. Changes will be posted on this page with an updated "Last Updated" date.',
      name: 'changesToPolicyDescription',
      desc: '',
      args: [],
    );
  }

  /// `9. Contact Us`
  String get contactUsTitle {
    return Intl.message(
      '9. Contact Us',
      name: 'contactUsTitle',
      desc: '',
      args: [],
    );
  }

  /// `If you have any questions or concerns about this Privacy Policy, please contact us at:`
  String get contactUsDescription {
    return Intl.message(
      'If you have any questions or concerns about this Privacy Policy, please contact us at:',
      name: 'contactUsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Email: {contactEmail}`
  String contactUsEmail(Object contactEmail) {
    return Intl.message(
      'Email: $contactEmail',
      name: 'contactUsEmail',
      desc: '',
      args: [contactEmail],
    );
  }

  /// `Address: {companyAddress}`
  String contactUsAddress(Object companyAddress) {
    return Intl.message(
      'Address: $companyAddress',
      name: 'contactUsAddress',
      desc: '',
      args: [companyAddress],
    );
  }

  /// `We appreciate your feedback! The "Rate Us" feature helps us improve the quality of our app, gather user insights, and provide a better experience for everyone.`
  String get rateUsDescription {
    return Intl.message(
      'We appreciate your feedback! The "Rate Us" feature helps us improve the quality of our app, gather user insights, and provide a better experience for everyone.',
      name: 'rateUsDescription',
      desc: '',
      args: [],
    );
  }

  /// `1. How the "Rate Us" Feature Works`
  String get rateUsHowItWorksTitle {
    return Intl.message(
      '1. How the "Rate Us" Feature Works',
      name: 'rateUsHowItWorksTitle',
      desc: '',
      args: [],
    );
  }

  /// `When you use the "Rate Us" option:`
  String get rateUsHowItWorksDescription {
    return Intl.message(
      'When you use the "Rate Us" option:',
      name: 'rateUsHowItWorksDescription',
      desc: '',
      args: [],
    );
  }

  /// `You may be redirected to our app’s page on the App Store or Google Play to leave a review or rating.`
  String get rateUsHowItWorksRedirect {
    return Intl.message(
      'You may be redirected to our app’s page on the App Store or Google Play to leave a review or rating.',
      name: 'rateUsHowItWorksRedirect',
      desc: '',
      args: [],
    );
  }

  /// `We do not collect any personal information through this feature without your explicit consent.`
  String get rateUsHowItWorksNoData {
    return Intl.message(
      'We do not collect any personal information through this feature without your explicit consent.',
      name: 'rateUsHowItWorksNoData',
      desc: '',
      args: [],
    );
  }

  /// `2. Data Collection During Rating`
  String get rateUsDataCollectionTitle {
    return Intl.message(
      '2. Data Collection During Rating',
      name: 'rateUsDataCollectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `If you are simply redirected to the app store — no data is collected by us.`
  String get rateUsDataCollectionNoData {
    return Intl.message(
      'If you are simply redirected to the app store — no data is collected by us.',
      name: 'rateUsDataCollectionNoData',
      desc: '',
      args: [],
    );
  }

  /// `If you leave a review or rating, it is submitted through the App Store or Google Play platforms and governed by their own privacy policies, not ours.`
  String get rateUsDataCollectionStorePolicy {
    return Intl.message(
      'If you leave a review or rating, it is submitted through the App Store or Google Play platforms and governed by their own privacy policies, not ours.',
      name: 'rateUsDataCollectionStorePolicy',
      desc: '',
      args: [],
    );
  }

  /// `3. Why Your Rating Matters`
  String get rateUsWhyItMattersTitle {
    return Intl.message(
      '3. Why Your Rating Matters',
      name: 'rateUsWhyItMattersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your ratings and reviews:`
  String get rateUsWhyItMattersDescription {
    return Intl.message(
      'Your ratings and reviews:',
      name: 'rateUsWhyItMattersDescription',
      desc: '',
      args: [],
    );
  }

  /// `Help other users discover and trust our app`
  String get rateUsWhyItMattersDiscovery {
    return Intl.message(
      'Help other users discover and trust our app',
      name: 'rateUsWhyItMattersDiscovery',
      desc: '',
      args: [],
    );
  }

  /// `Provide us with valuable feedback to improve features or fix issues`
  String get rateUsWhyItMattersFeedback {
    return Intl.message(
      'Provide us with valuable feedback to improve features or fix issues',
      name: 'rateUsWhyItMattersFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Support the ongoing development and improvement of the app`
  String get rateUsWhyItMattersDevelopment {
    return Intl.message(
      'Support the ongoing development and improvement of the app',
      name: 'rateUsWhyItMattersDevelopment',
      desc: '',
      args: [],
    );
  }

  /// `4. Contact Us Directly`
  String get rateUsContactTitle {
    return Intl.message(
      '4. Contact Us Directly',
      name: 'rateUsContactTitle',
      desc: '',
      args: [],
    );
  }

  /// `Having issues or suggestions? Instead of leaving a negative review, feel free to reach out to us directly — we’re always happy to help!`
  String get rateUsContactDescription {
    return Intl.message(
      'Having issues or suggestions? Instead of leaving a negative review, feel free to reach out to us directly — we’re always happy to help!',
      name: 'rateUsContactDescription',
      desc: '',
      args: [],
    );
  }

  /// `Support Email: {contactEmail}`
  String rateUsContactEmail(Object contactEmail) {
    return Intl.message(
      'Support Email: $contactEmail',
      name: 'rateUsContactEmail',
      desc: '',
      args: [contactEmail],
    );
  }

  /// `We respect your right to control your personal data. If you wish to delete your account, we provide an easy way to request full removal of your information.`
  String get deleteAccountDescription {
    return Intl.message(
      'We respect your right to control your personal data. If you wish to delete your account, we provide an easy way to request full removal of your information.',
      name: 'deleteAccountDescription',
      desc: '',
      args: [],
    );
  }

  /// `1. How to Delete Your Account`
  String get deleteAccountHowToTitle {
    return Intl.message(
      '1. How to Delete Your Account',
      name: 'deleteAccountHowToTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can request to delete your account by:`
  String get deleteAccountHowToDescription {
    return Intl.message(
      'You can request to delete your account by:',
      name: 'deleteAccountHowToDescription',
      desc: '',
      args: [],
    );
  }

  /// `Using the “Delete Account” option in the app (if available), or`
  String get deleteAccountHowToOption {
    return Intl.message(
      'Using the “Delete Account” option in the app (if available), or',
      name: 'deleteAccountHowToOption',
      desc: '',
      args: [],
    );
  }

  /// `Contacting us directly at {contactEmail} with the subject line “Account Deletion Request”`
  String deleteAccountHowToEmail(Object contactEmail) {
    return Intl.message(
      'Contacting us directly at $contactEmail with the subject line “Account Deletion Request”',
      name: 'deleteAccountHowToEmail',
      desc: '',
      args: [contactEmail],
    );
  }

  /// `2. What Happens When You Delete Your Account`
  String get deleteAccountWhatHappensTitle {
    return Intl.message(
      '2. What Happens When You Delete Your Account',
      name: 'deleteAccountWhatHappensTitle',
      desc: '',
      args: [],
    );
  }

  /// `Once we receive your request:`
  String get deleteAccountWhatHappensDescription {
    return Intl.message(
      'Once we receive your request:',
      name: 'deleteAccountWhatHappensDescription',
      desc: '',
      args: [],
    );
  }

  /// `We will permanently delete your account and associated personal data from our systems (unless retention is required by law).`
  String get deleteAccountWhatHappensDeleteData {
    return Intl.message(
      'We will permanently delete your account and associated personal data from our systems (unless retention is required by law).',
      name: 'deleteAccountWhatHappensDeleteData',
      desc: '',
      args: [],
    );
  }

  /// `Your app usage history, preferences, and any stored data will be removed and cannot be restored.`
  String get deleteAccountWhatHappensAnonymizedData {
    return Intl.message(
      'Your app usage history, preferences, and any stored data will be removed and cannot be restored.',
      name: 'deleteAccountWhatHappensAnonymizedData',
      desc: '',
      args: [],
    );
  }

  /// `3. Data Retention Exceptions`
  String get deleteAccountRetentionTitle {
    return Intl.message(
      '3. Data Retention Exceptions',
      name: 'deleteAccountRetentionTitle',
      desc: '',
      args: [],
    );
  }

  /// `We may retain certain information if:`
  String get deleteAccountRetentionDescription {
    return Intl.message(
      'We may retain certain information if:',
      name: 'deleteAccountRetentionDescription',
      desc: '',
      args: [],
    );
  }

  /// `Required by law or legal obligations (e.g., fraud prevention, accounting)`
  String get deleteAccountRetentionLegal {
    return Intl.message(
      'Required by law or legal obligations (e.g., fraud prevention, accounting)',
      name: 'deleteAccountRetentionLegal',
      desc: '',
      args: [],
    );
  }

  /// `Necessary for resolving disputes or enforcing our policies`
  String get deleteAccountRetentionDisputes {
    return Intl.message(
      'Necessary for resolving disputes or enforcing our policies',
      name: 'deleteAccountRetentionDisputes',
      desc: '',
      args: [],
    );
  }

  /// `4. Need Help?`
  String get deleteAccountHelpTitle {
    return Intl.message(
      '4. Need Help?',
      name: 'deleteAccountHelpTitle',
      desc: '',
      args: [],
    );
  }

  /// `If you have questions or need help with account deletion, please contact us at:`
  String get deleteAccountHelpDescription {
    return Intl.message(
      'If you have questions or need help with account deletion, please contact us at:',
      name: 'deleteAccountHelpDescription',
      desc: '',
      args: [],
    );
  }

  /// `Email: {contactEmail}`
  String deleteAccountHelpEmail(Object contactEmail) {
    return Intl.message(
      'Email: $contactEmail',
      name: 'deleteAccountHelpEmail',
      desc: '',
      args: [contactEmail],
    );
  }

  /// `Food`
  String get food {
    return Intl.message('Food', name: 'food', desc: '', args: []);
  }

  /// `Exercise`
  String get exercise {
    return Intl.message('Exercise', name: 'exercise', desc: '', args: []);
  }

  /// `Sleep and Relax`
  String get sleepAndRelax {
    return Intl.message(
      'Sleep and Relax',
      name: 'sleepAndRelax',
      desc: '',
      args: [],
    );
  }

  /// `Hydration`
  String get hydration {
    return Intl.message('Hydration', name: 'hydration', desc: '', args: []);
  }

  /// `Mental`
  String get mental {
    return Intl.message('Mental', name: 'mental', desc: '', args: []);
  }

  /// `ALL CATEGORIES`
  String get allCategories {
    return Intl.message(
      'ALL CATEGORIES',
      name: 'allCategories',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
