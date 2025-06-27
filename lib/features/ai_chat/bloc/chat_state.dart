part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object?> get props => [];
}

class AiChatInitial extends ChatState {
  const AiChatInitial();
}

class AiChatLoading extends ChatState {
  const AiChatLoading();
}

class AiChatLoaded extends ChatState {
  const AiChatLoaded({
    this.chatModel = ChatModel.emptyChatModel,
    this.chatId = '',
    this.isTyping = false,
    this.isListening = false,
    this.userCreatorChatId = '',
  });

  final ChatModel chatModel;
  final String chatId;
  final bool isTyping;
  final bool isListening;

  final String userCreatorChatId;

  @override
  List<Object> get props => [
        chatModel,
        chatId,
        isTyping,
        isListening,
        userCreatorChatId,
      ];

  AiChatLoaded copyWith({
    ChatModel? chatModel,
    String? chatId,
    bool? isTyping,
    bool? isListening,
    String? userCreatorChatId,
  }) {
    return AiChatLoaded(
      chatModel: chatModel ?? this.chatModel,
      chatId: chatId ?? this.chatId,
      isTyping: isTyping ?? this.isTyping,
      isListening: isListening ?? this.isListening,
      userCreatorChatId: userCreatorChatId ?? this.userCreatorChatId,
    );
  }
}

class AiChatFailure extends ChatState {
  const AiChatFailure(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
