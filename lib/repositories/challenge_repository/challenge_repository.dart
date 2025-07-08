import 'package:ai_fit_coach/common/api/model/challenges/challenge_item.dart';
import 'package:ai_fit_coach/repositories/challenge_repository/abstract_challenge_repository.dart';
import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

const String parentDocId = 'challenges';

class ChallengeRepository implements AbstractChallengeRepository {
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

@override
  Future<void> saveChallengeFoodItem(ChallengeItem item) async {
    await saveChallengeItemInSubcollection(item, 'food');
  }

@override
  Future<void> saveChallengeExerciseItem(ChallengeItem item) async {
    await saveChallengeItemInSubcollection(item, 'exercise');
  }

@override
  Future<void> saveChallengeSleepAndRelaxItem(ChallengeItem item) async {
    await saveChallengeItemInSubcollection(item, 'sleepAndRelax');
  }

@override
  Future<void> saveChallengeHydrationItem(ChallengeItem item) async {
    await saveChallengeItemInSubcollection(item, 'hydration');
  }

@override
  Future<void> saveChallengeMentalItem(ChallengeItem item) async {
    await saveChallengeItemInSubcollection(item, 'mental');
  }

  // Future<void> foodChallenges() async {
  //   final item = ChallengeItem(
  //     id: '',
  //     title: "Eat Breakfast Every Morning",
  //     subtitle: '7 Days challenge',
  //     price: 4.69,
  //     imageUrl: AppConst.challengeFood5Image,
  //   );

  //   try {
  //     await saveChallengeFoodItem(item);
  //     print('saveChallengeFoodItem saved successfully');
  //   } catch (e) {
  //     print('Saving error $e');
  //   }
  // }

  // Future<void> exerciseChallenges() async {
  //   final item = ChallengeItem(
  //     id: '',
  //     title: '',
  //     subtitle: '',
  //     price: 0,
  //     imageUrl: AppConst.challengeExercise5Image,
  //   );

  //   try {
  //     await saveChallengeExerciseItem(item);
  //     print('saveChallengeExerciseItem saved successfully');
  //   } catch (e) {
  //     print('Saving error $e');
  //   }
  // }

  // Future<void> sleepAndRelaxChallenges() async {
  //   final item = ChallengeItem(
  //     id: '',
  //     title: '',
  //     subtitle: '',
  //     price: 0,
  //     imageUrl: AppConst.challengeSleepAndRelax5Image,
  //   );

  //   try {
  //     await saveChallengeSleepAndRelaxItem(item);
  //     print('saveChallengeSleepAndRelaxItem saved successfully');
  //   } catch (e) {
  //     print('Saving error $e');
  //   }
  // }

  // Future<void> hydrationChallenges() async {
  //   final item = ChallengeItem(
  //     id: '',
  //     title: '',
  //     subtitle: '',
  //     price: 0,
  //     imageUrl: AppConst.challengeHydration5Image,
  //   );

  //   try {
  //     await saveChallengeHydrationItem(item);
  //     print('saveChallengeHydrationItem saved successfully');
  //   } catch (e) {
  //     print('Saving error $e');
  //   }
  // }

  // Future<void> mentalChallenges() async {
  //   final item = ChallengeItem(
  //     id: '',
  //     title: '',
  //     subtitle: '',
  //     price: 0,
  //     imageUrl: AppConst.challengeMental5Image,
  //   );

  //   try {
  //     await saveChallengeMentalItem(item);
  //     print('saveChallengeMentalItem saved successfully');
  //   } catch (e) {
  //     print('Saving error $e');
  //   }
  // }

@override
  Future<List<ChallengeItem>> getChallengeItemsFromSubcollection(
      String subcollectionName) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection("challenges")
          .doc(parentDocId)
          .collection(subcollectionName)
          .get();
      return snapshot.docs
          .map((doc) => ChallengeItem.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching items from $subcollectionName: $e');
      rethrow;
    }
  }

  @override
  Future<List<ChallengeItem>> getChallengeItemsFromCollection() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection("trendingChallenges")
          .get();
      return snapshot.docs
          .map((doc) => ChallengeItem.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

// save method for trendingfood homepage challenges

  // Future<void> saveChallengeItemInCollection(
  //     ChallengeItem item) async {
  //   final generatedId = Uuid().v4();
  //   final newItem = item.copyWith(id: generatedId);
  //   final docRef = FirebaseFirestore.instance
  //       .collection('trendingChallenges')
  //       .doc(generatedId);
  //   await docRef.set(newItem.toJson());
  // }

// @override
// Future<void> trendingfoodChallenges() async {
//     final item = ChallengeItem(
//       id: '',
//       title: 'Gratitude Journal',
//       subtitle: '7-Day challenge',
//       price: 0,
//       imageUrl: '',
//       description: 'Each day, write down 3 things you’re grateful for. Reflect on positives and build emotional resilience through intentional focus.'
//     );

//     try {
//       await saveChallengeTrendingFoodItem(item);
//       print('saveChallengeTrendingFoodItem saved successfully');
//     } catch (e) {
//       print('Saving error $e');
//     }
//   }

// @override
//   Future<void> saveChallengeTrendingFoodItem(ChallengeItem item) async {
//     await saveChallengeItemInCollection(item);
//   }
