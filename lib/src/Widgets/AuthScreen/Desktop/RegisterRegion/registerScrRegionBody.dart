//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//importing providers
import '../../../../providers/Auth/authenticationState.dart';
import '../../../../providers/Auth/authWidgetsState.dart';

//importing widgets
import '../../../customBtn.dart';
import '../../../dropdownbutton.dart';

//importing screens
import '../RegisterClan/registerScrClan.dart';

class RegisterRegionBody extends StatelessWidget {
  const RegisterRegionBody();
  final paddingHr = 20.0;

  @override
  Widget build(BuildContext context) {
    final widgetsState = context.read(authWidgetsState);

    return Stack(
      children: [
        Positioned(
          left: (widgetsState.registerBodyPos).abs(),
          top: 0,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: widgetsState.widthScr * .5,
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 30,
                  bottom: 30,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFBFF3FF),
                      blurRadius: 50,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _header(),
                    SizedBox(height: 20),
                    _body(),
                    SizedBox(height: 20),
                    _buildButtons(context: context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtons({required BuildContext context}) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onTapCallBack: () {
              Navigator.of(context).pop();
            },
            title: 'BACK',
            fontFamily: 'Noir',
            borderRadius: 10,
            blurRadius: 20,
            bgColor: const Color(0xFFC5F5FF),
            shadowColor: const Color(0xFFB5F1FF),
            textColor: const Color(0xFF52C2EF),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: CustomButton(
            onTapCallBack: () {
              Navigator.of(context).push(
                RegisterClanScreenDesktop.comeToPage(),
              );
            },
            title: 'NEXT',
            fontFamily: 'Noir',
            borderRadius: 10,
            blurRadius: 20,
            bgColor: const Color(0xFF9AE2FF),
            shadowColor: const Color(0xFF74D7FF),
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return Container(
      width: 400,
      child: Consumer(
        builder: (context, watch, child) {
          return CustomDropDown(
            defaulyValue: watch(authentication).sRegion,
            titles: [
              'Middle-East',
              'Asia',
              'Europe',
              'NA-East',
              'NA-West',
              'Africa',
              'Oceania',
            ],
            titleColor: const Color(0xFF36AEDE),
            backgroundColor: const Color(0xFFE5FAFF),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            onChange: (selected) {
              context.read(authentication).setRegion(selected);
            },
          );
        },
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Container(
          width: 180,
          height: 180,
          child: Image.asset(
            'assets/form/earth.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 15),
        SelectableText(
          'Select Your Region',
          style: TextStyle(
            height: 1.2,
            color: const Color(0xFF006B96),
            fontSize: 15,
            fontFamily: 'Reglo',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        SelectableText(
          'Notice: Tournouments Will sort\naccording to your region\nYou can change it another time',
          style: TextStyle(
            height: 1.2,
            color: const Color(0xFF36AEDE),
            letterSpacing: 1.2,
            fontSize: 12,
            fontFamily: 'Reglo',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
