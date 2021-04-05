//importing pacakges
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing apis
import '../../../api/Home/chat.dart';

//importing models
import '../../../models/chatModel.dart';
import '../../../models/userModel.dart';
import '../../../models/messageModel.dart';

final allChats = FutureProvider.autoDispose<List<ChatModel>>(
  (ref) async {
    final Map<String, dynamic> res = await Chat.getChats();
    //converting json to ChatModels
    final List<ChatModel> chats = (res['chats'] as List<dynamic>).map((chat) {
      //converting users into List of UserModel
      final List<UserModel> users = (chat['users'] as List<dynamic>)
          .map((user) => UserModel.fromJson(user))
          .toList();
      //converting admins into List of UserModel
      final List<UserModel> admins = (chat['admins'] as List<dynamic>)
          .map((admin) => UserModel.fromJson(admin))
          .toList();

      //converting the json of latestMessage to the MessageModel
      MessageModel? latestMessage;

      print(chat['latestMessage']);
      print(chat['latestMessage'].runtimeType);

      if (chat['latestMessage'] != null) {
        latestMessage = MessageModel.fromJson(
          chat['latestMessage'],
        );
      }

      return ChatModel.fromJson({
        "name": chat['name'] as String,
        "isGroupChat": chat['isGroupChat'] as bool,
        "id": chat['_id'],
        "users": users,
        "admins": admins,
        "latestMessage": latestMessage ?? null,
      });
    }).toList();

    return chats;
  },
);

final chatProvider =
    ChangeNotifierProvider.autoDispose((ref) => ChatProvider());

class ChatProvider extends ChangeNotifier {
  Future<MessageModel> sendMessage({
    required String content,
    required String chatId,
  }) async {
    try {
      // posting the message to database and receiving that
      final res = await Chat.sendMessage(chatId: chatId, content: content);

      print('print from provider/home/inboc/chat.dart sendMessage() \n$res');

      // creating the message model from received message data
      final MessageModel message = MessageModel.fromJson(res);

      return message;
    } catch (e) {
      print('### error providers/home/chat/ sendMessage() ###\n$e');
      throw (e);
    }
  }
}
