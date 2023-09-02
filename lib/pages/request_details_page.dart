import 'package:flutter/material.dart';
import 'package:municipality_app/common/widgets/buttons/cta_button.dart';
import 'package:municipality_app/constants/app_constants.dart';
import 'package:municipality_app/constants/routes.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/request.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';
import 'package:municipality_app/widgets/request_progress_stepper.dart';
import 'package:municipality_app/widgets/status_badge.dart';

class RequestDetailsPage extends StatefulWidget {
  final Request request;
  RequestDetailsPage({required this.request});
  @override
  State<RequestDetailsPage> createState() => _RequestDetailsPageState();
}

class _RequestDetailsPageState extends State<RequestDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget wrapWidget({
    required Widget child,
    double paddingTop = 10,
    Color borderColor = const Color(0xFFC4C4C4),
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        bottom: 10,
        top: paddingTop,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      child: child,
    );
  }

  Widget getTitleValuePair({
    required String title,
    required String value,
  }) {
    return wrapWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                Theme.of(context).textTheme.headline6?.copyWith(fontSize: 17),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: 14,
                  color: Color(0xFF565656),
                ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawerWidget(
        scaffoldKey: _scaffoldKey,
      ),
      key: _scaffoldKey,
      appBar: MainAppBarWidget(
        scaffoldKey: _scaffoldKey,
        title: widget.request.service.getName(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                wrapWidget(
                  paddingTop: 40,
                  borderColor: Color(0xFF676767),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(),
                      ),
                      StatusBadgeWidget(
                        status: widget.request.requestProgress.finalStatusEn
                                    ?.toLowerCase() ==
                                'approved'
                            ? RequestStatus.APPROVED
                            : widget.request.requestProgress.finalStatusEn
                                        ?.toLowerCase() ==
                                    'in progress'
                                ? RequestStatus.IN_PROGRESS
                                : RequestStatus.REJECTED,
                      ),
                    ],
                  ),
                ),
                getTitleValuePair(
                  title: I18n.of(context)!.applying_date,
                  value: widget.request.dateSubmitted != null
                      ? formatter.format(
                          widget.request.dateSubmitted ?? DateTime.now())
                      : '-',
                ),
                getTitleValuePair(
                  title: I18n.of(context)!.expected_deadline,
                  value: widget.request.dateEnd != null
                      ? formatter
                          .format(widget.request.dateEnd ?? DateTime.now())
                      : '-',
                ),
                wrapWidget(
                  borderColor: Color(0xFF565656),
                  child: Text(
                    I18n.of(context)!.request_tracking,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: 22, color: Colors.black),
                  ),
                ),
                wrapWidget(
                  child: RequestProgressStepperWidget(
                      progress: widget.request.requestProgress),
                ),
                // CTAButton(
                //   label: I18n.of(context)!.pay_fees,
                //   mainColor: Theme.of(context).primaryColor,
                //   height: 45,
                //   onPressed: () =>
                //       Navigator.of(context).pushNamed(Routes.PAYMENT_METHODS),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Text(
                    I18n.of(context)!.report_issue_in_request,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          fontSize: 14,
                          color: Color(0xFF636363),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
