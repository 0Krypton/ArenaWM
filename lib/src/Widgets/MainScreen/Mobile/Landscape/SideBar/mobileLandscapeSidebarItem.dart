//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

//importing providers
import '../../../../../providers/btn_state_notifier.dart';

class MobileLandscapeBtnItem extends ConsumerWidget {
  final String iconUrl;
  final String title;
  final int index;
  final Color color;

  const MobileLandscapeBtnItem({
    required this.iconUrl,
    required this.title,
    required this.index,
    required this.color,
  });

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    int selected = watch(btnIndexProvider.state);

    return GestureDetector(
      onTap: () => context.read(btnIndexProvider).setIndex(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconUrl,
              width: 15,
              height: 15,
              color: index == selected ? color : Colors.black,
            ),
            SizedBox(width: 5),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Reglo',
                fontSize: 12,
                color: index == selected ? color : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
