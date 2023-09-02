import 'package:flutter/material.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/pages/success_page.dart';
import 'package:municipality_app/services/technical_issues_service.dart';
import 'package:municipality_app/utils/snackbar.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';
import 'package:municipality_app/widgets/technical_support_card.dart';

class ReportAProblemPage extends StatefulWidget {
  final double requestId;
  ReportAProblemPage({required this.requestId});
  @override
  State<ReportAProblemPage> createState() => _ReportAProblemPageState();
}

class _ReportAProblemPageState extends State<ReportAProblemPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TechnicalIssuesService _service = TechnicalIssuesService();

  void onClick({required double typeId}) async {
    bool success = await _service.submitTechnicalIssueTicket(
        requestId: widget.requestId, typeId: typeId);
    if (success) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SuccessPage(
            ctaButtonText: I18n.of(context)!.back_to_home_screen,
            ctaButtonOnClick: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
            successMessage: I18n.of(context)!
                .request_sent_successfully_you_will_be_contacted_asap,
            appBarTitle: I18n.of(context)!.report_a_problem,
          ),
        ),
      );
    } else {
      SnackbarUtil.showSnackbar(context, message: 'Error submitting report');
    }
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
        title: I18n.of(context)!.report_a_problem,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Text(
                  I18n.of(context)!.what_is_the_problem_you_are_facing,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                ),
              ),
              TechnicalSupportCardWidget(
                text: I18n.of(context)!.did_not_respond_on_request,
                onClick: () => onClick(typeId: 1),
              ),
              TechnicalSupportCardWidget(
                text: I18n.of(context)!.there_is_an_issue_in_payment,
                onClick: () => onClick(typeId: 1),
              ),
              TechnicalSupportCardWidget(
                text: I18n.of(context)!.request_took_longer_then_expected,
                onClick: () => onClick(typeId: 1),
              ),
              TechnicalSupportCardWidget(
                text: I18n.of(context)!.other_problem,
                onClick: () => onClick(typeId: 1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
