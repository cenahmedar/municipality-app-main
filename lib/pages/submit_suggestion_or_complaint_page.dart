import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipality_app/common/widgets/buttons/cta_loading_button.dart';
import 'package:municipality_app/common/widgets/input/custom_input_text.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/suggestion_or_complaint_model.dart';
import 'package:municipality_app/pages/success_page.dart';
import 'package:municipality_app/services/suggestions_complaints_service.dart';
import 'package:municipality_app/utils/snackbar.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

class SuggestionOrComplaintPage extends StatefulWidget {
  @override
  _SuggestionOrComplaintPageState createState() =>
      _SuggestionOrComplaintPageState();
}

class _SuggestionOrComplaintPageState extends State<SuggestionOrComplaintPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  XFile? _image;
  SuggestionsComplaintsService _service = SuggestionsComplaintsService();
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _textTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _addressTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  bool _loading = false;

  bool missingData() {
    return _textTextEditingController.text.trim() == '' &&
        _addressTextEditingController.text.trim() == '';
  }

  @override
  Widget build(context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawerWidget(
        scaffoldKey: _scaffoldKey,
      ),
      appBar: MainAppBarWidget(
        scaffoldKey: _scaffoldKey,
        title: I18n.of(context)!.suggestion_or_complaint,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 35,
                ),
              ),
              SliverToBoxAdapter(
                  child: GestureDetector(
                onTap: () async {
                  try {
                    final selectedImage =
                        await _picker.pickImage(source: ImageSource.gallery);

                    setState(() {
                      _image = selectedImage;
                    });
                  } catch (e) {}
                },
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (_image != null
                          ? Container(
                              child: Image.file(File(_image!.path)),
                              height: height * 0.3,
                            )
                          : Container(
                              child: SvgPicture.asset(
                                'assets/icons/upload_image.svg',
                              ),
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                            )),
                      Text(
                        I18n.of(context)!.add_photo,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            color: const Color(0xff000000), fontSize: 17.0),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        I18n.of(context)!.add_photo_description,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            color: const Color(0xff9b9b9b), fontSize: 14.0),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              )),
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 35,
              )),
              SliverToBoxAdapter(
                child: CustomInputText(
                  title: I18n.of(context)!.add_details_suggestion_or_complaint,
                  hintText: I18n.of(context)!.write_here,
                  maxLines: 10,
                  controller: _textTextEditingController,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomInputText(
                  title: I18n.of(context)!.add_address_details,
                  hintText: I18n.of(context)!.write_here,
                  maxLines: 10,
                  controller: _addressTextEditingController,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomInputText(
                  hintText: I18n.of(context)!.full_name,
                  controller: _nameTextEditingController,
                  keyboardType: TextInputType.name,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomInputText(
                  hintText: I18n.of(context)!.phone_number,
                  controller: _phoneTextEditingController,
                  keyboardType: TextInputType.phone,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomInputText(
                  hintText: I18n.of(context)!.email,
                  controller: _emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 25,
                ),
              ),
              SliverToBoxAdapter(
                child: CTALoadingButton(
                  label: I18n.of(context)!.submit_suggestion_or_complaint,
                  mainColor: Theme.of(context).primaryColor,
                  isCompleteAction: !_loading,
                  textStyle: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: Colors.white),
                  onPressed: () async {
                    if (missingData()) {
                      SnackbarUtil.showSnackbar(context,
                          message: I18n.of(context)!.missing_inputs);
                      setState(() {
                        _loading = false;
                      });
                      return;
                    }

                    setState(() {
                      _loading = true;
                    });
                    Map<String, dynamic> _values = {
                      "Text": _textTextEditingController.text,
                      "Email": _emailTextEditingController.text,
                      "PublicName": _nameTextEditingController.text,
                      "Telephone": _phoneTextEditingController.text,
                      "HazardLocation": _addressTextEditingController.text,
                      "RequestDate": DateTime.now(),
                      "Thedoc": _image != null
                          ? await MultipartFile.fromFile(
                              _image?.path ?? '',
                              filename: _image?.name,
                            )
                          : null,
                    };

                    SuggestionOrComplaint? suggestionOrComplaint =
                        await _service.submitSuggestionOrComplaint(_values);
                    if (suggestionOrComplaint != null) {
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
