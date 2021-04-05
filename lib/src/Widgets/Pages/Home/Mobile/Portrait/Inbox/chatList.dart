//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing providers
import '../../../../../../providers/User/userState.dart';

//importing models
import '../../../../../../models/chatModel.dart';
import '../../../../../../models/userModel.dart';

//importing widgets
import './chat.dart';
import '../../../../../animatedScale.dart';

class ChatList extends StatefulWidget {
  ChatList({required this.chats});

  // all of the chats which will be fetched from api
  final List<ChatModel> chats;

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  late final GlobalKey<AnimatedListState> _listKey;

  @override
  void initState() {
    super.initState();

    _listKey = GlobalKey<AnimatedListState>();

    Future.delayed(const Duration(milliseconds: 500), () {
      for (int i = 0; i < widget.chats.length; i++) {
        Future.delayed(Duration(milliseconds: i * 75), () {
          _listKey.currentState!.insertItem(
            i,
            duration: Duration(milliseconds: (400)),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // getting the user which loggedin
    UserModel _loggedInUser = context.read(userLoggedIn.state);
    return AnimatedList(
      key: _listKey,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index, animation) {
        return AnimatedScale(
          beginScale: 0.0,
          middleOneScale: 1.2,
          middleTwoScale: 0.8,
          endScale: 1.0,
          animation: animation,
          child: Chat(
            chat: widget.chats[index],
            loggedInUser: _loggedInUser,
          ),
        );
      },
    );
  }
}
