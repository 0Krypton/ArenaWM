//importing packages
import 'package:app_v2/src/Themes/text.dart';
import 'package:app_v2/src/Widgets/Pages/Home/Mobile/Portrait/Inbox/newGroup/selectedUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing providers
import '../../../../../../../providers/HomeScr/Inbox/addNew.dart';

class SelectedUsersCount extends StatefulWidget {
  @override
  _SelectedUsersCountState createState() => _SelectedUsersCountState();
}

class _SelectedUsersCountState extends State<SelectedUsersCount>
    with SingleTickerProviderStateMixin {
  //AnimControllers
  late final AnimationController _controller;

  //Animations
  late final Animation<double> _opacityAnim;
  late final Animation<Offset> _offsetAnim;

  @override
  void initState() {
    super.initState();

    //initilizing controllers
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    //initilizing animations
    _opacityAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(curve: Curves.easeIn, parent: _controller),
    );
    _offsetAnim = Tween<Offset>(begin: Offset(0, 10), end: Offset.zero).animate(
      CurvedAnimation(curve: Curves.easeIn, parent: _controller),
    );
  }

  @override
  void dispose() {
    super.dispose();

    //disposing controllers
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final membersLength = watch(newGroup).groupMembers.length;
        if (membersLength < 1) {
          return const SizedBox();
        } else {
          if (!_controller.isAnimating || _controller.isCompleted) {
            _controller.forward();
          }
          return FadeTransition(
            opacity: _opacityAnim,
            child: SlideTransition(
              position: _offsetAnim,
              child: gilroy(
                text: '$membersLength users selected',
                fontSize: 8,
                color: const Color(0xFF8F8F8F),
              ),
            ),
          );
        }
      },
    );
  }
}

Widget selectedUsers() {
  return Consumer(
    builder: (context, watch, child) {
      final members = watch(newGroup).groupMembers;
      if (members.isNotEmpty) {
        List<Widget> adedUser = (members
            .map((member) => SearchedUser(
                  key: ValueKey(member.userName),
                  user: member,
                ))
            .toList());

        return Wrap(
          runAlignment: WrapAlignment.start,
          runSpacing: 10,
          spacing: 10,
          children: adedUser,
        );
      } else
        return const SizedBox();
    },
  );
}
