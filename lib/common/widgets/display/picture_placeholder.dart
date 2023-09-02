import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PicturePlaceholder extends StatelessWidget {
  final double size;
  final String asset;

  const PicturePlaceholder({
    this.asset = 'assets/icons/icon_placeholder.svg',
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      // color: ColorStyle.athensGrey,
      child: SvgPicture.asset(
        asset,
        width: size / 2,
        height: size / 2,
        color: Colors.grey.shade300,
      ),
    );
  }
}
