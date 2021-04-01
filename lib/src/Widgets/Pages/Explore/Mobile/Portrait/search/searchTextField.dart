//importing packages
import 'package:app_v2/src/providers/SearchScr/searchState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//import providers
import '../../../../../../providers/SearchScr/searchWidgetState.dart';

//importing dart files
import 'dart:math' as math;

class SearchTextField extends StatefulWidget {
  const SearchTextField();
  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      maxLines: 1,
      textAlign: TextAlign.center,
      cursorColor: Colors.black,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: 'Reglo',
      ),
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          // getting searchScreenWidgetState provider
          final sWidgetState = context.read(searchScreenWidgetState);
          sWidgetState.scaleAnimController.reverse();
          sWidgetState.setIsCollapsed(false);

          // getting searchState provider
          final sState = context.read(searchState);
          sState.setIsSearching();
          sState.setTerm(value);
          sState.setSearchFor(sWidgetState.activeSearchOption);
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF7F6F9),
        hintText: 'Enter to Search',
        hintStyle: TextStyle(
          color: const Color(0xFF8F8F8F),
          fontSize: 12,
          fontFamily: 'Reglo',
        ),
        suffixIcon: IconButton(
          autofocus: false,
          icon: Transform.rotate(
            angle: math.pi / 2,
            child: SvgPicture.asset(
              'assets/explore.svg',
              color: const Color(0xFF8F8F8F),
            ),
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: _controller.text.isEmpty
              ? null
              : () {
                  // getting searchScreenWidgetState provider
                  final sWidgetState = context.read(searchScreenWidgetState);
                  sWidgetState.scaleAnimController.reverse();
                  sWidgetState.setIsCollapsed(false);

                  // getting searchState provider
                  final sState = context.read(searchState);
                  sState.setIsSearching();
                  sState.setTerm(_controller.text);
                  sState.setSearchFor(sWidgetState.activeSearchOption);
                },
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

Widget buildBackButton({required BuildContext context}) {
  return Positioned(
    top: 15,
    left: 15,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 45,
            width: 45,
            padding: EdgeInsets.all(10),
            child: RotatedBox(
              quarterTurns: 1,
              child: SvgPicture.asset(
                'assets/form/dropdownicon.svg',
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
