//importing packages
import 'package:app_v2/src/Themes/text.dart';
import 'package:app_v2/src/Widgets/Pages/Home/Mobile/Portrait/Inbox/newGroup/selectedUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing providers
import '../../../../../../../providers/HomeScr/Inbox/addNew.dart';

Widget selectedUsersCount() {
  return Consumer(
    builder: (context, watch, child) {
      final membersLength = watch(newGroup).groupMembers.length;
      if (membersLength < 1) {
        return const SizedBox();
      } else {
        return gilroy(
          text: '$membersLength users selected',
          fontSize: 8,
          color: const Color(0xFF8F8F8F),
        );
      }
    },
  );
}

Widget selectedUsers() {
  return Consumer(
    builder: (context, watch, child) {
      final members = watch(newGroup).groupMembers;
      if (members.isNotEmpty) {
        List<Widget> adedUser =
            (members.map((member) => SearchedUser(user: member)).toList());

        return Wrap(
          runAlignment: WrapAlignment.start,
          runSpacing: 5,
          spacing: 10,
          children: adedUser,
        );
      } else
        return const SizedBox();
    },
  );
}
