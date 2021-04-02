//importing widgets
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing themes
import '../../../../../../../Themes/text.dart';

//importing providers
import '../../../../../../../providers/HomeScr/Inbox/addNew.dart';

//importing widgets
import '../../../../../../responsive_builder.dart';
import 'foundedUser.dart';

class FoundedUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        final double height = sizeInfo.localWidgetSize.height;
        return Container(
          height: height,
          child: Consumer(
            builder: (context, watch, child) {
              final _foundedUsers = watch(foundedUsers);
              return _foundedUsers.when(
                data: (users) {
                  if (users.length == 0) {
                    return Center(
                      child: Text('No user :)'),
                    );
                  } else {
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: users.length,
                      itemBuilder: (ctx, index) {
                        return FoundedUser(foundedUser: users[index]);
                      },
                    );
                  }
                },
                loading: () {
                  return Center(
                    child: Container(
                      height: 80,
                      width: 80,
                      child: FlareActor(
                        'assets/rive/loading-Complicit-Simple.flr',
                        animation: 'Complicit',
                      ),
                    ),
                  );
                },
                error: (err, _) {
                  return Center(
                    child: gilroy(
                      text: '$err\n   :(',
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
