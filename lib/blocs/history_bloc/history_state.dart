part of 'history_bloc.dart';

sealed class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistoryLoaded extends HistoryState {
  final List<ChatModel> historyList;

  const HistoryLoaded({required this.historyList});

  @override
  List<Object> get props => super.props..add(historyList);
}

final class HistoryFailure extends HistoryState {
  final Object error;

  const HistoryFailure({required this.error});

  @override
  List<Object> get props => super.props..add(error);
}
