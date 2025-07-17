part of 'challenge_bloc.dart';

sealed class ChallengeEvent extends Equatable {
  const ChallengeEvent();

  @override
  List<Object> get props => [];
}

class LoadListChallengeItemEvent extends ChallengeEvent{
  final String categoryType;

const LoadListChallengeItemEvent({required this.categoryType});

  @override
  List<Object> get props => [categoryType];
}