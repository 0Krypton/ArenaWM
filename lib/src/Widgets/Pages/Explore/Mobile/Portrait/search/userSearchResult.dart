//importing pacakges
import 'package:app_v2/src/Widgets/userWidget.dart';
import 'package:app_v2/src/models/userModel.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing provider
import '../../../../../../providers/SearchScr/searchState.dart';
//importing themes
import '../../../../../../Themes/color.dart';
import '../../../../../../Themes/text.dart';

//importing widgets
import '../../../../../responsive_builder.dart';

class UserSearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        final height = sizeInfo.localWidgetSize.height;
        final width = sizeInfo.localWidgetSize.width;
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.all(
              const Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFDDDDDD).withOpacity(0.5),
                blurRadius: 15,
              ),
            ],
          ),
          margin: EdgeInsets.all(25),
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Consumer(
            builder: (context, watch, child) {
              final res = watch(searchRes);
              return res.when(
                data: (users) {
                  if (users.isEmpty || users.length == 0) {
                    return Center(
                      child: gilroy(
                        text: 'cannot find any users',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    );
                  } else {
                    return Users(users: users);
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

class Users extends StatefulWidget {
  const Users({required this.users});

  final List users;
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> with TickerProviderStateMixin {
  late List<AnimationController> _usersAnimController = [];

  @override
  void initState() {
    super.initState();

    widget.users.asMap().forEach(
          (index, _) => {
            _usersAnimController.add(
              AnimationController(
                vsync: this,
                duration: Duration(milliseconds: index * 150),
              )
                ..addListener(() {})
                ..forward(),
            ),
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.users.length,
      itemBuilder: (context, index) {
        return UserWidget(
          user: widget.users[index],
          callBack: () {
            print(widget.users[index].name);
          },
          animation: _usersAnimController[index],
        );
      },
    );
  }
}
