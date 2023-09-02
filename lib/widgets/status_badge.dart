import 'package:flutter/material.dart';
import 'package:municipality_app/generated/i18n.dart';

enum RequestStatus { IN_PROGRESS, REJECTED, APPROVED }

class StatusBadgeWidget extends StatelessWidget {
  final RequestStatus status;
  StatusBadgeWidget({required this.status});

  @override
  Widget build(BuildContext context) {
    final stringMap = {
      RequestStatus.IN_PROGRESS: I18n.of(context)!.in_progress,
      RequestStatus.REJECTED: I18n.of(context)!.rejected,
      RequestStatus.APPROVED: I18n.of(context)!.approved,
    };
    final colorsMap = {
      RequestStatus.IN_PROGRESS: Color(0xFF6DBC7E),
      RequestStatus.REJECTED: Color(0xFFE96565),
      RequestStatus.APPROVED: Color(0xFF6DBC7E),
    };
    return Container(
      height: 24,
      width: 71,
      decoration: BoxDecoration(
        color: colorsMap[status],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        stringMap[status] ?? '',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6?.copyWith(
              fontSize: 13,
              color: Colors.white,
            ),
      ),
    );
  }
}
