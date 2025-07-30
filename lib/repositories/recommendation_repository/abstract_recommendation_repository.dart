import 'package:ai_fit_coach/common/api/model/challenge_recommendation/challenge_recommendation.dart';
import 'package:ai_fit_coach/common/api/model/challenges/challenge_item.dart';
import 'package:ai_fit_coach/common/api/model/home/food_recommendation_item.dart';
import 'package:ai_fit_coach/common/api/model/workout/workout_item.dart';
import 'package:ai_fit_coach/common/api/model/workout_recommendation/workout_recommendation.dart';

abstract interface class AbstractRecommendationRepository {
  Future<List<FoodRecommendationItem>> getFoodRecommendationItems();

  Future<List<ChallengeItem>> getChallengeItemsFromCollection();

  Future<List<WorkoutItem>> getWorkoutItemsFromCollection();

  Future<WorkoutRecommendation> getWorkoutItem(String id);

  Future<ChallengeRecommendation> getChallengeItem(String id);

  Future<FoodRecommendationItem> getFoodItem(String id);
}
