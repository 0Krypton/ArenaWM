//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResultOption extends StatefulWidget {
  const SearchResultOption({
    required this.colorAnimController,
    required this.begin,
    required this.end,
    required this.iconUrl,
    required this.onTap,
  });

  final AnimationController colorAnimController;
  final Color begin;
  final Color end;
  final String iconUrl;
  final Function onTap;

  @override
  _SearchResultOptionState createState() => _SearchResultOptionState();
}

class _SearchResultOptionState extends State<SearchResultOption> {
  late Animation<Color?> color;

  @override
  void initState() {
    super.initState();
    color = ColorTween(
      begin: widget.begin,
      end: widget.end,
    ).animate(widget.colorAnimController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: widget.end.withOpacity(.2),
      highlightColor: Colors.transparent,
      onTap: () {
        widget.onTap();
      },
      child: Container(
        height: 30,
        width: 30,
        child: SvgPicture.asset(
          widget.iconUrl,
          fit: BoxFit.contain,
          color: color.value,
        ),
      ),
    );
  }
}
