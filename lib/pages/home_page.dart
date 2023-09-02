import 'package:flutter/material.dart';
import 'package:municipality_app/change_notifiers/requests_change_notifier.dart';
import 'package:municipality_app/change_notifiers/service_change_notifier.dart';

import 'package:municipality_app/constants/routes.dart';
import 'package:municipality_app/models/service_model.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/request.dart';
import 'package:municipality_app/utils/snackbar.dart';

import 'package:municipality_app/widgets/home_page/homepage_header.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

import 'package:municipality_app/widgets/request_card.dart';

import 'package:municipality_app/widgets/service_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ServiceModel> _servicesList = ServiceModel.generateEmpty(6);
  List<Request> _requestsList = [];

  late ScrollController _controller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        dynamic results = await Future.wait([
          context.read<ServicesChangeNotifier>().loadServices(),
          context.read<RequestsChangeNotifier>().loadRequests(),
        ]);
        List<ServiceModel>? servicesList = results[0];
        List<Request>? ordersList = results[1];

        setState(() {
          _servicesList = servicesList ?? [];
          _requestsList = ordersList ?? [];
        });
      } catch (exp) {
        SnackbarUtil.showSnackbar(context, message: 'error fetching data');
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawerWidget(
        scaffoldKey: _scaffoldKey,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: MainAppBarWidget(
        scaffoldKey: _scaffoldKey,
        showBack: false,
        title: I18n.of(context)!.home,
      ),
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: height * 0.02)),
              SliverToBoxAdapter(child: HomepageHeaderWidget()),
              SliverToBoxAdapter(child: SizedBox(height: 54)),
              SliverList(
                delegate: SliverChildListDelegate(List.generate(
                    _servicesList.length >= 6 ? 6 : _servicesList.length,
                    (index) {
                  final service = _servicesList[index];
                  return ServiceCard(
                    service: service,
                  );
                }).toList()),
              ),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(Routes.SERVICES_LIST),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                    child: Text(
                      I18n.of(context)!.other_services,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: const Color(0xffe96565),
                            fontSize: 17.0,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    I18n.of(context)!.my_requests,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          fontSize: 22.0,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                    List.generate(_requestsList.length, (index) {
                  return RequestCard(
                    request: _requestsList[index],
                  );
                }).toList()),
              ),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(Routes.REQUESTS),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        I18n.of(context)!.show_more,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: 17.0,
                              color: Color(0xFF686767),
                            ),
                      ),
                      Icon(
                        Icons.add,
                        color: Color(0xFF686767),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
