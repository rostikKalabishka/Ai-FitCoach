part of 'trending_details_bloc.dart';

sealed class TrendingDetailsEvent extends Equatable {
  const TrendingDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadingTrendingDetails extends TrendingDetailsEvent{
  final String id;
  final RecommendationCategory recommendationCategory;

const LoadingTrendingDetails({required this.id, required this.recommendationCategory});

@override
  List<Object> get props => [id, recommendationCategory];
}