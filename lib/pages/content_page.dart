import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

class ContentPage extends StatelessWidget {
  final String text;
  final String appbarTitle;
  final String iconUrl;

  ContentPage({
    required this.iconUrl,
    required this.text,
    required this.appbarTitle,
  });
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: MenuDrawerWidget(
        scaffoldKey: _scaffoldKey,
      ),
      appBar: MainAppBarWidget(
        scaffoldKey: _scaffoldKey,
        title: appbarTitle,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 110,
                    vertical: 20,
                  ),
                  child: SvgPicture.asset(iconUrl),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                    bottom: 60,
                  ),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
