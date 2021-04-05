//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing providers
import '../../../../../../../providers/User/userState.dart';

//importing models
import '../../../../../../../models/chatModel.dart';
import '../../../../../../../models/userModel.dart';

//importing widgets
import '../../../../../../responsive_builder.dart';

//importing dart files
import 'dart:ui';
import 'dart:math' as math;

class MessageBg extends StatelessWidget {
  MessageBg({required this.chat});

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    // getting the bgImage
    String bgImageUrl;

    // getting the profileImage
    String profileImageUrl;

    // getting the name
    String chatName = chat.name;

    // check to see are we loading the groupChat or singleChat
    bool isGroupChat = chat.isGroupChat;

    //getting the user which loggedin
    UserModel loggedInUser = context.read(userLoggedIn.state);

    //getting the user which we chat with that
    UserModel user;

    if (!isGroupChat) {
      user = chat.users.singleWhere(
        (user) => user.id != loggedInUser.id,
      );
      bgImageUrl = user.bgImageUrl;
      profileImageUrl = user.profileImageUrl;
    } else {
      user = chat.users
          .where((user) => user.id != loggedInUser.id)
          .toList()[math.Random().nextInt(
        chat.users.length - 1,
      )];
      bgImageUrl = user.bgImageUrl;
      profileImageUrl = user.profileImageUrl;
    }

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final double height = sizingInformation.localWidgetSize.height;
        final double width = sizingInformation.localWidgetSize.width;

        return Container(
          width: width,
          height: height,
          child: Stack(
            children: [
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'http://localhost:3000/images/users/$bgImageUrl',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    color: Colors.white.withOpacity(0.15),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    chatName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Qanelas',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              if (!isGroupChat)
                Positioned(
                  bottom: ((height * 4) * .05) + 10,
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(12),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                'http://localhost:3000/images/users/$profileImageUrl',
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.firstName,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Qanelas',
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              user.lastName,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Qanelas',
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            print(user.id);
                            print(user.userName);
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            child: SvgPicture.asset(
                              'assets/user.svg',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              /// showing the backBtn to leave the page
              Positioned(
                top: 15,
                left: 15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(
                    'assets/back.svg',
                    height: 25,
                    width: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
