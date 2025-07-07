part of 'challenge_bloc.dart';

sealed class ChallengeState extends Equatable {
  const ChallengeState();
  
  @override
  List<Object> get props => [];
}

final class ChallengeInitial extends ChallengeState {}

final class ChallengeLoading extends ChallengeState {}

final class ChallengeLoaded extends ChallengeState {
  final List<ChallengeItem> listChallengeSectorItem;

  const ChallengeLoaded({required this.listChallengeSectorItem});

  @override 
  List<Object> get props => [listChallengeSectorItem];
}

final class ChallengeFailure extends ChallengeState {
  final Object error;

  const ChallengeFailure({required this.error});

  @override
  List<Object> get props => [error];
}
