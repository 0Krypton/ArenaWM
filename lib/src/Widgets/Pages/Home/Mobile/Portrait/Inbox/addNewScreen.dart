//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing themes
import '../../../../../../Themes/color.dart';

//importing widgets
import '../../../../../responsive_builder.dart';
import './searchField.dart';

//importing utils
import '../../../../../../utils/debouncer.dart';

//importing dart files
import 'dart:ui';

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
//Declaring search Friends Debouncer
  final Debouncer _searchFriendDebouncer = Debouncer(milliseconds: 500);

  //Controller
  late final AnimationController _controller;

  //Width Animation
  late final Animation<double> _widthAnim;
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
      duration: const Duration(milliseconds: 500),
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

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

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

    // Width animation initializing
    _widthAnim = Tween<double>(begin: 0, end: width - (25 * 2)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0,
          0.400,
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
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final double height = sizingInformation.screenSize.height;
        final double width = sizingInformation.screenSize.width;

        return Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  _controller.reverse();
                  Future.delayed(const Duration(milliseconds: 500), () {
                    Navigator.of(context).pop();
                  });
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
                        width: _widthAnim.value,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10),
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 15,
                          right: 15,
                        ),
                        child: Opacity(
                          opacity: _opacityAnim.value,
                          child: child,
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Find Friends TextField
                        SearchField(
                          hint: 'Find friends',
                          heightField: 50,
                          controller: _friendsTxtController,
                          focusNode: _friendsFocusNode,
                          prefixIconUrl: 'assets/scan_friend.svg',
                          callBack: (v) {
                            if (v.isNotEmpty) {
                              _searchFriendDebouncer.run(() {
                                print('debounced for 500 ms');
                              });
                            }
                          },
                        ),
                        SizedBox(height: 5),
                        //Select a name for group
                        SearchField(
                          hint: 'Name',
                          heightField: 50,
                          controller: _groupNameTxtController,
                          focusNode: _groupNameFocusNode,
                          prefixIconUrl: 'assets/chat.svg',
                          callBack: (v) {},
                        ),
                        SizedBox(height: 5),
                        //show selected peoples count
                        Text(
                          '4 people selected',
                          style: TextStyle(
                            fontSize: 8,
                            fontFamily: 'Gilroy',
                            color: txtFieldHintColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        //show selected peoples with random color
                        Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.pink[100],
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(5),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pink[50]!,
                                    blurRadius: 15,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Krypton',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.pink[900],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        print('delete selected user');
                                      },
                                      child: SvgPicture.asset(
                                        'assets/close.svg',
                                        color: Colors.black,
                                        height: 10,
                                        width: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        //show the list of finded firends
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
