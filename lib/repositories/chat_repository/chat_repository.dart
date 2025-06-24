import 'package:ai_fit_coach/common/api/chat_api.dart';
import 'package:ai_fit_coach/common/api/model/chat_model.dart';
import 'package:ai_fit_coach/common/api/model/message_model.dart';
import 'package:ai_fit_coach/repositories/chat_repository/abstract_chat_repository.dart';

class ChatRepository implements AbstractChatRepository {
  final ChatApiClient _chatApiClient = ChatApiClient();
  @override
  Future<ChatModel> getChat({required String chatId}) {
    // TODO: implement getChat
    throw UnimplementedError();
  }

  @override
  Future<Message> sendMessage(
      {required ChatModel chatModel, required Message userMessage}) {
    return _chatApiClient.sendMessage(
        chatModel: chatModel, userMessage: userMessage);
  }
}
