//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing widgets
import 'messageBg.dart';
import '../../../../../../../Widgets/responsive_builder.dart';

//importing models
import '../../../../../../../models/chatModel.dart';
import 'messageBody.dart';

class MessageScr extends StatelessWidget {
  static Route comeToPage({required ChatModel chat}) {
    return PageRouteBuilder(
      pageBuilder: (context, animatio1, aniamtion2) => MessageScr(chat: chat),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation1, animation2, child) {
        final _opacityTween = Tween<double>(begin: 0.0, end: 1.0).chain(
          CurveTween(curve: Curves.easeOut),
        );

        final _offsetTween = Tween<Offset>(
          begin: Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(
          CurveTween(curve: Curves.easeOut),
        );

        return FadeTransition(
          opacity: animation1.drive(_opacityTween),
          child: SlideTransition(
            position: animation1.drive(_offsetTween),
            child: child,
          ),
        );
      },
    );
  }

  MessageScr({required this.chat});

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          final double height = sizingInformation.screenSize.height;
          final double width = sizingInformation.screenSize.width;
          return Container(
            height: height,
            width: width,
            child: Stack(
              children: [
                //bg of the page which will be contain image and chat info
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: height * .25,
                    width: width,
                    child: MessageBg(chat: chat),
                  ),
                ),
                //body : Which contains all the messages and message txtField
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: height * .8,
                    width: width,
                    child: MessageBody(
                      chat: chat,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
