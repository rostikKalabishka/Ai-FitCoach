import 'package:ai_fit_coach/common/api/model/challenges/challenge_item.dart';
import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

const String parentDocId = 'сhallenges';

Future<void> saveChallengeItemInSubcollection(
    ChallengeItem item, String subcollectionName) async {
  final generatedId = Uuid().v4();
  final newItem = item.copyWith(id: generatedId);

  final docRef = FirebaseFirestore.instance
      .collection('challenges')
      .doc(parentDocId)
      .collection(subcollectionName)
      .doc(generatedId);

  await docRef.set(newItem.toJson());
}

Future<void> saveChallengeFoodItem(ChallengeItem item) async {
  await saveChallengeItemInSubcollection(item, 'food');
}

Future<void> saveChallengeExerciseItem(ChallengeItem item) async {
  await saveChallengeItemInSubcollection(item, 'exercise');
}

Future<void> saveChallengeSleepAndRelaxItem(ChallengeItem item) async {
  await saveChallengeItemInSubcollection(item, 'sleepAndRelax');
}

Future<void> saveChallengeHydrationItem(ChallengeItem item) async {
  await saveChallengeItemInSubcollection(item, 'hydration');
}

Future<void> saveChallengeMentalItem(ChallengeItem item) async {
  await saveChallengeItemInSubcollection(item, 'mental');
}

Future<void> foodChallenges() async {
  final item = ChallengeItem(
    id: '',
    title: "",
    subtitle: '',
    price: 0,
    imageUrl: AppConst.challengeFood5Image,
  );

  try {
    await saveChallengeFoodItem(item);
    print('saveChallengeFoodItem saved successfully');
  } catch (e) {
    print('Saving error $e');
  }
}

Future<void> exerciseChallenges() async {
  final item = ChallengeItem(
    id: '',
    title: '',
    subtitle: '',
    price: 0,
    imageUrl: AppConst.challengeExercise5Image,
  );

  try {
    await saveChallengeExerciseItem(item);
    print('saveChallengeExerciseItem saved successfully');
  } catch (e) {
    print('Saving error $e');
  }
}

Future<void> sleepAndRelaxChallenges() async {
  final item = ChallengeItem(
    id: '',
    title: '',
    subtitle: '',
    price: 0,
    imageUrl: AppConst.challengeSleepAndRelax5Image,
  );

  try {
    await saveChallengeSleepAndRelaxItem(item);
    print('saveChallengeSleepAndRelaxItem saved successfully');
  } catch (e) {
    print('Saving error $e');
  }
}

Future<void> hydrationChallenges() async {
  final item = ChallengeItem(
    id: '',
    title: '',
    subtitle: '',
    price: 0,
    imageUrl: AppConst.challengeHydration5Image,
  );

  try {
    await saveChallengeHydrationItem(item);
    print('saveChallengeHydrationItem saved successfully');
  } catch (e) {
    print('Saving error $e');
  }
}

Future<void> mentalChallenges() async {
  final item = ChallengeItem(
    id: '',
    title: '',
    subtitle: '',
    price: 0,
    imageUrl: AppConst.challengeMental5Image,
  );

  try {
    await saveChallengeMentalItem(item);
    print('saveChallengeMentalItem saved successfully');
  } catch (e) {
    print('Saving error $e');
  }
}
