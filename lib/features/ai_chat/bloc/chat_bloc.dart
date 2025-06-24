import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../../common/api/model/model.dart';
import 'package:ai_fit_coach/repositories/chat_repository/abstract_chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final AbstractChatRepository _chatRepository;

  ChatModel _chatModel = ChatModel(
    id: '',
    createAt: null,
    updateAt: null,
    chatName: 'test1',
    userCreatorChat: '',
    messages: [
      Message(
          isUser: true,
          message: 'sadsadasda asdasdsaddsa',
          createAt: DateTime.now(),
          id: 'id'),
      Message(
          isUser: false,
          message: 'test1234567',
          createAt: DateTime.now(),
          id: 'id'),
      Message(
          isUser: true,
          message: 'ihihihihiihhi',
          createAt: DateTime.now(),
          id: 'id'),
      Message(
          isUser: false,
          message: 'wwwwwwwww',
          createAt: DateTime.now(),
          id: 'id'),
      Message(
          isUser: true,
          message: 'yep12312312312',
          createAt: DateTime.now(),
          id: 'id'),
    ],
  );

  ChatBloc({required AbstractChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(const AiChatInitial()) {
    on<LoadChatEvent>(_onLoadChat);
    on<SendMessageEvent>(_onSendMessage);
    on<GetResponse>(_onGetResponse);
  }

  Future<void> _onLoadChat(LoadChatEvent event, Emitter<ChatState> emit) async {
    emit(AiChatLoading());
    try {
      emit(AiChatLoaded(chatModel: _chatModel));
    } catch (e) {
      emit(AiChatFailure(e));
    }
  }

  Future<void> _onSendMessage(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    final userMessage = Message.emptyMessage.copyWith(
      message: event.message,
      isUser: true,
      createAt: DateTime.now(),
      id: const Uuid().v4(),
    );

    _updateMessages(userMessage, emit, true);

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

  void _onGetResponse(GetResponse event, Emitter<ChatState> emit) {
    _updateMessages(event.message, emit, false);
  }

  void _updateMessages(
      Message message, Emitter<ChatState> emit, bool isTyping) {
    _chatModel = _chatModel.copyWith(
      messages: [..._chatModel.messages, message],
    );
    emit(AiChatLoaded(chatModel: _chatModel, isTyping: isTyping));
  }
}
