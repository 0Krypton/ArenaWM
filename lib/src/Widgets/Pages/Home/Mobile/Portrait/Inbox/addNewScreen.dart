//importing packages
import 'package:app_v2/src/models/userModel.dart';
import 'package:app_v2/src/providers/HomeScr/Inbox/addNew.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing apis
import '../../../../../../api/Home/chat.dart';

//importing widgets
import '../../../../../responsive_builder.dart';

import './newGroup/search.dart';
import './newGroup/name.dart';
import './newGroup/foundedUsers.dart';
import './newGroup/selectedUsers.dart';

//importing dart files
import 'dart:ui';

import 'addNewButton.dart';

class AddNewScreen extends StatefulWidget {
  static Route comeToPage() {
    return PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, animatio1, aniamtion2) => AddNewScreen(),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation1, animation2, child) {
        final tween = Tween<double>(begin: 0.0, end: 1.0).chain(
          CurveTween(curve: Curves.ease),
        );

        return FadeTransition(
          opacity: animation1.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  _AddNewScreenState createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen>
    with TickerProviderStateMixin {
  //Controller
  late final AnimationController _controller;
  // Add new group controller
  late final AnimationController _addNewBtnController;
  // FindFriends NameTextField Anim Controller
  late final AnimationController _friendsColorAnimController;
  // GroupNameTextField Anim Controller
  late final AnimationController _groupNameColorAnimController;

  //Height Animation
  late final Animation<double> _heightAnim;
  //Opacity Animation
  late final Animation<double> _opacityAnim;

  late final TextEditingController _friendsTxtController;
  late final FocusNode _friendsFocusNode;
  late final TextEditingController _groupNameTxtController;
  late final FocusNode _groupNameFocusNode;

  @override
  void initState() {
    super.initState();
    //initilizing animation controllers
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    //initilizing addNewGroup Controllers
    _addNewBtnController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    //initilizing findFriendsAnimController
    _friendsColorAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    //initilizing groupNameAnimController
    _groupNameColorAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    //initilizing txtControllers
    _friendsTxtController = TextEditingController(text: '');
    _groupNameTxtController = TextEditingController(text: '');

    //initilizing focusNodes
    _friendsFocusNode = FocusNode();
    _groupNameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    //disposing Anim controllers
    _controller.dispose();
    _addNewBtnController.dispose();
    _groupNameColorAnimController.dispose();
    _friendsColorAnimController.dispose();

    //disposing txtControllers
    _friendsTxtController.dispose();
    _groupNameTxtController.dispose();

    //disposing focusNodes
    _friendsFocusNode.dispose();
    _groupNameFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    double height = MediaQuery.of(context).size.height;

    // Height animation initializing
    _heightAnim = Tween<double>(begin: 0, end: height * .7).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.250,
          0.650,
          curve: Curves.easeInOut,
        ),
      ),
    );

    // Opacity animation initializing
    _opacityAnim = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.650,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      _controller.forward();
    });

    Future.delayed(const Duration(milliseconds: 1000), () {
      _addNewBtnController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final double height = sizingInformation.screenSize.height;
        final double width = sizingInformation.screenSize.width;

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  _controller.reverse();

                  Future.delayed(
                    const Duration(milliseconds: 500),
                    () {
                      Navigator.of(context).pop();
                    },
                  );
                },
                child: Container(
                  height: height,
                  width: width,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: const Color(0xFFDCDCDC).withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 25,
                left: 25,
                right: 25,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Container(
                        height: _heightAnim.value,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10),
                          ),
                        ),
                        padding: const EdgeInsets.only(top: 15),
                        child: Opacity(
                          opacity: _opacityAnim.value,
                          child: child,
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Find Friends TextField
                              findFriends(
                                context: context,
                                friendsColorController:
                                    _friendsColorAnimController,
                                friendsTextEditingController:
                                    _friendsTxtController,
                                friendsFocusNode: _friendsFocusNode,
                              ),
                              const SizedBox(height: 5),
                              //Select a name for group
                              selectName(
                                context: context,
                                groupNameColorController:
                                    _groupNameColorAnimController,
                                groupNameTxtController: _groupNameTxtController,
                                groupNameFocusNode: _groupNameFocusNode,
                              ),
                              const SizedBox(height: 5),
                              //show selected peoples count
                              SelectedUsersCount(),
                              const SizedBox(height: 10),
                              //showing selected peoples
                              selectedUsers(),
                              const SizedBox(height: 15),
                              //show the list of finded firends
                              Expanded(
                                child: FoundedUsers(),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          right: 15,
                          child: addButton(
                            context: context,
                            animationController: _addNewBtnController,
                            iconUrl: 'assets/submit.svg',
                            callBack: () async {
                              //check if group list is empty then show the error
                              final List<UserModel> members =
                                  context.read(newGroup).groupMembers;

                              if (members.isEmpty) {
                                _friendsColorAnimController.reset();
                                _friendsColorAnimController.forward();
                                Future.delayed(
                                    const Duration(milliseconds: 250), () {
                                  _friendsColorAnimController.reverse();
                                });

                                //focus on findFriends txtField
                                _friendsFocusNode.requestFocus();
                                //TODO show toast that says please choose group members
                                return;
                              }

                              // checking group name if it is empty then show error
                              if (_groupNameTxtController.text.isEmpty) {
                                _groupNameColorAnimController.reset();
                                _groupNameColorAnimController.forward();

                                Future.delayed(
                                    const Duration(milliseconds: 250), () {
                                  _groupNameColorAnimController.reverse();
                                });

                                //focus on groupName txtField
                                _groupNameFocusNode.requestFocus();
                                //TODO show toast that says please enter a name to group
                                return;
                              }

                              // getting group's name
                              final String groupName =
                                  context.read(newGroup).groupName;

                              // getting group's members
                              final List<String> groupMembers = context
                                  .read(newGroup)
                                  .groupMembers
                                  .map((member) => member.id)
                                  .toList();

                              final data = await Chat.newOne(
                                {"name": groupName, "users": groupMembers},
                              );
                              print(data);

                              //clearing the founded users
                              context.read(friendTermState).setNewTerm('');

                              //clearing the groupName
                              context.read(newGroup).setGroupName('');

                              //clearing the selected users
                              context.read(newGroup).clearAll();

                              //reversing addNewBtnAnimation
                              _addNewBtnController.reverse();

                              //reversing the screen anim
                              Future.delayed(const Duration(milliseconds: 350),
                                  () {
                                _controller.reverse();

                                //poping the page after the animation completed
                                Future.delayed(
                                    const Duration(milliseconds: 400), () {
                                  Navigator.of(context).pop();
                                });
                              });
                            },
                          ),
                        ),
                      ],
                    ),
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
