import 'package:ai_fit_coach/common/api/chat_api.dart';
import 'package:ai_fit_coach/common/api/model/chat_model.dart';
import 'package:ai_fit_coach/common/api/model/message_model.dart';
import 'package:ai_fit_coach/repositories/chat_repository/abstract_chat_repository.dart';

class ChatRepository implements AbstractChatRepository {
  final ChatApiClient _chatApiClient = ChatApiClient();
  @override
  Future<ChatModel> getChat({required String chatId}) async {
    return _chatApiClient.getChat(chatId: chatId);
  }

  @override
  Future<Message> sendMessage(
      {required ChatModel chatModel, required Message userMessage}) {
    return _chatApiClient.sendMessage(
        chatModel: chatModel, userMessage: userMessage);
  }

  @override
  Future<void> createChat({required ChatModel chatModel}) async {
    return _chatApiClient.createChat(chatModel: chatModel);
  }

  @override
  Future<void> updateChat({required ChatModel chatModel}) async {
    return _chatApiClient.updateChat(chatModel: chatModel);
  }

  @override
  Future<void> deleteChat({required String chatId}) async {
    return _chatApiClient.deleteChat(chatId: chatId);
  }

  @override
  Stream<List<ChatModel>> getHistoryStream({required String userId}) {
    return _chatApiClient.getHistoryStream(userId: userId);
  }

  @override
  Future<void> renameChat(
      {required String chatId, required String newName}) async {
    return _chatApiClient.renameChat(chatId: chatId, newName: newName);
  }

  @override
  Future<List<ChatModel>> searchChat(
      {required String query, required String userId}) async {
    return _chatApiClient.searchChat(userId: userId, query: query);
  }
}
