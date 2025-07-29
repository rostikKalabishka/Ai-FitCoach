import 'package:ai_fit_coach/common/api/model/challenges/challenge_item.dart';
import 'package:ai_fit_coach/repositories/challenge_repository/abstract_challenge_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String parentDocId = 'challenges';

class ChallengeRepository implements AbstractChallengeRepository {
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
