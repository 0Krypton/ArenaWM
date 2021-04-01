//importing pacakges
import 'package:app_v2/src/Widgets/Pages/Explore/Mobile/Portrait/tourList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flare_flutter/flare_actor.dart';

//importing providers
import '../../../../../../providers/SearchScr/searchState.dart';

//importing widgets
import '../../../../../responsive_builder.dart';

//importing themes
import '../../../../../../Themes/color.dart';
import '../../../../../../Themes/text.dart';

class GameSearchResult extends StatelessWidget {
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
            color: bgColor,
            borderRadius: const BorderRadius.all(
              const Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFDDDDDD).withOpacity(0.5),
                blurRadius: 15,
              ),
            ],
          ),
          margin: EdgeInsets.all(25),
          child: Consumer(
            builder: (context, watch, child) {
              final res = watch(searchRes);
              return res.when(
                data: (tours) {
                  if (tours.isEmpty || tours.length == 0) {
                    return Center(
                      child: gilroy(
                        text: 'Oops cannot find any tournoument',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    );
                  } else {
                    return ClipRRect(
                      child: TourList(
                        tours: tours,
                        heightTourContainer: 120,
                      ),
                    );
                  }
                },
                loading: () {
                  return Center(
                    child: Container(
                      height: 80,
                      width: 80,
                      child: FlareActor(
                        'assets/rive/loading-Complicit-Simple.flr',
                        animation: 'Complicit',
                      ),
                    ),
                  );
                },
                error: (err, _) {
                  return Center(
                    child: gilroy(
                      text: '$err\n   :(',
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
