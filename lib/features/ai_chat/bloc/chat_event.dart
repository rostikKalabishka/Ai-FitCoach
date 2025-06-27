part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ChatEvent {
  final String message;

  const SendMessageEvent({required this.message});

  @override
  List<Object> get props => [message];
  // @override
  // List<Object> get props => super.props.addAll([]);
}

class GetResponse extends ChatEvent {
  final Message message;

  const GetResponse({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadChatEvent extends ChatEvent {
  final String chatId;
  final String userCreatorChatId;

  const LoadChatEvent({
    required this.chatId,
    required this.userCreatorChatId,
  });

  @override
  List<Object> get props => [chatId, userCreatorChatId];
}
