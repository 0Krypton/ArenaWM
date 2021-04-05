//importing models
import 'package:app_v2/src/models/chatModel.dart';

import 'userModel.dart';

class MessageModel {
  final UserModel sender;
  final String content;
  final String id;
  final ChatModel chat;
  final List<UserModel>? readBy;

  MessageModel({
    required this.sender,
    required this.id,
    required this.chat,
    required this.content,
    this.readBy,
  });

  factory MessageModel.fromJson(Map<String, dynamic> data) {
    // creating the sender model from the json data
    final UserModel sender = UserModel.fromJson(data['sender']);

    //creating the chat Model from the json data
    final ChatModel chat = ChatModel.fromJson(data['chat']);

    //getting all the users which readed this message
    final List<UserModel> readBy = (data['readBy']) != []
        ? (data['readBy'] as List<Map<String, dynamic>>)
            .map((Map<String, dynamic> readedByUser) =>
                UserModel.fromJson(readedByUser))
            .toList()
        : [];

    return MessageModel(
      id: data['id'],
      sender: sender,
      chat: chat,
      content: data['content'],
      readBy: readBy,
    );
  }
}
