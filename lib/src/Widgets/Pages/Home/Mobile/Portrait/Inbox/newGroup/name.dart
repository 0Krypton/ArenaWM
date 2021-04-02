//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing providers
import '../../../../../../../providers/HomeScr/Inbox/addNew.dart';
import '../searchField.dart';

Widget selectName({
  required BuildContext context,
  required TextEditingController groupNameTxtController,
  required FocusNode groupNameFocusNode,
}) {
  return SearchField(
    hint: 'Name',
    heightField: 50,
    controller: groupNameTxtController,
    focusNode: groupNameFocusNode,
    prefixIconUrl: 'assets/chat.svg',
    callBack: (v) {
      context.read(newGroup).setGroupName(v);
    },
  );
}
