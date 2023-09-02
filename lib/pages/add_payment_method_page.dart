import 'package:flutter/material.dart';
import 'package:municipality_app/common/widgets/buttons/cta_button.dart';
import 'package:municipality_app/constants/routes.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/payment_method.dart';
import 'package:municipality_app/pages/success_page.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';
import 'package:municipality_app/widgets/payment_method_dropdown.dart';

class AddPaymentMethodPage extends StatefulWidget {
  @override
  State<AddPaymentMethodPage> createState() => _AddPaymentMethodPageState();
}

class _AddPaymentMethodPageState extends State<AddPaymentMethodPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, dynamic> _inputValues = {
    'card_expiry_year': DateTime.now().year,
    'card_expiry_month': DateTime.now().month,
    'payment_method': PaymentMethodType.MASTERCARD,
  };
  List<String> _monthsList =
      List<String>.generate(12, (i) => (i + 1).toString());
  List<String> _yearsList =
      List<String>.generate(10, (i) => (DateTime.now().year + i).toString());

  Widget _getTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.caption?.copyWith(
            fontSize: 17.0,
          ),
      textAlign: TextAlign.right,
    );
  }

  Widget _getTextField({
    required String hint,
    TextAlign textAlign = TextAlign.start,
    required String valueKey,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFB0B0B0),
          ),
        ),
      ),
      child: TextField(
        onChanged: (String value) {
          setState(() {
            _inputValues[valueKey] = value;
          });
        },
        cursorHeight: 18,
        textAlign: textAlign,
        cursorColor: Color(0xFFB0B0B0),
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFFB0B0B0),
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Color(0xFFB0B0B0),
          ),
          contentPadding: EdgeInsets.only(bottom: 1),
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }

  Widget _getDropdownButton({
    required String value,
    required List<String> values,
    required Function(String?) onChanged,
  }) {
    return DropdownButton<String>(
      value: value,
      iconSize: 0,
      elevation: 16,
      alignment: Alignment.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      underline: Container(
        height: 2,
        color: Color(0xFFD2D2D2),
      ),
      onChanged: onChanged,
      items: values.map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
          value: value.toString(),
          child: Text(
            value,
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }

  Widget _getYearSelector() {
    return _getDropdownButton(
      value: _inputValues['card_expiry_year'].toString(),
      values: _yearsList,
      onChanged: (dynamic newValue) {
        setState(() {
          _inputValues['card_expiry_year'] = int.parse(newValue);
          setState(() {});
        });
      },
    );
  }

  Widget _getMonthSelector() {
    return _getDropdownButton(
      value: _inputValues['card_expiry_month'].toString(),
      values: _monthsList,
      onChanged: (dynamic newValue) {
        _inputValues['card_expiry_month'] = int.parse(newValue);
        setState(() {});
      },
    );
  }

  void addCardOnClick() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SuccessPage(
          appBarTitle: I18n.of(context)!.add_card,
          successMessage:
              I18n.of(context)!.card_added_and_validated_successfully,
          ctaButtonText: I18n.of(context)!.back_to_home_screen,
          ctaButtonOnClick: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
        ),
      ),
    );
  }

  void connectToJawwal() {
    Navigator.of(context).pushNamed(Routes.REDIRECTING_TO_JAWWAL);
  }

  List<Widget> _getAdditionalFields() {
    switch (_inputValues['payment_method']) {
      case PaymentMethodType.MASTERCARD:
      case PaymentMethodType.VISA:
        return [
          SliverToBoxAdapter(
            child: _getTitle(I18n.of(context)!.card_number),
          ),
          SliverToBoxAdapter(
            child: _getTextField(
              hint: 'xxxx-xxxx-xxx-xxxx',
              valueKey: 'card_number',
            ),
          ),
          SliverToBoxAdapter(
            child: _getTitle(I18n.of(context)!.cardholder_name),
          ),
          SliverToBoxAdapter(
            child: _getTextField(
              hint: 'xxxxxx xxxx xxxx xxxxx',
              valueKey: 'cardholder_name',
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30,
              ),
              child: Row(
                children: [
                  _getTitle(I18n.of(context)!.expiration_date),
                  SizedBox(
                    width: 15,
                  ),
                  _getMonthSelector(),
                  SizedBox(
                    width: 15,
                  ),
                  _getYearSelector(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30,
              ),
              child: Row(
                children: [
                  _getTitle(I18n.of(context)!.card_verification_value),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 60,
                    child: Center(
                      child: _getTextField(
                        hint: 'xxx',
                        textAlign: TextAlign.center,
                        valueKey: 'cvv',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 64, vertical: 16),
              child: Text(
                I18n.of(context)!.credit_card_verification_with_provider,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CTAButton(
              height: 45,
              label: I18n.of(context)!.add_card,
              mainColor: Theme.of(context).primaryColor,
              onPressed: addCardOnClick,
            ),
          ),
        ];
      case PaymentMethodType.JAWALPAY:
        return [
          SliverToBoxAdapter(
            child: CTAButton(
              height: 45,
              label: I18n.of(context)!.start_connecting_with_jawwal,
              mainColor: Theme.of(context).primaryColor,
              onPressed: connectToJawwal,
            ),
          ),
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawerWidget(
        scaffoldKey: _scaffoldKey,
      ),
      appBar: MainAppBarWidget(
        scaffoldKey: _scaffoldKey,
        title: I18n.of(context)!.payments_methods,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 30,
            left: 16,
            right: 16,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: Image.asset(
                    'assets/images/credit_card.png',
                    width: 273,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _getTitle(I18n.of(context)!.payment_method),
              ),
              SliverToBoxAdapter(
                child: PaymentMethodDropdown(
                  value: _inputValues['payment_method'],
                  onChanged: (PaymentMethodType? value) {
                    setState(() {
                      _inputValues['payment_method'] = value;
                    });
                  },
                ),
              ),
              ..._getAdditionalFields()
            ],
          ),
        ),
      ),
    );
  }
}
