import 'package:ai_fit_coach/common/api/model/challenges/challenge_item.dart';

abstract interface class AbstractChallengeRepository {

Future<List<ChallengeItem>> getChallengeItemsFromCollection();

Future<List<ChallengeItem>> getChallengesItemsInCollection(String categoryType);
}