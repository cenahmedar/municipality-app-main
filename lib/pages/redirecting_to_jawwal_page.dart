import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

class RedirectingToJawwalPage extends StatefulWidget {
  @override
  State<RedirectingToJawwalPage> createState() =>
      _RedirectingToJawwalPageState();
}

class _RedirectingToJawwalPageState extends State<RedirectingToJawwalPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _succeeded = false;

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        _succeeded = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MainAppBarWidget(scaffoldKey: _scaffoldKey, title: 'Jawwal Pay'),
      drawer: MenuDrawerWidget(scaffoldKey: _scaffoldKey),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 60,
                horizontal: 100,
              ),
              child: SvgPicture.asset(
                'assets/logos/jawwal.svg',
                height: 164,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: Text(
                _succeeded
                    ? I18n.of(context)!.authentication_succeeded
                    : I18n.of(context)!
                        .you_will_be_transferred_to_jawwal_to_finish_connection,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontSize: 17,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
