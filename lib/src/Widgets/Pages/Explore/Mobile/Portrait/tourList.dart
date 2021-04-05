//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing models
import '../../../../../models/tourModel.dart';

//importing providers
import '../../../../../providers/ExploreScr/toursState.dart';

//importing utils
import '../../../../../utils/getGame.dart';

//importing themes
import '../../../../../Themes/text.dart';

class TourList extends StatefulWidget {
  final List tours;
  final double heightTourContainer;
  TourList({
    required this.tours,
    this.heightTourContainer = 140.0,
  });
  @override
  _TourListState createState() => _TourListState();
}

class _TourListState extends State<TourList> {
  //height of each tour item
  // final double heightTourContainer = widget.heightTourContainer;
  final double marginHorizontal = 30.0;
  final double marginVertical = 5.0;

  //Controller for controlling the state of tour containers
  late ScrollController _listController;

  @override
  void initState() {
    super.initState();
    _listController = ScrollController();
    _listController
      ..addListener(() {
        double value =
            _listController.offset / ((widget.heightTourContainer * 80) / 100);

        context.read(tourListState).setScale(value);
      });
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      controller: _listController,
      itemCount: widget.tours.length,
      padding: EdgeInsets.only(top: 50, bottom: 50),
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 150),
          child: SlideAnimation(
            verticalOffset: 100,
            curve: Curves.ease,
            child: FadeInAnimation(
              duration: const Duration(milliseconds: 350),
              delay: const Duration(milliseconds: 150),
              child: Consumer(
                builder: (context, watch, child) {
                  final tourListScale = watch(tourListState).scale;
                  double scale = 1.0;

                  if (tourListScale > 0.2) {
                    // we used 'index + 1' because first item in the list must scale
                    // if we use 'index' instead of that, then first item scale to 0 suddenly
                    scale = (index + 1) + 0.2 - tourListScale;
                    if (scale < 0) {
                      scale = 0;
                    } else if (scale > 1) {
                      scale = 1;
                    }
                  }
                  return Opacity(
                    opacity: scale,
                    child: Transform(
                      transform: Matrix4.identity()..scale(scale, scale),
                      alignment: index % 2 == 0
                          ? Alignment.bottomRight
                          : Alignment.bottomLeft,
                      child: Align(
                        heightFactor: 0.8,
                        alignment: Alignment.topCenter,
                        child: child,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: widget.heightTourContainer,
                  margin: EdgeInsets.symmetric(
                    horizontal: marginHorizontal,
                    vertical: marginVertical,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        widget.tours[index].gradientBegin!,
                        if (widget.tours[index].gradientMid != null)
                          widget.tours[index].gradientMid!,
                        widget.tours[index].gradientEnd!,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: widget.tours[index].shadowColor!,
                        blurRadius: 25,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      _buildPrice(tour: widget.tours[index]),
                      _buildBgImg(tour: widget.tours[index]),
                      _buildInfo(tour: widget.tours[index]),
                      _buildHeader(tour: widget.tours[index]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPrice({required Tour tour}) {
    return Positioned(
      right: 10,
      bottom: 0,
      child: Container(
        height: widget.heightTourContainer,
        child: FittedBox(
          child: qanelas(
            text: '${tour.prize}',
            color: tour.bgPriceColor!,
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _buildBgImg({required Tour tour}) {
    return Positioned(
      bottom: 0,
      right: 2,
      child: Container(
        height: widget.heightTourContainer + 20,
        child: Image.network(
          'http://localhost:3000/images/tour/${tour.bgImg}',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _buildInfo({required Tour tour}) {
    return Positioned(
      top: 55,
      left: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGameMode(tour: tour),
          const SizedBox(height: 5),
          _buildPlyrs(tour: tour),
        ],
      ),
    );
  }

  Widget _buildPlyrs({required Tour tour}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/players.svg',
          height: 18,
          width: 18,
          color: tour.textColor,
        ),
        const SizedBox(width: 5),
        bronx(
          text: '${tour.enteredPlayers}',
          fontSize: 10,
          color: tour.textColor!,
        ),
        reglo(
          text: '/',
          fontSize: 12,
          color: tour.textColor!,
        ),
        bronx(
          text: '${tour.totalPlayers}',
          fontSize: 10,
          color: tour.textColor!,
        ),
      ],
    );
  }

  Widget _buildGameMode({required Tour tour}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/gameMode.svg',
          height: 18,
          width: 18,
          color: tour.textColor,
        ),
        const SizedBox(width: 5),
        bronx(
          text: '${tour.tourMode} - ${tour.gameMode}',
          fontSize: 10,
          color: tour.textColor!,
        ),
      ],
    );
  }

  Widget _buildHeader({required Tour tour}) {
    return Positioned(
      top: 15,
      left: 15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildGameLogo(tour),
          const SizedBox(width: 10),
          bronx(
            text: tour.title!,
            fontSize: 12,
            color: tour.textColor!,
          ),
        ],
      ),
    );
  }

  Widget _buildGameLogo(Tour tour) {
    return Container(
      height: 25,
      width: 25,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: tour.gradientBegin,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: tour.gameIconShadowColor!,
            blurRadius: 10,
          ),
        ],
      ),
      child: Image.asset(
        GameAssist.getGameLogo(
          gameName: tour.game!.toLowerCase(),
        ),
      ),
    );
  }
}
