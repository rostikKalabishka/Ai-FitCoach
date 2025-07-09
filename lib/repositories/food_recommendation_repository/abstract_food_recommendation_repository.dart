import 'package:ai_fit_coach/common/api/model/home/food_recommendation_item.dart';

abstract interface class AbstractFoodRecommendationRepository {
  Future<List<FoodRecommendationItem>> getFoodRecommendationItems();
}
