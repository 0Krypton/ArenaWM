//importing providers
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing models
import '../../../../../../models/chatModel.dart';

//importing widgets
import '../../../../../../Widgets/responsive_builder.dart';
import './chatList.dart';

//importing providers
import '../../../../../../providers/HomeScr/Inbox/chat.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, sizingInformation) {
        final double height = sizingInformation.localWidgetSize.height;
        final double width = sizingInformation.localWidgetSize.width;

        return Container(
          height: height,
          width: width,
          child: Consumer(
            builder: (context, watch, child) {
              final chats = watch(allChats);

              return chats.when(
                data: (List<ChatModel> chats) {
                  return ChatList(chats: chats);
                },
                loading: () {
                  return Center(
                    child: Text('waiting'),
                  );
                },
                error: (err, _) {
                  return Center(child: Text('error occued $err\n$_'));
                },
              );
            },
          ),
        );
      },
    );
  }
}
