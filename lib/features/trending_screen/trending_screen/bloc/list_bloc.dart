import 'package:ai_fit_coach/common/api/model/workout/workout_item.dart';
import 'package:ai_fit_coach/repositories/challenge_repository/abstract_challenge_repository.dart';
import 'package:ai_fit_coach/repositories/food_recommendation_repository/abstract_food_recommendation_repository.dart';
import 'package:ai_fit_coach/repositories/workout_repository/abstract_workout_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/api/model/challenges/challenge_item.dart';
import '../../../../common/api/model/home/food_recommendation_item.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final AbstractChallengeRepository _challengeRepository;
  final AbstractWorkoutRepository _workoutRepository;
  final AbstractFoodRecommendationRepository _foodRecommendationRepository;
  ListBloc(
      {required AbstractChallengeRepository challengeRepository,
      required AbstractWorkoutRepository workoutRepository,
      required AbstractFoodRecommendationRepository
          foodRecommendationRepository})
      : _challengeRepository = challengeRepository,
        _workoutRepository = workoutRepository,
        _foodRecommendationRepository = foodRecommendationRepository,
        super(ListInitial()) {
    on<LoadListEvent>(_loadList);
  }
  Future<void> _loadList(LoadListEvent event, emit) async {
    if (state is! ListHomeLoaded) {
      emit(ListHomeLoading());
    }
    try {
      final listFoodRecommendationItem =
          await _foodRecommendationRepository.getFoodRecommendationItems();
      final listChallengeItem = await _challengeRepository
          .getChallengeItemsFromCollection();
      final listWorkoutItem = await _workoutRepository
          .getWorkoutItemsFromCollection();
      emit(ListHomeLoaded(
          trendingChallengeList: listChallengeItem,
          trendingWorkoutList: listWorkoutItem,
          trendingFoodRecommendationList: listFoodRecommendationItem));
    } catch (e) {
      emit(ListHomeFailure(error: e));
    }
  }
}
