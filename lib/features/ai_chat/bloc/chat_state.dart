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
    this.currentVoiceInput = '',
    this.userCreatorChatId = '',
  });

  final ChatModel chatModel;
  final String chatId;
  final bool isTyping;
  final bool isListening;
  final String currentVoiceInput;
  final String userCreatorChatId;

  @override
  List<Object> get props => [
        chatModel,
        chatId,
        isTyping,
        isListening,
        currentVoiceInput,
        userCreatorChatId,
      ];

  AiChatLoaded copyWith({
    ChatModel? chatModel,
    String? chatId,
    bool? isTyping,
    bool? isListening,
    String? currentVoiceInput,
    String? userCreatorChatId,
  }) {
    return AiChatLoaded(
      chatModel: chatModel ?? this.chatModel,
      chatId: chatId ?? this.chatId,
      isTyping: isTyping ?? this.isTyping,
      isListening: isListening ?? this.isListening,
      currentVoiceInput: currentVoiceInput ?? this.currentVoiceInput,
      userCreatorChatId: userCreatorChatId ?? this.userCreatorChatId,
    );
  }
}

class AiChatFailure extends ChatState {
  const AiChatFailure(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
