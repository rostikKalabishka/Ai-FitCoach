import 'package:ai_fit_coach/common/api/model/recommendation_item/recommendation_item.dart';
import 'package:ai_fit_coach/repositories/recommendation_repository/abstract_recommendation_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trending_details_event.dart';
part 'trending_details_state.dart';

enum RecommendationCategory { workout, challenges, food }

class TrendingDetailsBloc
    extends Bloc<TrendingDetailsEvent, TrendingDetailsState> {
  final AbstractRecommendationRepository _recommendationRepository;
  TrendingDetailsBloc({
    required AbstractRecommendationRepository recommendationRepository,
  })  : _recommendationRepository = recommendationRepository,
        super(TrendingDetailsInitial()) {
    on<TrendingDetailsEvent>((event, emit) async {
      if (event is LoadingTrendingDetails) {
        await _loadingDetails(event, emit);
      }
    });
  }

  Future<void> _loadingDetails(LoadingTrendingDetails event, emit) async {
    if (state is! TrendingDetailsLoaded) {
      emit(TrendingDetailsLoading());
    }
    try {
      late RecommendationItem recommendationItem;
      if (event.recommendationCategory == RecommendationCategory.workout) {
        recommendationItem =
            await _recommendationRepository.getWorkoutItem(event.id);
      }
      emit(TrendingDetailsLoaded(recommendationItem: recommendationItem));
    } catch (e) {
      emit(TrendingDetailsFailure(error: e));
    }
  }
}
