import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

class CallUsPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> getEntry(
    BuildContext context, {
    required String title,
    required String value,
  }) {
    return [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.caption?.copyWith(
                fontSize: 17,
                color: Colors.black,
              ),
        ),
      ),
      Container(
        padding: EdgeInsets.all(2),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFF919191),
            ),
          ),
        ),
        child: Text(
          value,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.caption?.copyWith(
                fontSize: 17,
                color: Colors.black,
              ),
        ),
      ),
    ];
  }

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
        title: I18n.of(context)!.call_us,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 110,
                  vertical: 45,
                ),
                child: SvgPicture.asset(
                  'assets/icons/call_us.svg',
                  height: 174,
                ),
              ),
              ...getEntry(
                context,
                title: I18n.of(context)!.contact_us_on_number,
                value: '1234543',
              ),
              ...getEntry(
                context,
                title: I18n.of(context)!.service_center_address,
                value: '1234543',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
