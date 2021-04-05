//importing packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

//importing providers
import '../../../../../../../providers/HomeScr/Inbox/addNew.dart';

//importing widgets
import '../searchField.dart';

//importing utils
import '../../../../../../../utils/debouncer.dart';

//Declaring search Friends Debouncer
final Debouncer _searchFriendDebouncer = Debouncer(milliseconds: 500);

Widget findFriends({
  required BuildContext context,
  required TextEditingController friendsTextEditingController,
  required FocusNode friendsFocusNode,
  required AnimationController friendsColorController,
}) {
  return TxtField(
    hint: 'Find friends',
    heightField: 50,
    controller: friendsTextEditingController,
    focusNode: friendsFocusNode,
    colorAnimController: friendsColorController,
    prefixIconUrl: 'assets/scan_friend.svg',
    callBack: (v) {
      if (v.isNotEmpty) {
        _searchFriendDebouncer.run(() {
          context.read(friendTermState).setNewTerm(v.trim());
        });
      } else {
        _searchFriendDebouncer.cancel();
        context.read(friendTermState).setNewTerm('');
      }
    },
  );
}
