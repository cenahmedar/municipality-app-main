import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  // final Color color;

  const LoadingWidget({
    Key? key,
    this.size = 60.0,
    // this.color = ColorStyle.yellowP,
  }) : assert(size >= 60.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      child: SizedBox(
        width: size,
        height: size,
        child: Lottie.asset('assets/animations/loading.json', repeat: true),
      ),
    );
  }
}
