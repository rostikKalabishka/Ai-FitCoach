import 'dart:developer';

import 'package:ai_fit_coach/common/api/model/chat_model.dart';
import 'package:ai_fit_coach/common/api/promt/promt.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:uuid/uuid.dart';

import 'model/message_model.dart';

class ChatApiClient {
  final _chatsCollection = FirebaseFirestore.instance.collection('chats');
  late final GenerativeModel _model;
  ChatApiClient() {
    _model = GenerativeModel(
      model: '${dotenv.env['MODEL']}',
      apiKey: '${dotenv.env['API_KEY']}',
    );
  }

  Future<void> createChat({required ChatModel chatModel}) async {
    try {
      final ChatModel updateChat = chatModel.copyWith(
        chatName: chatModel.messages[0].message,
      );

      await _chatsCollection.doc(updateChat.id).set(updateChat.toJson());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<ChatModel> getChat({required String chatId}) async {
    try {
      final chatDoc = _chatsCollection.doc(chatId);
      final chatData = await chatDoc.get();

      final currentChat = ChatModel.fromJson(chatData.data()!);
      return currentChat;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> updateChat({required ChatModel chatModel}) async {
    try {
      await _chatsCollection.doc(chatModel.id).update({
        "messages": chatModel.messages.map((message) => message.toJson()),
        "chatName": chatModel.messages[0].message
      });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> renameChat(
      {required String chatId, required String newName}) async {
    try {
      await _chatsCollection.doc(chatId).update({"chatName": newName});
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Message> sendMessage({
    required ChatModel chatModel,
    required Message userMessage,
  }) async {
    final dateTime = DateTime.now();
    try {
      final conversationHistory = chatModel.messages
          .map((e) => '${e.isUser ? "User" : "Assistant"}: ${e.message}')
          .join('\n');

      final formattedPrompt = fitnessAssistantPrompt
          .replaceAll('{{conversationHistory}}', conversationHistory)
          .replaceAll('{{userMessage}}', userMessage.message);

      final TextPart prompt = TextPart(formattedPrompt);

      final response = await _model.generateContent([
        Content.multi([prompt])
      ]);

      final responseMessage = Message(
        isUser: false,
        message: response.text ?? 'Don’t have data',
        createAt: dateTime,
        id: const Uuid().v4(),
      );

      final updateChatModel = chatModel.copyWith(
          messages: [...chatModel.messages, responseMessage],
          updateAt: DateTime.now());

      await updateChat(chatModel: updateChatModel);

      return responseMessage;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> deleteChat({required String chatId}) async {
    try {
      await _chatsCollection.doc(chatId).delete();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<ChatModel>> searchChat(
      {required String userId, required String query}) async {
    try {
      final querySnapshot = await _chatsCollection
          .where("userCreatorChat", isEqualTo: userId)
          .orderBy('updateAt', descending: true)
          .orderBy('chatName', descending: false)
          .get();

      var filteredDocs = querySnapshot.docs
          .where((docs) => docs.data()['chatName'].toString().contains(query));

      return filteredDocs
          .map(
            (doc) => ChatModel.fromJson(doc.data()),
          )
          .toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Stream<List<ChatModel>> getHistoryStream({required String userId}) {
    try {
      return _chatsCollection
          .where("userCreatorChat", isEqualTo: userId)
          .orderBy('updateAt', descending: true)
          .orderBy('chatName', descending: false)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map((doc) => ChatModel.fromJson(doc.data()))
            .toList();
      });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
