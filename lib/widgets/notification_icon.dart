import 'package:flutter/material.dart';
import 'package:municipality_app/constants/routes.dart';

class NotificationIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.notifications_none_outlined),
        color: Colors.white,
        onPressed: () => Navigator.of(context).pushNamed(Routes.NOTIFICATIONS),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
