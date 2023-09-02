import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingImageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: ColorStyle.white.withOpacity(0),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildShimmer(
            Container(
              height: 66,
              width: double.infinity,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                // color: ColorStyle.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: buildShimmer(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(flex: 3, child: _buildContainer(18)),
                  SizedBox(width: 18),
                  Flexible(flex: 1, child: _buildContainer(18)),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: buildShimmer(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(flex: 1, child: _buildContainer(18)),
                  SizedBox(width: 18),
                  Flexible(flex: 1, child: _buildContainer(18)),
                  SizedBox(width: 18),
                  Flexible(flex: 1, child: _buildContainer(18)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(double height) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff5d00ce),
      ),
    );
  }
}


Widget buildShimmer(Widget child) {
  return Shimmer.fromColors(
    direction: ShimmerDirection.ltr,
    baseColor: Color(0xff5d00ce).withOpacity(0.6),
    highlightColor: Color(0x4D5d00ce),
    child: child,
  );
}