import 'package:flutter/material.dart';
import 'package:municipality_app/common/widgets/buttons/cta_button.dart';
import 'package:municipality_app/common/widgets/buttons/cta_loading_button.dart';
import 'package:municipality_app/common/widgets/input/custom_input_text.dart';
import 'package:municipality_app/constants/routes.dart';

import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/service_field_model.dart';
import 'package:municipality_app/models/service_input.dart';
import 'package:municipality_app/models/user.dart';
import 'package:municipality_app/pages/success_page.dart';
import 'package:municipality_app/services/services_service.dart';
import 'package:municipality_app/utils/snackbar.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';
import 'package:municipality_app/widgets/service/service_check_box_field.dart';
import 'package:municipality_app/widgets/service/service_date_field.dart';
import 'package:municipality_app/widgets/service/service_document_field.dart';
import 'package:municipality_app/widgets/service/service_drop_down_field.dart';
import 'package:provider/provider.dart';

import '../models/service_model.dart';

class ServiceDetailsPage extends StatefulWidget {
  final double serviceId;
  ServiceDetailsPage(this.serviceId);
  @override
  State<StatefulWidget> createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  ServiceModel? _serviceDetails;
  bool _loading = false;
  bool _mainLoading = true;
  late ServicesService _servicesService;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Map<double, ServiceInput> _inputs = {};
  @override
  void initState() {
    _servicesService = ServicesService();
    Future.delayed(Duration.zero, () async {
      try {
        _mainLoading = true;
        _serviceDetails =
            await _servicesService.getServiceDetails(widget.serviceId);
      } catch (exp) {}
      _mainLoading = false;

      setState(() {});
    });

    super.initState();
  }

  void onChange({
    required double key,
    required dynamic value,
    dynamic attachment,
  }) {
    ServiceInput current = _inputs[key] ??
        ServiceInput(
          inputFieldId: key,
          attachment: attachment,
          valueString: value,
        );
    current.valueString = value;
    current.attachment = attachment;
    _inputs[key] = current;
    setState(() {
      _inputs = {..._inputs};
    });
  }

