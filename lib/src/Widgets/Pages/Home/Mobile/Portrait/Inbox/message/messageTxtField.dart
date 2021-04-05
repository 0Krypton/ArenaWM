//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing providers
import '../../../../../../../providers/HomeScr/Inbox/chat.dart';

//importing the models
import '../../../../../../../models/chatModel.dart';
import '../../../../../../../models/messageModel.dart';

//importing widgets
import '../searchField.dart';
import '../../../../../../animatedScale.dart';

class MessageTxtField extends StatefulWidget {
  const MessageTxtField({required this.chat});

  //Getting the chat which we sending data to that
  final ChatModel chat;

  @override
  _MessageTxtFieldState createState() => _MessageTxtFieldState();
}

class _MessageTxtFieldState extends State<MessageTxtField>
    with TickerProviderStateMixin {
  late final TextEditingController _messageTxtFieldController;
  late final FocusNode _messageTxtFieldFocusNode;

  late final AnimationController _txtFieldColorController;
  late final AnimationController _sendMsgBtnScaleController;

  @override
  void initState() {
    super.initState();

    //initilizing animation Controller
    _sendMsgBtnScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _txtFieldColorController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );

    //initilizing txtFiledController
    _messageTxtFieldController = TextEditingController(text: '');

    //initilizing focusNodes
    _messageTxtFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();

    //disposing animationController
    _txtFieldColorController.dispose();
    _sendMsgBtnScaleController.dispose();

    //disposing txtFieldControllers
    _messageTxtFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F9FF),
        borderRadius: const BorderRadius.all(
          const Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          /// showing the msgInput to type messages
          Expanded(
            child: TxtField(
              controller: _messageTxtFieldController,
              focusNode: _messageTxtFieldFocusNode,
              colorAnimController: _txtFieldColorController,
              fillColor: const Color(0xFFF3F9FF),
              txtColor: const Color(0xFF0055A4),
              heightField: 50,
              hint: 'Type Message ...',
              callBack: (String value) {
                if (_messageTxtFieldController.text.isEmpty) {
                  _sendMsgBtnScaleController.reverse();
                } else {
                  _sendMsgBtnScaleController.forward();
                }
              },
            ),
          ),
          const SizedBox(width: 5),

          /// showing the sendMsgBtn if the txtField's value is greater than 0
          AnimatedBuilder(
            animation: _sendMsgBtnScaleController,
            builder: (context, child) {
              return AnimatedScale(
                beginScale: 0.0,
                middleOneScale: 1.2,
                middleTwoScale: 0.8,
                endScale: 1.0,
                animController: _sendMsgBtnScaleController,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    print(_messageTxtFieldController.text);
                    //sending the message to database
                    final MessageModel chat =
                        await context.read(chatProvider).sendMessage(
                              content: _messageTxtFieldController.text,
                              chatId: widget.chat.id,
                            );
                    print('aded to db');
                    print(chat.content);

                    //clearing the textField's Content
                    _messageTxtFieldController.clear();
                  },
                  child: child,
                ),
              );
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF8AC7FF),
                    const Color(0xFF2871B4),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: const [
                  const BoxShadow(
                    color: const Color(0xFFAAD6FF),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: SvgPicture.asset(
                'assets/send.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
