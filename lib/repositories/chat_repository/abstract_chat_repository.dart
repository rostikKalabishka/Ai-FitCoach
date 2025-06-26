import '../../common/api/model/model.dart';

abstract interface class AbstractChatRepository {
  Future<Message> sendMessage({
    required ChatModel chatModel,
    required Message userMessage,
  });

  Future<ChatModel> getChat({required String chatId});

  Future<void> createChat({required ChatModel chatModel});

  Future<void> updateChat({required ChatModel chatModel});

  Future<void> deleteChat({required String chatId});

  Stream<List<ChatModel>> getHistoryStream({required String userId});
}
