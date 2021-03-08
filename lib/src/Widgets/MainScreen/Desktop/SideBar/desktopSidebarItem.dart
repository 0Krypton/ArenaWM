//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

//importing providers
import '../../../../providers/btn_state_notifier.dart';

class DesktopSidebarItem extends ConsumerWidget {
  final String iconUrl;
  final String title;
  final int index;
  final Color color;

  const DesktopSidebarItem({
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
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconUrl,
              width: 25,
              height: 25,
              color: index == selected ? color : Colors.black,
            ),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Reglo',
                fontSize: 18,
                color: index == selected ? color : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
