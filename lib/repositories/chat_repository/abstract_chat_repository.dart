import '../../common/api/model/model.dart';

abstract interface class AbstractChatRepository {
  Future<Message> sendMessage({
    required ChatModel chatModel,
    required Message userMessage,
  });

  Future<ChatModel> getChat({required String chatId});
}
