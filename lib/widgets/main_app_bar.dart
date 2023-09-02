import 'package:flutter/material.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/widgets/notification_icon.dart';

class MainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;
  final bool showBack;
  MainAppBarWidget({
    required this.scaffoldKey,
    required this.title,
    this.showBack = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(145);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                showBack
                    ? GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                    : SizedBox(
                        width: 30,
                      ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                I18n.of(context)!.menu,
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ],
        ),
        height: 145,
      ),
      centerTitle: false,
      actions: [
        // Container(
        //   alignment: Alignment.topCenter,
        //   child: NotificationIconWidget(),
        // ),
      ],
      elevation: 4,
      shadowColor: Colors.grey,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
      ),
      toolbarHeight: 145,
    );
  }
}
