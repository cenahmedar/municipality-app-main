import 'dart:async';

import 'package:flutter/material.dart';

// import 'package:municipality_app/generated/i18n.dart';
// import 'package:municipality_app/pages/success_page.dart';
import 'package:municipality_app/services/bills_service.dart';

import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class JawwalPayPage extends StatefulWidget {
  final String paymentKey;
  final String? invoiceNo;
  final String? ptId;
  JawwalPayPage({
    required this.paymentKey,
    this.invoiceNo,
    this.ptId,
  });

  @override
  State<JawwalPayPage> createState() => _JawwalPayPageState();
}

class _JawwalPayPageState extends State<JawwalPayPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final BillsService _billsService = BillsService();
  bool _loading = true;
  final String checkoutUrl =
      "https://checkout.jawwalpay.ps/api/acceptance/iframes/386564?payment_token=";
  Timer? _timer;
  Duration _pollingDuration = Duration(seconds: 5);

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
    }
    super.dispose();
  }

  // void _onPageLoaded(_) {
  //   setState(() {
  //     _loading = false;
  //   });
  //   _timer = Timer(
  //     _pollingDuration,
  //     _fetchStatus,
  //   );
  // }

  // void _fetchStatus() async {
  //   bool? isPaid;
  //   if (widget.invoiceNo != null) {
  //     isPaid = await _billsService.checkIfInvoiceIsPaid(widget.invoiceNo!);
  //   } else if (widget.ptId != null) {
  //     isPaid = await _billsService.checkIfTaxIsPaid(widget.ptId!);
  //   }
  //   if (isPaid == true) {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => SuccessPage(
  //           successMessage: I18n.of(context)!.payment_executed_successfully,
  //           ctaButtonText: I18n.of(context)!.back_to_home_screen,
  //           ctaButtonOnClick: () =>
  //               Navigator.of(context).popUntil((route) => route.isFirst),
  //           appBarTitle: 'Jawwal Pay',
  //         ),
  //       ),
  //     );
  //   }

  //   _timer = Timer(
  //     _pollingDuration,
  //     _fetchStatus,
  //   );
  // }

  @override
  Widget build(context) {
    String currentPaymentUrl = checkoutUrl + widget.paymentKey;
    return Scaffold(
      appBar: MainAppBarWidget(
        scaffoldKey: _scaffoldKey,
        showBack: true,
        title: 'Jawwal Pay',
      ),
      drawer: MenuDrawerWidget(
        scaffoldKey: _scaffoldKey,
      ),
      body: Stack(
        children: [
          WebView(
            javascriptMode: JavascriptMode.unrestricted,
            // onPageFinished: _onPageLoaded,
            initialUrl: currentPaymentUrl,
          ),
          _loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
