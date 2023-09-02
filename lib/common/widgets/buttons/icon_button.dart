import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:municipality_app/utils/colors.dart';

class IconButtonGrey extends StatelessWidget {
  final double size;
  final String asset;

  const IconButtonGrey({
    required this.asset,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: dPrimaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(9),
          ),
          width: size * .75,
          height: size * .75,
          child: SvgPicture.asset(
            asset,
            color: dPrimaryColor,
            width: size * .5,
            height: size * .5,
          ),
        ),
      ),
    );
  }
}
