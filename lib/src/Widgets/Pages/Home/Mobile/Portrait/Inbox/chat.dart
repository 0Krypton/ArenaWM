//importing packages
import 'package:flutter/material.dart';

//importing widgets
import './message/messageScr.dart';

//importing themes
import '../../../../../../Themes/text.dart';

//importing models
import '../../../../../../models/chatModel.dart';
import '../../../../../../models/userModel.dart';

//importing dart files
import 'dart:math' as math;

class Chat extends StatelessWidget {
  Chat({
    required this.chat,
    required this.loggedInUser,
  });

  final ChatModel chat;
  final UserModel loggedInUser;

  @override
  Widget build(BuildContext context) {
    //getting the user which we chat with that
    UserModel user;

    bool isGroupChat = chat.isGroupChat;

    if (!isGroupChat) {
      user = chat.users.singleWhere(
        (user) => user.id != loggedInUser.id,
      );
    } else {
      user = chat.users
          .where((user) => user.id != loggedInUser.id)
          .toList()[math.Random().nextInt(
        chat.users.length - 1,
      )];
    }
    // user = chat.users[0];

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(
          MessageScr.comeToPage(chat: chat),
        );
      },
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF7F7F7F).withOpacity(.7),
              blurRadius: 10,
              offset: const Offset(0.0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10),
          ),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Image.network(
                  'http://localhost:3000/images/users/${user.bgImageUrl}',
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    margin: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10),
                      ),
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          'http://localhost:3000/images/users/${user.profileImageUrl}',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(3),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// show the chat name
                          Text(
                            chat.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Gilroy',
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                          /// if chat has latest Message then show that
                          if (chat.latestMessage != null)
                            Row(
                              children: [
                                gilroy(
                                  text: chat.latestMessage!.content,
                                  fontSize: 8,
                                  color: const Color(0xFF989898),
                                ),
                              ],
                            ),

                          /// if theres no latestMessage and also chat is a group chat
                          /// then show a all the users in the groupChat
                          if (chat.latestMessage == null && chat.isGroupChat)
                            Row(
                              children: [
                                ...(chat.users
                                    .take(math.min(2, chat.users.length))
                                    .map(
                                      (user) => gilroy(
                                        text: '${user.userName}, ',
                                        fontSize: 8,
                                        color: const Color(0xFF989898),
                                      ),
                                    )
                                    .toList()),

                                /// if the remaining users lenght is equal to 0 then show nothing :)
                                if (chat.users.length -
                                        math.min(2, chat.users.length) !=
                                    0)
                                  gilroy(
                                    text:
                                        '& ${chat.users.length - math.min(2, chat.users.length)} other',
                                    fontSize: 8,
                                    color: const Color(0xFF989898),
                                  ),
                              ],
                            ),

                          /// if there's no latestMessage and also chat isn't a groupChat then
                          /// show a user's first & lastName
                          if (chat.latestMessage == null && !chat.isGroupChat)
                            gilroy(
                              text: '${user.firstName} ${user.lastName}',
                              fontSize: 8,
                              color: const Color(0xFF989898),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
