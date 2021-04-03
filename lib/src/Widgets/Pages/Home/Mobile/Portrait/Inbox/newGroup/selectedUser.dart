//importing packages
import 'package:app_v2/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing providers
import '../../../../../../../providers/HomeScr/Inbox/addNew.dart';

//importing dart files
import 'dart:math';

enum Anim { fade, offset }

class SearchedUser extends StatefulWidget {
  final UserModel user;

  SearchedUser({required this.user});

  @override
  _SearchedUserState createState() => _SearchedUserState();
}

class _SearchedUserState extends State<SearchedUser>
    with SingleTickerProviderStateMixin {
  // generated random color for user widget
  late final Color _userColor;

  //Animcontrollers
  late final AnimationController _animationController;

  //Animations
  late final Animation<double> _opacityAnimation;
  late final Animation<Offset> _offsetAnimation;

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

    //initilizing controllers
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    //initilizing animations
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(curve: Curves.ease, parent: _animationController),
    );

    _offsetAnimation =
        Tween<Offset>(begin: Offset(0, 50), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.ease),
    );
  }

  @override
  void dispose() {
    super.dispose();

    //disposing animControllers
    _animationController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //playingAnimations
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => FadeTransition(
        opacity: _opacityAnimation,
        child: Transform.translate(
          offset: _offsetAnimation.value,
          child: child,
        ),
      ),
      child: Stack(
        key: ValueKey('${widget.user.userName} user'),
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
                '${widget.user.firstName}',
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
                _animationController.reverse();

                Future.delayed(const Duration(milliseconds: 350), () {
                  context.read(newGroup).removeGroupMember(widget.user);
                });
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
      ),
    );
  }
}
