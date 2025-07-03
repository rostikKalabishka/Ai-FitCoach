// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_fit_coach/blocs/history_bloc/history_bloc.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/ui.dart';

class HistoryDrawer extends StatefulWidget {
  const HistoryDrawer({
    super.key,
    required this.currentChatId,
    required this.userId,
  });

  final String currentChatId;
  final String userId;

  @override
  State<HistoryDrawer> createState() => _HistoryDrawerState();
}

class _HistoryDrawerState extends State<HistoryDrawer> {
  late final TextEditingController _searchHistoryController;

  @override
  void initState() {
    _searchHistoryController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchHistoryController.dispose();
    super.dispose();
  }

  void _showRenameDialog(
      BuildContext context, String chatId, String currentName) {
    final controller = TextEditingController(text: currentName);

    showDialog(
      context: context,
      builder: (context) {
        return ConfirmationDialog(
          title: S.of(context).editTheChatName,
          confirmText: S.of(context).save,
          cancelText: S.of(context).cancel,
          content: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Material(
              color: Colors.transparent,
              child: TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: S.of(context).newName,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          onConfirm: () {
            final newName = controller.text.trim();
            if (newName.isNotEmpty && newName != currentName) {
              context.read<HistoryBloc>().add(
                    RenameChatEvent(chatId: chatId, newName: newName),
                  );
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentChatId = widget.currentChatId;

    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoaded) {
          return Drawer(
            child: Scaffold(
              backgroundColor: theme.primaryColor,
              body: SafeArea(
                child: Column(
                  children: [
                    DrawerHeader(
                      margin: EdgeInsets.zero,
                      child: Column(
                        // spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            S.of(context).chatHistory,
                            style: theme.textTheme.labelMedium,
                          ),
                          const SizedBox(height: 12),
                          CustomTextfield(
                            controller: _searchHistoryController,
                            hintText: S.of(context).searchChat,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              context.read<HistoryBloc>().add(
                                    SearchChatEvent(
                                      query: value!.trim(),
                                      userId: widget.userId,
                                    ),
                                  );
                              return;
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.historyList.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final chat = state.historyList[index];
                          return ListTile(
                            title: Text(
                              chat.chatName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onTap: () {
                              if (currentChatId != chat.id) {
                                AutoRouter.of(context).pushAndPopUntil(
                                  AiChatRoute(chatId: chat.id),
                                  predicate: (_) => false,
                                );
                              } else {
                                Navigator.of(context).pop();
                              }
                            },
                            trailing: PopupMenuButton<String>(
                              icon: const Icon(
                                Icons.more_horiz,
                              ),
                              onSelected: (value) {
                                switch (value) {
                                  case 'edit':
                                    _showRenameDialog(
                                        context, chat.id, chat.chatName);
                                    break;
                                  case 'delete':
                                    context.read<HistoryBloc>().add(
                                          DeleteChatEvent(chatId: chat.id),
                                        );
                                    if (currentChatId == chat.id) {
                                      AutoRouter.of(context).pushAndPopUntil(
                                          AiChatRoute(),
                                          predicate: (_) => false);
                                    }
                                    break;
                                }
                              },
                              itemBuilder: (_) => [
                                PopupMenuItem<String>(
                                  value: 'edit',
                                  child: Row(
                                    spacing: 5,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        size: 18,
                                      ),
                                      Text(
                                        S.of(context).editTheName,
                                        style: theme.textTheme.headlineLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'delete',
                                  child: Row(
                                      spacing: 5,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          size: 18,
                                        ),
                                        Text(
                                          S.of(context).deleteChat,
                                          style: theme.textTheme.headlineLarge,
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
