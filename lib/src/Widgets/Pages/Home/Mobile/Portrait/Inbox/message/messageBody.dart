//importing packages
import 'package:app_v2/src/models/chatModel.dart';
import 'package:flutter/material.dart';
//importing widgets
import '../../../../../../responsive_builder.dart';
import './messageTxtField.dart';

class MessageBody extends StatelessWidget {
  MessageBody({required this.chat});

  final ChatModel chat;

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
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: const Radius.circular(15),
              topRight: const Radius.circular(15),
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              //message txtField
              Positioned(
                bottom: 15,
                right: 15,
                left: 15,
                child: MessageTxtField(chat: chat),
              ),
            ],
          ),
        );
      },
    );
  }
}
