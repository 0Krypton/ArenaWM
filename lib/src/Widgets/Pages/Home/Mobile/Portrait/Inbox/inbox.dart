//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../../../../responsive_builder.dart';
import './widgets.dart';

//importing themes
import '../../../../../../Themes/color.dart';

class Inbox extends StatefulWidget {
  static Route comeToPage() {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) => Inbox(),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation1, animation2, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween<Offset>(begin: begin, end: end).chain(
          CurveTween(curve: Curves.ease),
        );

        return SlideTransition(
          position: animation1.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> with TickerProviderStateMixin {
  // SearchTextField
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;

  // Add new group
  late final AnimationController _addNewController;

  @override
  void initState() {
    super.initState();

    // SearchTextField init
    _searchController = TextEditingController(text: '');
    _searchFocusNode = FocusNode();

    // Add new group init
    _addNewController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Search TextField dispose
    _searchController.dispose();

    // Add new group dispose
    _addNewController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.delayed(const Duration(milliseconds: 350), () {
      _addNewController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        final height = sizeInfo.screenSize.height;
        final width = sizeInfo.screenSize.width;
        return Scaffold(
          body: Container(
            width: width,
            height: height,
            color: bgColor,
            child: Stack(
              children: [
                Column(
                  children: [
                    appBar(context: context, width: width),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: SearchField(
                        hint: 'Search',
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        heightField: 50,
                        suffixIconUrl: 'assets/explore.svg',
                        callBack: (v) {},
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 30,
                  right: 30,
                  child: addButton(
                    context: context,
                    animationController: _addNewController,
                    iconUrl: 'assets/add.svg',
                    callBack: () {
                      Navigator.of(context).push(AddNewScreen.comeToPage());
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
