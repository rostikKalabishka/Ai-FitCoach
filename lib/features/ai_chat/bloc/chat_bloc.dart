import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/api/model/model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const AiChatInitial()) {
    on<LoadChatEvent>(_onLoadChat);
    on<SendMessageEvent>(_onSendMessage);
  }

  Future<void> _onLoadChat(LoadChatEvent event, Emitter<ChatState> emit) async {
    try {} catch (e) {}
  }

  void _onSendMessage(SendMessageEvent event, Emitter<ChatState> emit) {}
}
