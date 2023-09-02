import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:municipality_app/constants/app_constants.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/notifications.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

class NotificationsPage extends StatefulWidget {
  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Notifications> _notifications = Notifications.getDummy();

  Widget _getNewBadge() {
    return Container(
      height: 28,
      width: 70,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).primaryColor,
      ),
      child: Text(
        I18n.of(context)!.new_word,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.caption?.copyWith(
              color: Colors.white,
              fontSize: 14,
            ),
      ),
    );
  }

  Widget getCard({required Notifications notification}) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      margin: EdgeInsets.only(bottom: 17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFB6C6D4),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        notification.header,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: 17.0,
                            ),
                      ),
                      Text(
                        formatter.format(notification.createdAt),
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: 14.0,
                            ),
                      )
                    ],
                  ),
                ),
                Text(
                  notification.body,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: 13.0,
                        color: Color(0xFF4F4D4D),
                      ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 2, child: notification.isNew ? _getNewBadge() : SizedBox())
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: MenuDrawerWidget(
        scaffoldKey: _scaffoldKey,
      ),
      appBar: MainAppBarWidget(
        scaffoldKey: _scaffoldKey,
        title: I18n.of(context)!.my_files,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 22,
            horizontal: 16,
          ),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(
                    _notifications.length,
                    (index) => getCard(
                      notification: _notifications[index],
                    ),
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
