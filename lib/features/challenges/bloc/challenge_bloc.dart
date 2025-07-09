import 'dart:developer';
import 'package:ai_fit_coach/common/api/model/challenges/challenge_item.dart';
import 'package:ai_fit_coach/repositories/challenge_repository/abstract_challenge_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'challenge_event.dart';
part 'challenge_state.dart';

class ChallengeBloc extends Bloc<ChallengeEvent, ChallengeState> {
  final AbstractChallengeRepository _challengeRepository;
  ChallengeBloc({required AbstractChallengeRepository challengeRepository})
      : _challengeRepository = challengeRepository,
        super(ChallengeInitial()) {
    on<LoadListChallengeItemEvent>(_loadListChallengeItem);
  }
  Future<void> _loadListChallengeItem(
      LoadListChallengeItemEvent event, emit) async {
    if (state is! ChallengeLoaded) {
      emit(ChallengeLoading());
    }
    try {
      final listChallengeSectorItem = await _challengeRepository
          .getChallengeItemsFromSubcollection('food');
      emit(ChallengeLoaded(listChallengeSectorItem: listChallengeSectorItem));
    } catch (e) {
      emit(ChallengeFailure(error: e));
      log(e.toString());
    }
  }
}
