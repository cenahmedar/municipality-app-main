import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:municipality_app/constants/app_constants.dart';

import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/main/main.dart';
import 'package:municipality_app/models/request.dart';
import 'package:municipality_app/pages/request_details_page.dart';
import 'package:municipality_app/widgets/status_badge.dart';
import 'dart:math' as math; // import this

class RequestCard extends StatelessWidget {
  final Request request;
  final Function(Request)? onRequestClicked;
  const RequestCard({
    Key? key,
    this.onRequestClicked,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRequestClicked != null
          ? () => onRequestClicked!(request)
          : () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RequestDetailsPage(request: request),
                ),
              ),
      child: Container(
        height: 95,
        width: 343,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 15.0,
              spreadRadius: 0.1,
            )
          ],
        ),
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 22,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    request.service.getName(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                  ),
                ),
                StatusBadgeWidget(
                  status: RequestStatus.IN_PROGRESS,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "${I18n.of(context)!.applying_date}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      formatter.format(request.dateSubmitted ?? DateTime.now()),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      I18n.of(context)!.more_details,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 13,
                            color: Color(0xFF545454),
                            fontStyle: FontStyle.normal,
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform:
                          MunicipalityApp.of(context)!.locale.languageCode ==
                                  'en'
                              ? Matrix4.rotationY(math.pi)
                              : Matrix4.rotationY(0),
                      child: SvgPicture.asset('assets/icons/details.svg'),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
