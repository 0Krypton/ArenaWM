//importing packages
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing providers
import '../../../../../providers/ExploreScr/exploreScrState.dart';
import '../../../../../providers/ExploreScr/toursState.dart';

//importing widgets
import '../../../../../Widgets/responsive_builder.dart';
import './tourList.dart';

//importing themes
import '../../../../../Themes/text.dart';

Widget buildExploreScrAppBar({required double width}) {
  return Container(
    height: 50,
    width: width,
    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        reglo(
          text: 'Explore',
          fontSize: 20,
          color: Colors.black,
        ),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/explore.svg',
            height: 25,
            width: 25,
          ),
        ),
      ],
    ),
  );
}

Widget buildServers() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    physics: BouncingScrollPhysics(),
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Consumer(
        builder: (context, watch, child) {
          List<Map<String, dynamic>> listRegionServers =
              watch(exploreScrState).regions;

          return Row(
            children: List.generate(
              listRegionServers.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    context.read(exploreScrState).changeRegionOrder(index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: listRegionServers[index]['isSelected']
                            ? listRegionServers[index]['color']
                            : const Color(0xFFD2D2D2),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: reglo(
                      text: (listRegionServers[index]['name']),
                      fontSize: 12,
                      color: listRegionServers[index]['isSelected']
                          ? listRegionServers[index]['color']
                          : const Color(0xFFD2D2D2),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    ),
  );
}

Widget buildGamesAvailable() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
      child: Consumer(
        builder: (context, watch, child) {
          List<Map<String, dynamic>> listGamesAvailable =
              watch(exploreScrState).games;

          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              listGamesAvailable.length,
              (index) => GestureDetector(
                onTap: () {
                  if (context.read(exploreScrState).orderByGame[0] ==
                      listGamesAvailable[index]['name']) {
                    return;
                  } else {
                    context.read(exploreScrState).changeGameOrder(index);
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: listGamesAvailable[index]['isSelected']
                            ? listGamesAvailable[index]['shadow']
                            : const Color(0xFFC3C3C3),
                        offset: Offset(0, 2),
                        blurRadius: 15,
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        listGamesAvailable[index]['isSelected']
                            ? listGamesAvailable[index]['color-begin']
                            : const Color(0xFFD2D2D2),
                        listGamesAvailable[index]['isSelected']
                            ? listGamesAvailable[index]['color-end']
                            : const Color(0xFF797979),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Image.asset(
                    listGamesAvailable[index]['image-url'],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}

class ExploreScrTourList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        final double height = sizingInfo.localWidgetSize.height;
        final double width = sizingInfo.localWidgetSize.width;

        return Container(
          height: height,
          width: width,
          child: Consumer(
            builder: (context, watch, child) {
              final tours = watch(fetchTours);
              return tours.when(
                data: (data) {
                  return TourList(
                    tours: data,
                  );
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
