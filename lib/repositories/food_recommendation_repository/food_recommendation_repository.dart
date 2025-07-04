import 'package:ai_fit_coach/common/api/model/home/food_recommendation_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

Future<void> saveFoodRecommendationItemInCollection(
    FoodRecommendationItem item) async {
  final generatedId = Uuid().v4();
  final newItem = item.copyWith(id: generatedId);

  final docRef = FirebaseFirestore.instance
      .collection('foodRecommendation')
      .doc(generatedId);

  await docRef.set(newItem.toJson());
}

Future<void> saveFoodRecommendationItem(FoodRecommendationItem item) async {
  await saveFoodRecommendationItemInCollection(item);
}

Future<void> foodRecommendation() async {
  final item = FoodRecommendationItem(
    id: '',
    title: 'Smoothie Bowl with Berries & Seeds',
    imageUrl: '',
    foodCategory: 'Dairy-Free',
    description: ''
  );

  try {
    await saveFoodRecommendationItem(item);
    print('saveFoodRecommendationItem saved successfully');
  } catch (e) {
    print('Saving error $e');
  }
}

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

