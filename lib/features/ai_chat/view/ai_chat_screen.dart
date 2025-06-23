import 'dart:ui';

import 'package:ai_fit_coach/common/api/model/message_model.dart';
import 'package:ai_fit_coach/features/ai_chat/bloc/chat_bloc.dart';
import 'package:ai_fit_coach/features/ai_chat/widgets/chat_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

@RoutePage()
class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key, this.chatId});
  final String? chatId;

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  late TextEditingController _textFieldController;
  late ScrollController _scrollController;
  late FocusNode focusNode;

  @override
  void initState() {
    _textFieldController = TextEditingController();
    _scrollController = ScrollController();
    focusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    _scrollController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<ChatBloc, ChatState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return GestureDetector(
          onTap: () {
            focusNode.unfocus();
          },
          child: Scaffold(
            appBar: AppBar(),
            body: RefreshIndicator.adaptive(
              onRefresh: () async {},
              child: state is AiChatLoaded
                  ? Center(
                      child: SafeArea(
                        child: Column(
                          children: [
                            Flexible(
                              child: ListView.builder(
                                controller: _scrollController,
                                itemBuilder: (context, index) {
                                  final List<Message> messagesInChat =
                                      state.chatModel.messages;
                                  return ChatWidget(
                                    isUser: messagesInChat[index].isUser,
                                    message: messagesInChat[index].message,
                                  );
                                },
                                itemCount: state.chatModel.messages.length,
                              ),
                            ),
                            if (state.isTyping) ...[
                              const SpinKitThreeBounce(
                                color: Color.fromARGB(255, 106, 153, 107),
                                size: 18,
                              ),
                            ],
                            const SizedBox(
                              height: 20,
                            ),
                            Material(
                              color: theme.cardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        focusNode: focusNode,
                                        controller: _textFieldController,
                                        onSubmitted: (value) {
                                          _sendMessage(context);
                                        },
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'how can u help you?',
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          state.isListening == false
                                              ? Icons.mic
                                              : Icons.mic_off,
                                          color: state.isListening
                                              ? Colors.red
                                              : null,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          _sendMessage(context);
                                        },
                                        icon: const Icon(
                                          Icons.send,
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
            ),
          ),
        );
      },
    );
  }

  void _sendMessage(BuildContext context) {
    final newMessage = _textFieldController.text.trim();

    if (newMessage.isNotEmpty) {
      _textFieldController.clear();

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}
