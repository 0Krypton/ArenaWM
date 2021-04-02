//importing packages
import 'package:app_v2/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing providers
import '../../../../../../../providers/HomeScr/Inbox/addNew.dart';

//importing dart files
import 'dart:math';

class SearchedUser extends StatefulWidget {
  final UserModel user;

  SearchedUser({required this.user});

  @override
  _SearchedUserState createState() => _SearchedUserState();
}

class _SearchedUserState extends State<SearchedUser> {
  late final Color _userColor;

  @override
  void initState() {
    super.initState();

    final Random _random = Random();
    // generating random color
    _userColor = Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          key: ValueKey('${widget.user.userName} user'),
          constraints: const BoxConstraints(
            minWidth: 50,
            maxWidth: 70,
            minHeight: 25,
            maxHeight: 25,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: _userColor.withOpacity(.10),
            borderRadius: const BorderRadius.all(const Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: _userColor.withOpacity(.3),
                blurRadius: 15,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              '${widget.user.userName}',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: _userColor,
              ),
            ),
          ),
        ),
        Positioned(
          key: ValueKey('${widget.user.userName} close'),
          top: 5,
          right: 5,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              context.read(newGroup).removeGroupMember(widget.user);
            },
            child: SvgPicture.asset(
              'assets/close.svg',
              color: _userColor,
              height: 7,
              width: 7,
            ),
          ),
        ),
      ],
    );
  }
}
