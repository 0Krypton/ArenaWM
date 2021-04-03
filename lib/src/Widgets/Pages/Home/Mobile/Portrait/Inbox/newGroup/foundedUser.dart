//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

//importing themes
import '../../../../../../../Themes/text.dart';

//importing widgets
import '../../../../../../animatedScale.dart';

//importing models
import '../../../../../../../models/user.dart';

//importing providers
import '../../../../../../../providers/HomeScr/Inbox/addNew.dart';

class FoundedUser extends StatefulWidget {
  FoundedUser({
    required this.foundedUser,
    required this.delay,
  });

  // founded user from api
  final UserModel foundedUser;
  final int delay;

  @override
  _FoundedUserState createState() => _FoundedUserState();
}

class _FoundedUserState extends State<FoundedUser>
    with SingleTickerProviderStateMixin {
  late final _imageScaleAnimController;

  @override
  initState() {
    super.initState();

    //initilizing scale animation
    _imageScaleAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();

    //playing scale animation after some delay
    Future.delayed(Duration(milliseconds: widget.delay), () {
      _imageScaleAnimController.forward();
    });
  }

  @override
  dispose() {
    super.dispose();

    //disposing animation controller
    _imageScaleAnimController.dispose();
  }

  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        context.read(newGroup).addNewGroupMember(widget.foundedUser);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Showing the image of the user
            AnimatedScale(
              animController: _imageScaleAnimController,
              beginScale: 0.0,
              middleOneScale: 1.25,
              middleTwoScale: 0.75,
              endScale: 1.0,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: const [
                    const BoxShadow(
                      color: const Color(0xFFDEDEDE),
                      blurRadius: 15,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                      'http://localhost:3000/images/users/${widget.foundedUser.profileImageUrl}',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),

            //showing the username and full name of the user
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlayAnimation<double>(
                  tween: (0.0).tweenTo(1.0),
                  duration: 400.milliseconds,
                  delay: (50 + widget.delay).milliseconds,
                  builder: (context, child, value) => Opacity(
                    opacity: value,
                    child: gilroy(
                      text: widget.foundedUser.userName,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                PlayAnimation<double>(
                  tween: (0.0).tweenTo(1.0),
                  duration: 400.milliseconds,
                  delay: (50 + widget.delay).milliseconds,
                  builder: (context, child, value) => gilroy(
                    text:
                        '${widget.foundedUser.firstName} ${widget.foundedUser.lastName}',
                    fontSize: 10,
                    color: const Color(0xFF8F8F8F),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
