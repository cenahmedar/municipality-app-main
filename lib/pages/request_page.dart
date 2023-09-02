import 'package:flutter/material.dart';
import 'package:municipality_app/common/widgets/buttons/cta_button.dart';
import 'package:municipality_app/common/widgets/buttons/cta_loading_button.dart';
import 'package:municipality_app/common/widgets/input/custom_input_text.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/pages/success_page.dart';
import 'package:municipality_app/services/suggestions_complaints_service.dart';
import 'package:municipality_app/utils/snackbar.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';
import 'package:validators/validators.dart';

class RequestPage extends StatefulWidget {
  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SuggestionsComplaintsService _service = SuggestionsComplaintsService();
  bool _isLoading = false;
  TextEditingController _questionController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  String? _missingDataMessage() {
    if (_questionController.text.trim() == '' ||
        _nameController.text.trim() == '' ||
        (_emailController.text.trim() == '' &&
            _phoneController.text.trim() == ''))
      return I18n.of(context)!.missing_inputs;

    if (!isEmail(_emailController.text)) {
      return I18n.of(context)!.invalid_email;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawerWidget(
        scaffoldKey: _scaffoldKey,
      ),
      appBar: MainAppBarWidget(
        title: I18n.of(context)!.questions_requests,
        scaffoldKey: _scaffoldKey,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 35,
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 35,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomInputText(
                  title: I18n.of(context)!.What_your_question_request,
                  hintText: I18n.of(context)!.write_here,
                  controller: _questionController,
                  maxLines: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomInputText(
                  title: I18n.of(context)!.full_name,
                  hintText: 'xxxx xxxx xxxx xxxx',
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomInputText(
                  title: I18n.of(context)!.phone_number,
                  keyboardType: TextInputType.phone,
                  hintText: 'xxxxxxxxxx',
                  controller: _phoneController,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomInputText(
                  title: I18n.of(context)!.email,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'xxxxxxx@xx.xx',
                  controller: _emailController,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 25,
                ),
              ),
              SliverToBoxAdapter(
                child: CTALoadingButton(
                  label: I18n.of(context)!.submit_question_request,
                  mainColor: Theme.of(context).primaryColor,
                  isCompleteAction: !_isLoading,
                  textStyle: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: Colors.white),
                  onPressed: () async {
                    String? _checkMessage = _missingDataMessage();
                    if (_checkMessage != null) {
                      setState(() {
                        _isLoading = false;
                      });
                      SnackbarUtil.showSnackbar(context,
                          message: _checkMessage);
                      return;
                    }

                    Map<String, String> _inputs = {
                      "Text": _questionController.text,
                      "Email": _emailController.text,
                      "PublicName": _nameController.text,
                      "Telephone": _phoneController.text,
                    };
                    dynamic response =
                        await _service.submitQuestionOrRequest(_inputs);

                    setState(() {
                      _isLoading = false;
                    });
                    if (response != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => SuccessPage(
                            appBarTitle: I18n.of(context)!.submit_request,
                            ctaButtonText:
                                I18n.of(context)!.back_to_home_screen,
                            ctaButtonOnClick: () => Navigator.of(context)
                                .popUntil((route) => route.isFirst),
                            successMessage: I18n.of(context)!
                                .request_submitted_successfully,
                          ),
                        ),
                      );
                    } else {
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
    );
  }
}
