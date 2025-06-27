import 'package:ai_fit_coach/blocs/history_bloc/history_bloc.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryDrawer extends StatefulWidget {
  const HistoryDrawer({super.key, required this.currentChatId});
  final String currentChatId;
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
                      margin: EdgeInsets.only(bottom: 0),
                      child: Column(spacing: 20, children: [
                        Text('Chat history'),
                        CustomTextfield(
                          controller: _searchHistoryController,
                          hintText: 'Search chat',
                          obscureText: false,
                          keyboardType: TextInputType.none,
                        ),
                      ]),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          final chat = state.historyList[index];
                          return ListTile(
                            title: Text(
                              chat.chatName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              currentChatId != chat.id
                                  ? AutoRouter.of(context).pushAndPopUntil(
                                      AiChatRoute(chatId: chat.id),
                                      predicate: (route) => false)
                                  : Navigator.of(context).pop();
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                        itemCount: state.historyList.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
