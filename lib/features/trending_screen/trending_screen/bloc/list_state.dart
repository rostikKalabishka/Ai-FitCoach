part of 'list_bloc.dart';

sealed class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

final class ListInitial extends ListState {}

final class ListHomeLoading extends ListState {}

final class ListHomeLoaded extends ListState {
  final List<WorkoutItem> trendingWorkoutList;
  final List<ChallengeItem> trendingChallengeList;
  final List<FoodRecommendationItem> trendingFoodRecommendationList;

  const ListHomeLoaded(
      {required this.trendingWorkoutList,
      required this.trendingChallengeList,
      required this.trendingFoodRecommendationList});

  @override
  List<Object> get props => [trendingWorkoutList, trendingChallengeList, trendingFoodRecommendationList];
}

final class ListHomeFailure extends ListState {
  final Object error;

  const ListHomeFailure({required this.error});

  @override
  List<Object> get props => [error];
}
