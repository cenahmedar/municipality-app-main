import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:municipality_app/previous/presentation/common/enums/screen.dart';
// import 'package:municipality_app/previous/presentation/common/events/base_event.dart';
// import 'package:municipality_app/previous/presentation/common/extensions/navigator.dart';
// import 'package:municipality_app/previous/presentation/common/states/general_state.dart';
// import 'package:municipality_app/previous/presentation/common/widgets/base/base_stateful_widget.dart';
// import 'package:municipality_app/previous/presentation/splash/splash_bloc.dart';
import 'package:municipality_app/environments/config/config.dart';

const int SPLASH_DURATION = 810;

class SplashScreenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenPage();
}

class _SplashScreenPage extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  Timer? _timer;
  Route? route;

  bool _logoVisible = false;

  late AnimationController _logoController;
  late Animation<Offset> _logoOffset;

  @override
  void initState() {
    // _startTimer();

    _logoController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: SPLASH_DURATION),
    );
    _logoOffset = Tween<Offset>(
      begin: Offset(0.0, 0.12),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.easeInOutBack,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    Config? config = FlavorConfig.instance?.config;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Center(
        child: AnimatedOpacity(
          opacity: true ? 1.0 : 0.0,
          duration: Duration(milliseconds: SPLASH_DURATION),
          curve: Curves.easeInOut,
          child: SlideTransition(
            position: _logoOffset,
            child: Image.asset(
              Config.instance?.logo ?? '',
              height: MediaQuery.of(context).size.width *
                  (Config.instance?.logoRatio ?? 0.5),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    _timer?.cancel();
    const period = const Duration(seconds: 5);
    int seconds = 5;
    _timer = new Timer.periodic(
      period,
      (Timer timer) {
        if (seconds == 5) {
          setState(() => _logoVisible = true);
          _logoController.forward();
        } else if (seconds == 0) {
          setState(
            () {
              timer.cancel();
              // if (route != null)
              // switch (route!) {
              //   case Route.home:
              //     _routeToHome();
              //     break;
              //
              //   case Route.signin:
              // _routeToStart();
              //     break;
              // }
            },
          );
        }

        setState(() => seconds -= 1);
      },
    );
  }

  // void _routeToHome() {
  //   RouteNavigator.pushReplacementScreen(
  //     context,
  //     Screen.navigation,
  //     arguments: false,
  //   );
  // }

  // void _routeToStart() {
  //   RouteNavigator.pushReplacementScreen(
  //     context,
  //     Screen.on_board,
  //   );
  // }

  // @override
  // void onSuccessListener(Success state) {
  //   switch (state.type) {
  //     case EventType.check_user:
  //       if (state.data)
  //         _routeToHome();
  //       else
  //         _routeToStart();
  //       break;
  //     default:
  //       _routeToStart();
  //   }
  // }

  // @override
  // void onErrorListener(Error state) {
  //   super.onErrorListener(state);
  // }
}
