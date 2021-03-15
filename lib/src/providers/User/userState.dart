//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing apis
import '../../api/auth/authenticate.dart';

//importing models
import '../../models/user.dart';

//TODO
// At the end we get this token when we logged in
final userLoggedIn = StateNotifierProvider((ref) => LoggedInUser());
final userState = FutureProvider<UserModel>(
  (ref) async {
    final user = fetchUser(
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwNGY3ZGQyMDhmNzUyMDRiNGFjMGY1MCIsImlhdCI6MTYxNTgyMjI5MSwiZXhwIjoxNjIzNTk4MjkxfQ.CL1nYUpoD_nMIEqx56SRSaXxrgXve8zh2_G699OMkzY',
    );
    ref.read(userLoggedIn).setUser(await user);

    return user;
  },
);

Future<UserModel> fetchUser({token}) async {
  try {
    UserModel fetchedUser = await Authenticate.getUser(token: token);
    return fetchedUser;
  } catch (err) {
    throw err;
  }
}

class LoggedInUser extends StateNotifier<UserModel> {
  LoggedInUser()
      : super(
          UserModel(
            firstName: '',
            bgImageUrl: '',
            lastName: '',
            playingGames: [],
            profileImageUrl: '',
            region: '',
            userName: '',
            bio: '',
            followers: '',
            following: '',
          ),
        );

  void setUser(UserModel model) {
    state = model;
  }
}
