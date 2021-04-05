//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing models
import '../../../models/userModel.dart';

//impotring apis
import '../../../api/Explore/search.dart';

final newGroup = ChangeNotifierProvider.autoDispose((ref) => AddNewGroup());

final friendTermState =
    StateNotifierProvider.autoDispose((ref) => FriendTerm());

class FriendTerm extends StateNotifier<String> {
  FriendTerm() : super('');

  void setNewTerm(String newTerm) {
    state = newTerm;
  }
}

final foundedUsers = FutureProvider.autoDispose<List<UserModel>>(
  (ref) async {
    // looking for term from another provider
    final String term = ref.watch(friendTermState.state);

    if (term.isEmpty) {
      return [];
    }

    //Getting search response from api
    final Map<String, dynamic> res = await SearchRepository.search(
      searchFor: 'user',
      term: term,
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwNjJkNjhmNGNlMWFjMTE0YzdiNjdhYyIsImlhdCI6MTYxNzA5MDE5MiwiZXhwIjoxNjI0ODY2MTkyfQ.2R5ZungGQ2NN3bAuTwAjMhn-Yuv9Gt59ijvMQ5xzB3w',
    );

    //converting json to UserModels
    final List<UserModel> users = (res['data'] as List<dynamic>).map((user) {
      return UserModel.fromJson(user);
    }).toList();

    return users;
  },
);

class AddNewGroup extends ChangeNotifier {
  // Group name which entered in txxtField
  String _groupName = '';
  String get groupName => _groupName;
  void setGroupName(String value) {
    _groupName = value;
    notifyListeners();
  }

  // Searching friend
  List<UserModel> _groupMembers = [];
  List<UserModel> get groupMembers => _groupMembers;
  void addNewGroupMember(UserModel adedUser) {
    final List<UserModel> existingUser = _groupMembers
        .where((user) => user.userName == adedUser.userName)
        .toList();

    if (existingUser.isEmpty) {
      _groupMembers = [..._groupMembers, adedUser];
      notifyListeners();
    } else {
      return;
    }
  }

  void clearAll() {
    _groupMembers = [];
    notifyListeners();
  }

  void removeGroupMember(UserModel deletedUser) {
    _groupMembers.removeWhere((user) => deletedUser.userName == user.userName);
    notifyListeners();
  }
}
