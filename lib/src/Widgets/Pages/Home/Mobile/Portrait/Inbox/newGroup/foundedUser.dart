//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing themes
import '../../../../../../../Themes/text.dart';

//importing models
import '../../../../../../../models/user.dart';

//importing providers
import '../../../../../../../providers/HomeScr/Inbox/addNew.dart';

class FoundedUser extends StatelessWidget {
  FoundedUser({required this.foundedUser});

  // founded user from api
  final UserModel foundedUser;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        context.read(newGroup).addNewGroupMember(foundedUser);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Showing the image of the user
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: const [
                  const BoxShadow(
                    color: const Color(0xFFDEDEDE),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(
                    'http://localhost:3000/images/users/${foundedUser.profileImageUrl}',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 20),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gilroy(
                  text: foundedUser.userName,
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  color: Colors.black,
                ),
                const SizedBox(height: 5),
                gilroy(
                  text: '${foundedUser.firstName} ${foundedUser.lastName}',
                  fontSize: 10,
                  color: const Color(0xFF8F8F8F),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
