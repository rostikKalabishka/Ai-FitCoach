import 'dart:async';
import 'dart:developer';

import 'package:ai_fit_coach/common/api/model/chat_model.dart';
import 'package:ai_fit_coach/repositories/chat_repository/abstract_chat_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final AbstractChatRepository _chatRepository;
  StreamSubscription<List<ChatModel>>? _historySubscription;
  Timer? searchDebounce;
  HistoryBloc({required AbstractChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(HistoryInitial()) {
    on<LoadHistoryEvent>(_loadHistory);
    on<ChatHistoryUpdatedEvent>((event, emit) {
      emit(HistoryLoaded(historyList: event.chatHistory));
    });
    on<SearchChatEvent>(_searchChat);
    on<DeleteChatEvent>(_deleteChat);
  }
  void _loadHistory(LoadHistoryEvent event, Emitter<HistoryState> emit) {
    _historySubscription?.cancel();
    emit(HistoryLoading());
    try {
      _historySubscription = _chatRepository
          .getHistoryStream(userId: event.userId)
          .listen((chatHistory) {
        add(ChatHistoryUpdatedEvent(chatHistory: chatHistory));
      });
    } catch (e) {
      emit(HistoryFailure(error: e));
    }
  }

  Future<void> _searchChat(SearchChatEvent event, emit) async {
    if (state is! HistoryLoaded) {
      emit(HistoryLoading());
    }
    try {
      searchDebounce?.cancel();

      final completer = Completer<void>();

      searchDebounce = Timer(const Duration(milliseconds: 300), () async {
        final history = await _chatRepository.searchChat(
            query: event.query, userId: event.userId);
        add(ChatHistoryUpdatedEvent(chatHistory: history));

        completer.complete();
      });
      await completer.future;
    } catch (e) {
      emit(HistoryFailure(error: e));
    }
  }

  Future<void> _deleteChat(DeleteChatEvent event, emit) async {
    if (state is! HistoryLoaded) {
      emit(HistoryLoading());
    }

    try {
      final currentHistory = (state as HistoryLoaded).historyList;

      final updatedHistory =
          currentHistory.where((chat) => chat.id != event.chatId).toList();

      await _chatRepository.deleteChat(chatId: event.chatId);
      emit(HistoryLoaded(historyList: updatedHistory));
    } catch (e) {
      log(e.toString());
      emit(HistoryFailure(error: e));
    }
  }
}
