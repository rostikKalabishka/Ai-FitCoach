part of 'history_bloc.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class LoadHistoryEvent extends HistoryEvent {
  final String userId;

  const LoadHistoryEvent({required this.userId});

  @override
  List<Object> get props => super.props..add(userId);
}

class SearchChatEvent extends HistoryEvent {
  final String query;
  final String userId;

  const SearchChatEvent({
    required this.query,
    required this.userId,
  });

  @override
  List<Object> get props => super.props..addAll([query, userId]);
}

class ChatHistoryUpdatedEvent extends HistoryEvent {
  final List<ChatModel> chatHistory;

  const ChatHistoryUpdatedEvent({required this.chatHistory});
}

class DeleteChatEvent extends HistoryEvent {
  final String chatId;

  const DeleteChatEvent({
    required this.chatId,
  });
  @override
  List<Object> get props => super.props
    ..add(
      chatId,
    );
}
