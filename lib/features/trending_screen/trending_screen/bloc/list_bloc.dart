import 'package:ai_fit_coach/common/api/model/workout/workout_item.dart';
import 'package:ai_fit_coach/repositories/recommendation_repository/abstract_recommendation_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/api/model/challenges/challenge_item.dart';
import '../../../../common/api/model/home/food_recommendation_item.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final AbstractRecommendationRepository _recommendationRepository;
  ListBloc({required AbstractRecommendationRepository recommendationRepository})
      : _recommendationRepository = recommendationRepository,
        super(ListInitial()) {
    on<LoadListEvent>(_loadList);
  }
  Future<void> _loadList(LoadListEvent event, emit) async {
    if (state is! ListHomeLoaded) {
      emit(ListHomeLoading());
    }
    try {
      final listFoodRecommendationItem =
          await _recommendationRepository.getFoodRecommendationItems();
      final listChallengeItem =
          await _recommendationRepository.getChallengeItemsFromCollection();
      final listWorkoutItem =
          await _recommendationRepository.getWorkoutItemsFromCollection();
      emit(ListHomeLoaded(
          trendingChallengeList: listChallengeItem,
          trendingWorkoutList: listWorkoutItem,
          trendingFoodRecommendationList: listFoodRecommendationItem));
    } catch (e) {
      emit(ListHomeFailure(error: e));
    }
  }
}
