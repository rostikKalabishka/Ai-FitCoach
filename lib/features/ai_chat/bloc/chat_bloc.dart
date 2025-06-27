import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../../common/api/model/model.dart';
import 'package:ai_fit_coach/repositories/chat_repository/abstract_chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final AbstractChatRepository _chatRepository;
  late ChatModel _chatModel;

  ChatBloc({required AbstractChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(const AiChatInitial()) {
    on<LoadChatEvent>(_onLoadChat);
    on<SendMessageEvent>(_onSendMessage);
    on<GetResponse>(_onGetResponse);
  }

  Future<void> _onLoadChat(LoadChatEvent event, Emitter<ChatState> emit) async {
    if (state is! AiChatLoaded) {
      emit(AiChatLoading());
    }
    try {
      if (event.chatId.isEmpty) {
        _chatModel = ChatModel.emptyChatModel.copyWith(
            createAt: DateTime.now(),
            updateAt: DateTime.now(),
            userCreatorChat: event.userCreatorChatId);
      } else {
        _chatModel = await _chatRepository.getChat(chatId: event.chatId);
      }

      emit(AiChatLoaded(chatModel: _chatModel));
    } catch (e) {
      emit(AiChatFailure(e));
    }
  }

  Future<void> _onSendMessage(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    if (state is! AiChatLoaded) {
      emit(AiChatLoading());
    }

    final userMessage = Message.emptyMessage.copyWith(
      message: event.message,
      isUser: true,
      createAt: DateTime.now(),
      id: const Uuid().v4(),
    );

    await _updateMessages(userMessage, emit, true);

    try {
      final aiResponse = await _chatRepository.sendMessage(
        chatModel: _chatModel,
        userMessage: userMessage,
      );
      add(GetResponse(
        message: aiResponse,
      ));
    } catch (e) {
      emit(AiChatFailure(e));
    }
  }

  void _onGetResponse(GetResponse event, Emitter<ChatState> emit) async {
    await _updateMessages(event.message, emit, false);
  }

  Future<void> _updateMessages(
      Message message, Emitter<ChatState> emit, bool isTyping) async {
    if (state is! AiChatLoaded) {
      emit(AiChatLoading());
    }
    try {
      _chatModel = _chatModel.copyWith(
        messages: [..._chatModel.messages, message],
      );
      if (_chatModel.id.isNotEmpty) {
        await _chatRepository.updateChat(chatModel: _chatModel);
      } else {
        _chatModel = _chatModel.copyWith(
          id: Uuid().v4(),
        );
        await _chatRepository.createChat(chatModel: _chatModel);
      }
      emit(AiChatLoaded(chatModel: _chatModel, isTyping: isTyping));
    } catch (e) {
      emit(AiChatFailure(e));
    }
  }
}
