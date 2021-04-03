//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing models
import '../../../../../models/user.dart';

//importing widgets
import '../../../../../Widgets/responsive_builder.dart';
import '../../../../../Widgets/textSplitter.dart';
import '../../../../../Widgets/animatedScale.dart';

//impoting themes
import '../../../../../Themes/color.dart';
import '../../../../../Themes/text.dart';

//importing utils
import '../../../../../utils/getGame.dart';
import '../../../../../utils/getAmountWithPrefix.dart';

//importing providers
import '../../../../../providers/User/userState.dart';
import '../../../../../providers/SideBar/sideBarState.dart';

class ProfileScreenMobilePortrait extends StatefulWidget {
  const ProfileScreenMobilePortrait();

  @override
  _ProfileScreenMobilePortraitState createState() =>
      _ProfileScreenMobilePortraitState();
}

class _ProfileScreenMobilePortraitState
    extends State<ProfileScreenMobilePortrait> with TickerProviderStateMixin {
  late List<AnimationController> _gamesScaleAnimationController = [];
  late int plyingGamesLength;
  @override
  void initState() {
    super.initState();
    plyingGamesLength = context.read(userLoggedIn.state).playingGames.length;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (int i = 0; i < plyingGamesLength; i++) {
      _gamesScaleAnimationController.add(
        AnimationController(
          vsync: this,
          duration: 300.milliseconds + (i * 100).milliseconds,
        )..addListener(
            () {
              setState(() {});
            },
          ),
      );
    }

    Future.delayed(
      const Duration(milliseconds: 750),
      () {
        _gamesScaleAnimationController.forEach(
          (gController) {
            gController.forward();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _gamesScaleAnimationController.forEach((controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        final height = sizeInfo.screenSize.height;
        final width = sizeInfo.screenSize.width;

        return Consumer(
          builder: (context, watch, child) {
            final loggedInUser = watch(userLoggedIn.state);

            return Container(
              height: height,
              width: width,
              color: bgColor,
              child: SingleChildScrollView(
                // controller: scrollController,
                physics: BouncingScrollPhysics(),
                child: Container(
                  height: height + 0.1,
                  width: width,
                  color: bgColor,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          _buildHeader(
                            width: width,
                            height: height * .2,
                            user: loggedInUser,
                          ),
                          SizedBox(height: (((height * .2) * .85) / 2) + 20),
                          _buildUsername(user: loggedInUser),
                          const SizedBox(height: 10),
                          _buildBio(width: width * .65, user: loggedInUser),
                          const SizedBox(height: 15),
                          _buildAccStats(width: width, user: loggedInUser),
                          const SizedBox(height: 30),
                          _buildGames(
                            width: width,
                            games: loggedInUser.playingGames,
                          ),
                        ],
                      ),
                      Positioned(
                        top: 15,
                        right: 15,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            context.read(sideBarState).playAnimation();
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            child: SvgPicture.asset(
                              'assets/menu.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildAccStats({required double width, required UserModel user}) {
    return Container(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildUserAccStat(
              lable: 'following', text: '${user.following.length}'),
          SizedBox(
            width: 50,
          ),
          buildUserAccStat(
              lable: 'followers', text: '${user.followers.length}'),
        ],
      ),
    );
  }

  Widget buildUserAccStat({required String text, required String lable}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PlayAnimation<double>(
          tween: (0.0).tweenTo(1.0),
          duration: 300.milliseconds,
          delay: 1000.milliseconds,
          builder: (context, child, value) => Opacity(
            opacity: value,
            child: qanelas(
              text: text.amountWithPrefix,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 3),
        PlayAnimation<double>(
          tween: (0.0).tweenTo(1.0),
          duration: 300.milliseconds,
          delay: 800.milliseconds,
          builder: (context, child, value) => Opacity(
            opacity: value,
            child: aremat(
              text: lable,
              fontSize: 10,
              color: const Color(0xFFA3A3A3),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGames({required double width, required List<dynamic> games}) {
    double padGamContainerLR = 15;
    double marginGameContainer = 10;
    double widthGameContainers =
        (width / 2) - (padGamContainerLR * 2) - (marginGameContainer * 2);
    return Wrap(
      runSpacing: padGamContainerLR * 2,
      children: List.generate(
        games.length,
        (index) {
          final List<Color> gameGradientColors = GameAssist.getGameColor(
            games[index],
          );
          return AnimatedScale(
            animController: _gamesScaleAnimationController[index],
            beginScale: 0.0,
            middleOneScale: 1.2,
            middleTwoScale: 0.8,
            endScale: 1,
            child: Container(
              height: 100,
              width: widthGameContainers,
              margin: EdgeInsets.symmetric(horizontal: marginGameContainer),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gameGradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: GameAssist.getGameShadowColor(games[index]),
                    blurRadius: 15,
                    offset: Offset(0, 4),
                  ),
                ],
                borderRadius: const BorderRadius.all(const Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  // listGamesPlayed[index].imageUrl,
                  GameAssist.getGameImageUrl(games[index]),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  Widget _buildBio({required double width, required UserModel user}) {
    return PlayAnimation<double>(
      tween: (0.0).tweenTo(1.0),
      duration: 300.milliseconds,
      delay: 850.milliseconds,
      builder: (context, child, value) => Opacity(
        opacity: value,
        child: Container(
          alignment: Alignment.center,
          width: width,
          child: textSplitter(input: user.bio),
        ),
      ),
    );
  }

  Widget _buildUsername({required UserModel user}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PlayAnimation<double>(
          tween: (0.0).tweenTo(1.0),
          duration: 300.milliseconds,
          delay: 900.milliseconds,
          builder: (context, child, value) => Opacity(
            opacity: value,
            child: qanelas(
              text: user.userName,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),

        //TODO:Add verified
      ],
    );
  }

  Widget _buildHeader({
    required double width,
    required double height,
    required UserModel user,
  }) {
    double hwProfileImg = height * .85;
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: height,
          width: width,
          child: Image.network(
            'http://localhost:3000/images/users/${user.bgImageUrl}',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: height - (hwProfileImg / 2),
          child: PlayAnimation<double>(
            duration: 350.milliseconds,
            delay: 500.milliseconds,
            tween: (0.0).tweenTo(1.0),
            curve: Curves.ease,
            builder: (context, child, value) => Transform.scale(
              scale: value,
              child: Container(
                height: hwProfileImg,
                width: hwProfileImg,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.35),
                      blurRadius: 40,
                    ),
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      'http://localhost:3000/images/users/${user.profileImageUrl}',
                    ),
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
