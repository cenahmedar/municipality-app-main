import 'package:flutter/material.dart';

import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/faq.dart';

import 'package:municipality_app/services/faq_service.dart';

import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

class FAQPage extends StatefulWidget {
  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FAQService _faqService = FAQService();
  List<FAQ> _faqList = [];
  bool _loading = true;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        _faqList = await _faqService.getFAQList() ?? [];
        setState(() {
          _loading = false;
        });
      } catch (exp) {
        setState(() {
          _loading = false;
          _faqList = [];
        });
      }
    });
    super.initState();
  }

  Widget getExpansionTile(FAQ faq) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.only(bottom: 17),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(color: Color(0xFFB6C6D4))),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          iconColor: Colors.black,
          collapsedIconColor: Colors.black,
          backgroundColor: Colors.white,
          title: Container(
            child: Text(
              faq.getQuestion(context),
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(fontSize: 17.0, color: Colors.black),
            ),
          ),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(19),
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                faq.getAnswer(context),
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontSize: 13.0,
                      color: Color(0xFF848484),
                    ),
              ),
            )
          ],
        ),
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
        title: I18n.of(context)!.faq,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50,
            left: 16,
            right: 16,
          ),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) => getExpansionTile(
              _faqList[index],
            ),
            itemCount: _faqList.length,
          ),
        ),
      ),
    );
  }
}
