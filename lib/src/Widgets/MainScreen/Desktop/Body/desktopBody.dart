//importing packages
import 'package:flutter/material.dart';

//importing widgets
import '../../../responsive_builder.dart';

class DesktopBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ResponsiveBuilder(
        builder: (context, sizeInfo) {
          return ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 15,
                  ),
                ],
              ),
              margin: EdgeInsets.only(
                right: 50,
                top: 50,
                bottom: 50,
                left: 25,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(sizeInfo.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
