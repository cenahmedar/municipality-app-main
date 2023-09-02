import 'package:flutter/material.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/user.dart';
import 'package:provider/provider.dart';

class HomepageHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.read<User>().isapproved == false
        ? Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              I18n.of(context)!.account_not_active,
              style: Theme.of(context).textTheme.caption?.copyWith(
                    fontSize: 17.0,
                    color: Theme.of(context).primaryColor,
                  ),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(11)),
              boxShadow: [
                BoxShadow(
                    color: const Color(0x40000000),
                    offset: Offset(1, 1),
                    blurRadius: 8,
                    spreadRadius: 0)
              ],
              color: const Color(0xfffffefe),
            ),
          )
        : Text(
            I18n.of(context)!.how_we_can_help_today,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 24,
            ),
          );
  }
}
