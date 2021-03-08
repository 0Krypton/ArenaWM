//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

//importing providers
import '../../../../../providers/btn_state_notifier.dart';

class TabletPortraitBtnItem extends ConsumerWidget {
  final String iconUrl;
  final int index;
  final Color color;

  const TabletPortraitBtnItem({
    required this.iconUrl,
    required this.index,
    required this.color,
  });

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    int selected = watch(btnIndexProvider.state);

    return GestureDetector(
      onTap: () => context.read(btnIndexProvider).setIndex(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: index == selected ? color : Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: index == selected ? color : Colors.transparent,
              blurRadius: 15,
            ),
          ],
        ),
        child: SvgPicture.asset(
          iconUrl,
          width: 30,
          height: 30,
          color: index == selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
