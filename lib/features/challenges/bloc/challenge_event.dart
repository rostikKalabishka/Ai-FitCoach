part of 'challenge_bloc.dart';

sealed class ChallengeEvent extends Equatable {
  const ChallengeEvent();

  @override
  List<Object> get props => [];
}

class LoadListChallengeItemEvent extends ChallengeEvent{}