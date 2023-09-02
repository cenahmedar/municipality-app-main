import 'package:flutter/material.dart';
import 'package:municipality_app/change_notifiers/service_change_notifier.dart';
import 'package:municipality_app/change_notifiers/user_change_notifier.dart';
import 'package:municipality_app/constants/routes.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/service_model.dart';
import 'package:municipality_app/pages/service_details_page.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';
import 'package:provider/provider.dart';

class ServicesListPage extends StatefulWidget {
  @override
  State<ServicesListPage> createState() => _ServicesListPageState();
}

class _ServicesListPageState extends State<ServicesListPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = true;
  final ScrollController _controller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Map<String, List<ServiceModel>> _servicesMap = {};
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        List<ServiceModel>? servicesList =
            await context.read<ServicesChangeNotifier>().loadServices();
        Map<String, List<ServiceModel>> servicesMap = {};
        servicesList?.forEach((ServiceModel element) {
          String category = element.category?.getName(context) ?? "";
          List<ServiceModel> current = servicesMap[category] ?? [];
          current.add(element);
          servicesMap[category] = current;
        });
        setState(() {
          _servicesMap = servicesMap;
          _loading = false;
        });
      } catch (exp) {
        setState(() {
          _loading = false;
        });
      }
    });

    super.initState();
  }

  Widget _getSubTitle(
    String text,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      margin: EdgeInsets.only(
        right: 10,
        left: 10,
        top: 12,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.caption?.copyWith(
              color: Theme.of(context).primaryColor,
              fontSize: 22.0,
            ),
      ),
    );
  }

  Widget _getTitle() {
    return Text(
      I18n.of(context)!.services,
      style: Theme.of(context).textTheme.caption?.copyWith(
            fontSize: 34.0,
            fontWeight: FontWeight.w700,
          ),
    );
  }

  Widget _getSettingsItem({
    required String text,
    required VoidCallback onClick,
  }) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Text(
                text,
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontSize: 17,
                    ),
              ),
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }

  List<Widget> getChildren() {
    List<Widget> children = [];
    _servicesMap.forEach((key, services) {
      children.addAll([
        _getSubTitle(key),
        ...services.map((ServiceModel service) => _getSettingsItem(
              text: service.getName(context),
              onClick: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ServiceDetailsPage(service.id ?? 0),
                  ),
                )
              },
            )),
      ]);
    });

    return children;
  }

  @override
  Widget build(context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawerWidget(
        scaffoldKey: _scaffoldKey,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: MainAppBarWidget(
        scaffoldKey: _scaffoldKey,
        title: I18n.of(context)!.services,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: _loading
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  controller: _controller,
                  physics: BouncingScrollPhysics(),
                  children: getChildren(),
                ),
        ),
      ),
    );
  }
}
