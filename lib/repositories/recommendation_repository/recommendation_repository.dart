import 'package:ai_fit_coach/common/api/model/challenge_recommendation/challenge_recommendation.dart';
import 'package:ai_fit_coach/common/api/model/challenges/challenge_item.dart';
import 'package:ai_fit_coach/common/api/model/home/food_recommendation_item.dart';
import 'package:ai_fit_coach/common/api/model/workout/workout_item.dart';
import 'package:ai_fit_coach/common/api/model/workout_recommendation/workout_recommendation.dart';
import 'package:ai_fit_coach/repositories/recommendation_repository/abstract_recommendation_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class RecommendationRepository implements AbstractRecommendationRepository {
  Future<void> saveFoodRecommendationItemInCollection(
      FoodRecommendationItem item) async {
    final generatedId = Uuid().v4();
    final newItem = item.copyWith(id: generatedId);

    final docRef = FirebaseFirestore.instance
        .collection('foodRecommendation')
        .doc(generatedId);

    await docRef.set(newItem.toJson());
  }

  @override
  Future<List<FoodRecommendationItem>> getFoodRecommendationItems() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('foodRecommendation')
          .get();
      return snapshot.docs
          .map((doc) => FoodRecommendationItem.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching food recommendation items: $e');
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

  @override
  Future<List<WorkoutItem>> getWorkoutItemsFromCollection() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('trendingWorkout').get();
      return snapshot.docs
          .map((doc) => WorkoutItem.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

@override
  Future<WorkoutRecommendation> getWorkoutItem(String id) async {
    try {
      final workoutDoc =
          FirebaseFirestore.instance.collection('trendingWorkout').doc(id);
      final workoutData = await workoutDoc.get();
      final workout = WorkoutRecommendation.fromJson(workoutData.data()!);
      return workout;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

@override
  Future<ChallengeRecommendation> getChallengeItem(String id) async {
    try {
      final challengeDoc =
          FirebaseFirestore.instance.collection('trendingChallenges').doc(id);
      final challengeData = await challengeDoc.get();
      final challenge = ChallengeRecommendation.fromJson(challengeData.data()!);
      return challenge;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

@override
  Future<FoodRecommendationItem> getFoodItem(String id) async {
    try {
      final foodDoc =
          FirebaseFirestore.instance.collection('foodRecommendation').doc(id);
      final foodData = await foodDoc.get();
      final food = FoodRecommendationItem.fromJson(foodData.data()!);
      return food;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}