import 'package:flutter/material.dart';
import 'package:municipality_app/change_notifiers/requests_change_notifier.dart';
import 'package:municipality_app/constants/routes.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/request.dart';
import 'package:municipality_app/models/requests_list.dart';
import 'package:municipality_app/pages/report_a_problem_page.dart';

import 'package:municipality_app/pages/requests_page.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';
import 'package:municipality_app/widgets/technical_support_card.dart';
import 'package:provider/provider.dart';

class TechnicalSupportPage extends StatefulWidget {
  @override
  State<TechnicalSupportPage> createState() => _TechnicalSupportPageState();
}

class _TechnicalSupportPageState extends State<TechnicalSupportPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Request> _requests = context.read<RequestsList>().list;
    bool _requestsExist = _requests != null && _requests.isNotEmpty;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: MenuDrawerWidget(
        scaffoldKey: _scaffoldKey,
      ),
      appBar: MainAppBarWidget(
        scaffoldKey: _scaffoldKey,
        title: I18n.of(context)!.support,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 30,
          ),
          child: Column(
            children: [
              _requestsExist
                  ? TechnicalSupportCardWidget(
                      text: I18n.of(context)!.report_problem_in_last_request,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ReportAProblemPage(
                              requestId: _requests[0].serviceFormSeq,
                            ),
                          ),
                        );
                      })
                  : SizedBox(),
              _requestsExist
                  ? TechnicalSupportCardWidget(
                      text:
                          I18n.of(context)!.report_problem_in_an_other_request,
                      onClick: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RequestsPage(
                                onRequestClicked: (Request request) {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ReportAProblemPage(
                                    requestId: request.serviceFormSeq,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      },
                    )
                  : SizedBox(),
              TechnicalSupportCardWidget(
                text: I18n.of(context)!.call_us,
                onClick: () => Navigator.of(context).pushNamed(
                  Routes.CALL_US,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
