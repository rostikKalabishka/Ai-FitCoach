import 'package:ai_fit_coach/blocs/history_bloc/history_bloc.dart';
import 'package:ai_fit_coach/common/api/model/message_model.dart';
import 'package:ai_fit_coach/features/ai_chat/bloc/chat_bloc.dart';
import 'package:ai_fit_coach/features/ai_chat/widgets/widgets.dart';
import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/router/router.dart';
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
  late String userId;

  @override
  void initState() {
    _init();
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

    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is AiChatLoaded && state.chatModel.messages.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          });
        } else if (state is AiChatFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).errorN(state.error))),
          );
        }
      },
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              focusNode.unfocus();
            },
            child: Scaffold(
              drawer: HistoryDrawer(
                currentChatId: state is AiChatLoaded ? state.chatModel.id : '',
                userId: userId,
              ),
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed:
                          state is AiChatLoaded && state.chatModel.id.isNotEmpty
                              ? () {
                                  AutoRouter.of(context).pushAndPopUntil(
                                    AiChatRoute(),
                                    predicate: (_) => false,
                                  );
                                }
                              : null,
                      icon: const Icon(Icons.edit),
                      tooltip: S.of(context).createNewChat),
                ],
                title: Text(
                  S.of(context).aiAssistant,
                  style: theme.textTheme.labelMedium,
                ),
              ),
              body: RefreshIndicator.adaptive(
                onRefresh: () async {
                  if (userId.isNotEmpty) {
                    context.read<ChatBloc>().add(
                          LoadChatEvent(
                            chatId: state is AiChatLoaded
                                ? state.chatModel.id
                                : widget.chatId ?? '',
                            userCreatorChatId: userId,
                          ),
                        );
                  }
                },
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return state is AiChatLoaded
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
                                          message:
                                              messagesInChat[index].message,
                                        );
                                      },
                                      itemCount:
                                          state.chatModel.messages.length,
                                    ),
                                  ),
                                  if (state.isTyping) ...[
                                    SpinKitThreeBounce(
                                      color: theme.colorScheme.primary,
                                      size: 18,
                                    ),
                                  ],
                                  const SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: theme.cardColor,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                      border: Border(
                                        top: BorderSide(
                                          color: theme.dividerColor,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              style: theme
                                                  .textTheme.headlineLarge
                                                  ?.copyWith(
                                                fontWeight: FontWeight.normal,
                                              ),
                                              focusNode: focusNode,
                                              controller: _textFieldController,
                                              onSubmitted: (value) {
                                                _sendMessage(context);
                                              },
                                              decoration: InputDecoration(
                                                hintText: S
                                                    .of(context)
                                                    .howCanIHelpYou,
                                                border: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              _sendMessage(context);
                                            },
                                            icon: const Icon(Icons.send),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : state is AiChatFailure
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(S.of(context).errorN(state.error)),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (userId.isNotEmpty) {
                                          context.read<ChatBloc>().add(
                                                LoadChatEvent(
                                                  chatId: widget.chatId ?? '',
                                                  userCreatorChatId: userId,
                                                ),
                                              );
                                        }
                                      },
                                      child: Text(S.of(context).retry),
                                    ),
                                  ],
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _sendMessage(BuildContext context) {
    final newMessage = _textFieldController.text.trim();

    if (newMessage.isNotEmpty) {
      _textFieldController.clear();
      context.read<ChatBloc>().add(
            SendMessageEvent(message: newMessage),
          );
    }
  }

  void _init() {
    _textFieldController = TextEditingController();
    _scrollController = ScrollController();
    focusNode = FocusNode();
    userId = context.read<AuthenticationBloc>().state.user?.id ?? '';

    if (userId.isNotEmpty) {
      context.read<ChatBloc>().add(
            LoadChatEvent(
                chatId: widget.chatId ?? '', userCreatorChatId: userId),
          );
      context.read<HistoryBloc>().add(LoadHistoryEvent(userId: userId));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).userNotAuthenticated)),
      );
    }
  }
}
