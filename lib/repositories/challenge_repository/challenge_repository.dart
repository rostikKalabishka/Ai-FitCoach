import 'package:ai_fit_coach/common/api/model/challenges/challenge_item.dart';
import 'package:ai_fit_coach/repositories/challenge_repository/abstract_challenge_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String parentDocId = 'challenges';

class ChallengeRepository implements AbstractChallengeRepository {
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

  @override
  Future<List<ChallengeItem>> getChallengesItemsInCollection(
      String categoryType) async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection("challenges").get();
      return snapshot.docs
          .map((doc) => ChallengeItem.fromJson(doc.data()))
          .where((item) => item.categoryType == categoryType)
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




// challenges methods / food / mental / exercise / sleepAndRelax / hydration

//     Future<void> saveChallengesItemsInCollection(
//           ChallengeItem item) async {
//         final generatedId = Uuid().v4();
//         final newItem = item.copyWith(id: generatedId);
//         final docRef = FirebaseFirestore.instance
//             .collection('challenges')
//             .doc(generatedId);
//         await docRef.set(newItem.toJson());
//       }

//     @override
//     Future<void> foodChallenges() async {
//         final item = ChallengeItem(
//           categoryType: 'food',
//           id: '',
//           title: 'No Food After 8:00 PM',
//           subtitle: '21 Days',
//           price: 2.99,
//           imageUrl: '',
//           description: ''
//         );

//         try {
//           await saveChallengesFoodItem(item);
//           print('saveChallengesItem saved successfully');
//         } catch (e) {
//           print('Saving error $e');
//         }
//       }

//     @override
//       Future<void> saveChallengesFoodItem(ChallengeItem item) async {
//         await saveChallengesItemsInCollection(item);
//       }


// @override
//     Future<void> exerciseChallenges() async {
//         final item = ChallengeItem(
//           categoryType: 'exercise',
//           id: '',
//           title: 'Stretch Before Bed',
//           subtitle: '14 Days',
//           price: 2.99,
//           imageUrl: '',
//           description: ''
//         );

//         try {
//           await saveChallengesExerciseItem(item);
//           print('saveChallengesExerciseItem saved successfully');
//         } catch (e) {
//           print('Saving error $e');
//         }
//       }

//     @override
//       Future<void> saveChallengesExerciseItem(ChallengeItem item) async {
//         await saveChallengesItemsInCollection(item);
//       }


//       @override
//     Future<void> sleepAndRelaxChallenges() async {
//         final item = ChallengeItem(
//           categoryType: 'sleepAndRelax',
//           id: '',
//           title: 'Digital Sunset',
//           subtitle: '7 Days',
//           price: 2.99,
//           imageUrl: '',
//           description: ''
//         );

//         try {
//           await saveChallengesSleepAndRelaxItem(item);
//           print('saveChallengesSleepAndRelaxItem saved successfully');
//         } catch (e) {
//           print('Saving error $e');
//         }
//       }

//     @override
//       Future<void> saveChallengesSleepAndRelaxItem(ChallengeItem item) async {
//         await saveChallengesItemsInCollection(item);
//       }


//       @override
//     Future<void> hydrationChallenges() async {
//         final item = ChallengeItem(
//           categoryType: 'hydration',
//           id: '',
//           title: 'Evening Unwind with Herbal Tea or Warm Water',
//           subtitle: '5 Days',
//           price: 2.99,
//           imageUrl: '',
//           description: ''
//         );

//         try {
//           await saveChallengesHydrationItem(item);
//           print('saveChallengesHydrationItem saved successfully');
//         } catch (e) {
//           print('Saving error $e');
//         }
//       }

//     @override
//       Future<void> saveChallengesHydrationItem(ChallengeItem item) async {
//         await saveChallengesItemsInCollection(item);
//       }


//       @override
//     Future<void> mentalChallenges() async {
//         final item = ChallengeItem(
//           categoryType: 'mental',
//           id: '',
//           title: 'Nightly Gratitude',
//           subtitle: '14 Days',
//           price: 2.99,
//           imageUrl: '',
//           description: ''
//         );

//         try {
//           await saveChallengesMentalItem(item);
//           print('saveChallengesMentalItem saved successfully');
//         } catch (e) {
//           print('Saving error $e');
//         }
//       }

//     @override
//       Future<void> saveChallengesMentalItem(ChallengeItem item) async {
//         await saveChallengesItemsInCollection(item);
//       }