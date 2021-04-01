//importing pacakages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing providers
import '../../../../../../providers/SearchScr/searchWidgetState.dart';

//importing widgets
import '../../../../../fadeAnimateWidget.dart';

import 'tourSearchResult.dart';
import 'userSearchResult.dart';

List<Widget> searchOptionPages = [
  UserSearchResult(),
  GameSearchResult(),
];

class SearchBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return FadeAnimateWidget(
      duration: const Duration(milliseconds: 500),
      builder: (context, animation) {
        return Consumer(
          builder: (context, watch, child) {
            int index = watch(searchScreenWidgetState).activeSearchOptionIndex;
            return FadeTransition(
              opacity: animation,
              child: searchOptionPages[index],
            );
          },
        );
      },
    );
  }
}
