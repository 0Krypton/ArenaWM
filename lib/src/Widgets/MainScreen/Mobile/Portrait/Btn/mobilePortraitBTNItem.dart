//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

//importing providers
import '../../../../../providers/btn_state_notifier.dart';

class MobilePortraitBtnItem extends StatefulWidget {
  final double width;
  final String iconUrl;
  final int index;
  final Color color;
  final AnimationController controller;

  const MobilePortraitBtnItem({
    required this.width,
    required this.iconUrl,
    required this.index,
    required this.color,
    required this.controller,
  });

  @override
  _MobilePortraitBtnItemState createState() => _MobilePortraitBtnItemState();
}

class _MobilePortraitBtnItemState extends State<MobilePortraitBtnItem> {
  late Animation<Color?> iconColor;

  @override
  void initState() {
    super.initState();
    iconColor = ColorTween(begin: Colors.black, end: Colors.white)
        .animate(widget.controller)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        context.read(btnIndexProvider).setIndex(widget.index);
      },
      child: Container(
        width: widget.width,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Consumer(
          builder: (context, watch, _) {
            int selected = watch(btnIndexProvider.state);
            if (selected == widget.index) {
              widget.controller.forward();
            } else {
              widget.controller.reverse();
            }
            return SvgPicture.asset(
              widget.iconUrl,
              width: 20,
              height: 20,
              color: iconColor.value,
            );
          },
        ),
      ),
    );
  }
}
