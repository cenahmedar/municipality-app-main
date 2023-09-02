import 'package:flutter/material.dart';
import 'package:municipality_app/change_notifiers/requests_change_notifier.dart';
import 'package:municipality_app/constants/routes.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/request.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';
import 'package:municipality_app/widgets/request_card.dart';
import 'package:provider/provider.dart';

class RequestsPage extends StatefulWidget {
  final Function(Request)? onRequestClicked;
  RequestsPage({
    this.onRequestClicked,
  });

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Request> _requestsList = [];
  bool _loading = true;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        List<Request>? requestsList =
            await context.read<RequestsChangeNotifier>().loadRequests();
        _loading = false;
        _requestsList = requestsList ?? [];
      } catch (exp) {
        _loading = false;
      }
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawerWidget(
        scaffoldKey: _scaffoldKey,
      ),
      appBar: MainAppBarWidget(
        scaffoldKey: _scaffoldKey,
        title: I18n.of(context)!.my_requests,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Container(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        List.generate(
                          _requestsList.length,
                          (index) => RequestCard(
                            onRequestClicked: widget.onRequestClicked,
                            request: _requestsList[index],
                          ),
                        ).toList(),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(Routes.SERVICES_LIST),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              I18n.of(context)!.new_request,
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
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
