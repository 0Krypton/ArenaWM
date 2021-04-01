//importing packages
import 'package:flutter/material.dart';

//importing models
import '../models/user.dart';

//importing Utils
import '../utils/getTimeDiffinString.dart';

class UserWidget extends StatelessWidget with TimeDiffInString {
  UserWidget({
    required this.user,
    required this.animation,
    required this.callBack,
  });

  final UserModel user;

  final Animation<double> animation;

  final VoidCallback callBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Transform.translate(
        offset: Tween<Offset>(begin: Offset(0.0, 75.0), end: Offset.zero)
            .animate(animation)
            .value,
        child: Opacity(
          opacity: animation.value,
          child: Container(
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xFFF7F6F9),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 15,
                ),
              ],
            ),
            child: Stack(
              children: [
                _buildBgImage(),
                Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildProfileImage(),
                      _buildBody(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBgImage() {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Image.network(
            'http://localhost:3000/images/users/${user.bgImageUrl}',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(left: 25, right: 15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 15,
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(
            'http://localhost:3000/images/users/${user.profileImageUrl}',
          ),
          fit: BoxFit.cover,
        ),
      ),
      // child:
      // user['unreadMessages'] == null ? SizedBox() : _buildUnreadMessages(),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 15, bottom: 15, right: 30),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 15,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildText(
                  text: user.userName,
                  fontSize: 12.0,
                  color: const Color(0xFF000000),
                ),
                _buildText(
                  text: '${user.firstName} ${user.lastName}',
                  fontSize: 10.0,
                  color: const Color(0xFF9E9E9E),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text _buildText({
    required String text,
    required double fontSize,
    required Color color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Reglo',
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }
}
