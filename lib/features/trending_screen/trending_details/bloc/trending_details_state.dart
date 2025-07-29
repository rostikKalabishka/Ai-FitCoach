part of 'trending_details_bloc.dart';

sealed class TrendingDetailsState extends Equatable {
  const TrendingDetailsState();

  @override
  List<Object> get props => [];
}

final class TrendingDetailsInitial extends TrendingDetailsState {}

final class TrendingDetailsLoading extends TrendingDetailsState {}

final class TrendingDetailsLoaded extends TrendingDetailsState {
  final RecommendationItem recommendationItem;

  const TrendingDetailsLoaded({
    required this.recommendationItem,
  });

  @override
  List<Object> get props => [recommendationItem];
}

final class TrendingDetailsFailure extends TrendingDetailsState {
  final Object error;

  const TrendingDetailsFailure({required this.error});

  @override
  List<Object> get props => [error];
}
