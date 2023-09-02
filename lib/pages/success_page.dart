import 'package:flutter/material.dart';
import 'package:municipality_app/common/widgets/buttons/cta_button.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

class SuccessPage extends StatefulWidget {
  final String successMessage;
  final String ctaButtonText;
  final VoidCallback ctaButtonOnClick;
  final String appBarTitle;
  final bool showBack;

  SuccessPage({
    required this.ctaButtonOnClick,
    required this.ctaButtonText,
    required this.successMessage,
    required this.appBarTitle,
    this.showBack = false,
  });
  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/success_screen_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        drawer: MenuDrawerWidget(
          scaffoldKey: _scaffoldKey,
        ),
        key: _scaffoldKey,
        appBar: MainAppBarWidget(
          showBack: widget.showBack,
          scaffoldKey: _scaffoldKey,
          title: widget.appBarTitle,
        ),
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        widget.successMessage,
                        textAlign: TextAlign.center,
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 100,
                        ),
                        child: CTAButton(
                          label: widget.ctaButtonText,
                          onPressed: widget.ctaButtonOnClick,
                          mainColor: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