  bool missingInputs() {
    for (int index = 0;
        index < _serviceDetails!.serviceFields.length;
        index++) {
      if (_serviceDetails!.serviceFields[index].requiredField &&
          _inputs[_serviceDetails!.serviceFields[index].fieldReference] ==
              null) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(context) {
    return GestureDetector(
      child: Scaffold(
        drawer: MenuDrawerWidget(
          scaffoldKey: _scaffoldKey,
        ),
        key: _scaffoldKey,
        appBar: MainAppBarWidget(
          scaffoldKey: _scaffoldKey,
          title: _serviceDetails?.getName(context) ?? '',
        ),
        body: _mainLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              I18n.of(context)!.service_details,
                              style: const TextStyle(
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Cairo",
                                fontStyle: FontStyle.normal,
                                fontSize: 22.0,
                              ),
                            ),
                            Container(
                                width: double.infinity,
                                height: 1,
                                decoration: BoxDecoration(
                                    color: const Color(0xff000000))),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(top: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                I18n.of(context)!.executing_party,
                                style: const TextStyle(
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Cairo",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 17.0,
                                ),
                              ),
                              Text(
                                _serviceDetails?.category?.getName(context) ??
                                    '',
                                style: const TextStyle(
                                  color: const Color(0xff787878),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Cairo",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13.0,
                                ),
                              ),
                              Container(
                                  width: double.infinity,
                                  height: 1,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff909090))),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                I18n.of(context)!.time_needed_for_processing,
                                style: const TextStyle(
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Cairo",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 17.0),
                              ),
                              Text(
                                "${_serviceDetails?.responseDays?.toInt()}  يوم ",
                                style: const TextStyle(
                                    color: const Color(0xff787878),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Cairo",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13.0),
                              ),
                              Container(
                                  width: double.infinity,
                                  height: 1,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff909090))),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                I18n.of(context)!.required_fees,
                                style: const TextStyle(
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Cairo",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 17.0,
                                ),
                              ),
                              Text(
                                  "- ${_serviceDetails?.fee?.toInt()} ${_serviceDetails?.currencyRate?.getName(context)}",
                                  style: const TextStyle(
                                      color: const Color(0xff787878),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Cairo",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 13.0),
                                  textAlign: TextAlign.start),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                I18n.of(context)!.documents_needed_to_open_file,
                                style: const TextStyle(
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Cairo",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 22.0),
                                textAlign: TextAlign.start,
                              ),
                              Container(
                                width: double.infinity,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: SizedBox(
                        height: 24,
                      )),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          List.generate(
                              _serviceDetails?.serviceFields.length ?? 0,
                              (index) {
                            final ServiceFieldModel field =
                                _serviceDetails!.serviceFields[index];
                            final name = field.fieldName ?? '';
                            switch (field.fieldType) {
                              case 'Document':
                                return ServiceDocumentField(
                                  field: field,
                                  onChange: onChange,
                                  value: _inputs[field.fieldReference],
                                );
                              case 'CheckBox':
                                return ServiceCheckBoxField(
                                  field: field,
                                  onChange: onChange,
                                  value: _inputs[field.fieldReference]
                                      ?.valueString,
                                );
                              case 'Date':
                                return ServiceDateField(
                                  field: field,
                                  onChange: onChange,
                                  value: _inputs[field.fieldReference]
                                      ?.valueString,
                                );
                              case 'Text Or Lookup':
                                if (field.isLookup) {
                                  return ServiceDropdownField(
                                    field: field,
                                    onChange: onChange,
                                    inputs: _inputs,
                                    value: _inputs[field.fieldReference]
                                        ?.valueString,
                                  );
                                } else {
                                  return Card(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(right: 16, left: 16),
                                      child: CustomInputText(
                                        hintText: field.getName(context) +
                                            (field.requiredField ? '*' : ''),
                                        onChange: (String value) => onChange(
                                          key: field.fieldReference ?? -1,
                                          value: value,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              case 'Number':
                                return Card(
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 16, left: 16),
                                    child: CustomInputText(
                                      keyboardType: TextInputType.number,
                                      hintText: field.getName(context) +
                                          (field.requiredField ? '*' : ''),
                                      onChange: (String value) => onChange(
                                        key: field.fieldReference ?? -1,
                                        value: value,
                                      ),
                                    ),
                                  ),
                                );
                              default:
                                return Card(
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 16, left: 16),
                                    child: CustomInputText(
                                      hintText: field.getName(context) +
                                          (field.requiredField ? '*' : ''),
                                      onChange: (String value) => onChange(
                                        key: field.fieldReference ?? -1,
                                        value: value,
                                      ),
                                    ),
                                  ),
                                );
                            }
                          }).toList(),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(height: 24),
                      ),
                      SliverToBoxAdapter(
                        child: CTALoadingButton(
                          isCompleteAction: !_loading,
                          label: I18n.of(context)!.submit_request,
                          mainColor: Theme.of(context).primaryColor,
                          textStyle: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(color: Colors.white),
                          onPressed: missingInputs() ||
                                  !context.read<User>().isapproved
                              ? null
                              : () async {
                                  setState(() {
                                    _loading = true;
                                  });
                                  dynamic response = await _servicesService
                                      .submitRequest(widget.serviceId, _inputs);

                                  if (response != null) {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => SuccessPage(
                                          appBarTitle: _serviceDetails
                                                  ?.getName(context) ??
                                              '',
                                          successMessage: I18n.of(context)!
                                              .request_submitted_please_go_to_center,
                                          ctaButtonText: I18n.of(context)!
                                              .back_to_home_screen,
                                          ctaButtonOnClick: () =>
                                              Navigator.of(context).popUntil(
                                                  (route) => route.isFirst),
                                        ),
                                      ),
                                    );
                                  } else {
                                    setState(() {
                                      _loading = false;
                                    });
                                    SnackbarUtil.showSnackbar(context,
                                        message: I18n.of(context)!
                                            .there_was_an_issue_try_again_later);
                                  }
                                },
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
