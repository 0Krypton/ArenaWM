//importing models
import 'messageModel.dart';

import 'userModel.dart';

class ChatModel {
  final String name;
  final bool isGroupChat;
  final List<UserModel> users;
  final List<UserModel> admins;
  final MessageModel? latestMessage;
  final String id;

  ChatModel({
    required this.id,
    required this.name,
    required this.isGroupChat,
    required this.users,
    required this.admins,
    this.latestMessage,
  });

  factory ChatModel.fromJson(Map<String, dynamic> data) {
    final ChatModel chatModel = ChatModel(
      name: data['name'],
      isGroupChat: data['isGroupChat'],
      id: data['id'],
      users: data['users'],
      admins: data['admins'],
      latestMessage: data['latestMessage'],
    );

    return chatModel;
  }
}
