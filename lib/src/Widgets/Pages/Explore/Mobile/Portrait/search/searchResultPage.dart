//importing pacakges
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing themes
import '../../../../../../Themes/color.dart';
import '../../../../../../Themes/text.dart';

//importing widgets
import './searchBody.dart';
import './searchResultOption.dart';
import '../../../../../responsive_builder.dart';

//importing providers
import '../../../../../../providers/SearchScr/searchWidgetState.dart';
import '../../../../../../providers/SearchScr/searchState.dart';

class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage();
  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage>
    with TickerProviderStateMixin {
  late AnimationController _userAnimController;
  late AnimationController _gameAnimController;

  @override
  void initState() {
    super.initState();
    _userAnimController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );
    _gameAnimController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );

    _userAnimController.forward();
  }

  @override
  void dispose() {
    _userAnimController.dispose();
    _gameAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeinfo) {
        return GestureDetector(
          onPanUpdate: (d) {
            print(d.primaryDelta);
          },
          child: Container(
            height: sizeinfo.localWidgetSize.height,
            width: sizeinfo.localWidgetSize.width,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    _buildBackBtn(context: context),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SearchResultOption(
                          colorAnimController: _userAnimController,
                          iconUrl: 'assets/user.svg',
                          begin: Colors.black,
                          end: const Color(0xFF00A1E5),
                          onTap: () {
                            if (context
                                    .read(searchScreenWidgetState)
                                    .activeSearchOptionIndex ==
                                0) {
                              return;
                            } else {
                              _userAnimController.forward();
                              _gameAnimController.reverse();
                              context
                                  .read(searchScreenWidgetState)
                                  .setActiveSearchOption(
                                    option: 'user',
                                    index: 0,
                                  );

                              context.read(searchState).setSearchFor('user');
                            }
                          },
                        ),
                        SizedBox(width: 50),
                        SearchResultOption(
                          colorAnimController: _gameAnimController,
                          iconUrl: 'assets/controller.svg',
                          begin: Colors.black,
                          end: const Color(0xFF00DD3E),
                          onTap: () {
                            if (context
                                    .read(searchScreenWidgetState)
                                    .activeSearchOptionIndex ==
                                1) {
                              return;
                            } else {
                              _gameAnimController.forward();
                              _userAnimController.reverse();
                              context
                                  .read(searchScreenWidgetState)
                                  .setActiveSearchOption(
                                    option: 'tour',
                                    index: 1,
                                  );

                              context.read(searchState).setSearchFor('tour');
                            }
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: SearchBody(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBackBtn({required BuildContext context}) {
    return Container(
      height: 5,
      width: 70,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.all(
          const Radius.circular(5),
        ),
      ),
    );
  }
}
