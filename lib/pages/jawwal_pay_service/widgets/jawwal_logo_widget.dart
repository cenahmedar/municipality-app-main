import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/values_manager.dart';

class JawwalLogo extends StatelessWidget {
  const JawwalLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppMargin.m8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  AppSize.s0, AppSize.s40, AppSize.s4, AppSize.s4),
              child: SvgPicture.asset(
                'assets/icons/jawwal_pay.svg',
                fit: BoxFit.contain,
                height: 70,
                width: 85,
              ),
            ),
          ),
          // Center(
          //   child: Container(
          //     margin: EdgeInsets.fromLTRB(
          //         AppSize.s0, AppSize.s40, AppSize.s4, AppSize.s4),
          //     child: Image.asset(
          //       'assets/images/baladia_logo.jpeg',
          //       'assets/images/baladia_logo.jpeg',
          //       fit: BoxFit.cover,
          //       height: 115,
          //       width: 200,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
