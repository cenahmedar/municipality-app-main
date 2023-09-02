import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingServiceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
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
              context,
              Container(
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
                context,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(flex: 1, child: _buildContainer(context, 18)),
                    SizedBox(width: 18),
                    Flexible(flex: 1, child: _buildContainer(context, 18)),
                    SizedBox(width: 18),
                    Flexible(flex: 1, child: _buildContainer(context, 18)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(BuildContext context, double height) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

Widget buildShimmer(BuildContext context, Widget child) {
  return Shimmer.fromColors(
    direction: ShimmerDirection.ltr,
    baseColor: Theme.of(context).primaryColor.withOpacity(0.6),
    highlightColor: Theme.of(context).primaryColor,
    child: child,
  );
}
