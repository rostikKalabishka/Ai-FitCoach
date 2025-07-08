import 'package:ai_fit_coach/common/api/model/challenges/challenge_item.dart';

abstract interface class AbstractChallengeRepository {

Future<void> saveChallengeFoodItem(ChallengeItem item);

Future<void> saveChallengeExerciseItem(ChallengeItem item);

Future<void> saveChallengeSleepAndRelaxItem(ChallengeItem item);

Future<void> saveChallengeHydrationItem(ChallengeItem item);

Future<void> saveChallengeMentalItem(ChallengeItem item);

Future<List<ChallengeItem>> getChallengeItemsFromCollection();

Future<List<ChallengeItem>> getChallengeItemsFromSubcollection(String subcollectionName);
}