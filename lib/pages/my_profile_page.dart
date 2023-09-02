import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipality_app/change_notifiers/user_change_notifier.dart';
import 'package:municipality_app/common/widgets/buttons/cta_loading_button.dart';
import 'package:municipality_app/constants/routes.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/main/main.dart';
import 'package:municipality_app/models/user.dart';
import 'package:municipality_app/utils/snackbar.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class MyProfilePage extends StatefulWidget {
  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? _profileImageBytes;
  XFile? _profileImageXFile;
  final ImagePicker _picker = ImagePicker();
  bool _changed = false;
  bool _loading = false;
  _getFullName(User user) {
    if (MunicipalityApp.of(context)!.locale.languageCode == 'en') {
      return [
        user.eFirstName,
        user.eMiddleName,
        user.eGrandName,
        user.eFamilyName
      ].where((element) => element != null).join(' ');
    }
    return [
      user.aFirstName,
      user.aMiddleName,
      user.aGrandName,
      user.aFamilyName
    ].where((element) => element != null).join(' ');
  }

  uploadImage() async {
    try {
      final XFile? selectedImage =
          await _picker.pickImage(source: ImageSource.gallery);
      String base64Image =
          base64Encode(await selectedImage?.readAsBytes() ?? []);
      setState(() {
        _profileImageBytes = base64Image;
        _profileImageXFile = selectedImage;
        _changed = true;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      User user = context.read<User>();
      _idController.text = user.idCarNumber ?? '';
      _nameController.text = _getFullName(user);
      _emailController.text = user.email ?? '';
      _phoneController.text = user.mobile ?? '';
      _addressController.text = user.addressLine1 ?? '';
      _profileImageBytes = user.profilePicture ?? null;
    });
    super.initState();
  }

  Widget _getTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.caption?.copyWith(
            fontSize: 17.0,
          ),
      textAlign: TextAlign.start,
    );
  }

  Widget _getTextField({
    required TextEditingController controller,
    required String title,
    TextAlign textAlign = TextAlign.start,
    bool isEnabled = true,
    TextInputType inputType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getTitle(title),
        Container(
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFB0B0B0),
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  enabled: isEnabled,
                  controller: controller,
                  keyboardType: inputType,
                  cursorHeight: 18,
                  textAlign: textAlign,
                  onChanged: (String _) {
                    setState(() {
                      _changed = true;
                    });
                  },
                  cursorColor: Color(0xFFB0B0B0),
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFB0B0B0),
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 1),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
              isEnabled ? Icon(Icons.edit) : SizedBox(),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> submitChanges() async {
    if (_emailController.text != '' && !isEmail(_emailController.text)) {
      SnackbarUtil.showSnackbar(context,
          message: I18n.of(context)!.invalid_email);
      return;
    }

    setState(() {
      _loading = true;
    });

    User? updatedUser =
        await context.read<UserChangeNotifier>().updateUserProfile(
              user: context.read<User>(),
              profileImage: _profileImageXFile,
              email: _emailController.text,
              address: _addressController.text,
            );
    if (updatedUser != null) {
      _changed = true;
      SnackbarUtil.showSnackbar(context,
          message: I18n.of(context)!.user_updated_successfully);
    } else {
      _changed = false;

      SnackbarUtil.showSnackbar(context,
          message: I18n.of(context)!.issue_updating_user_message);
    }
    setState(() {
      _loading = false;
    });
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
        title: I18n.of(context)!.my_information,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: uploadImage,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    alignment: Alignment.center,
                    child: _profileImageBytes != null
                        ? Container(
                            key: Key(_profileImageXFile!.name),
                            height: 114,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: MemoryImage(
                                  base64Decode(_profileImageBytes!),
                                ),
                              ),
                            ),
                          )
                        : SvgPicture.asset(
                            'assets/images/empty_profile_image.svg'),
                  ),
                ),
                _getTextField(
                  title: I18n.of(context)!.full_name,
                  isEnabled: false,
                  controller: _nameController,
                ),
                _getTextField(
                  title: I18n.of(context)!.id_number,
                  isEnabled: false,
                  controller: _idController,
                ),
                _getTextField(
                  title: I18n.of(context)!.phone_number,
                  isEnabled: false,
                  controller: _phoneController,
                ),
                _getTextField(
                  title: I18n.of(context)!.email,
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                ),
                _getTextField(
                  title: I18n.of(context)!.current_living_address,
                  controller: _addressController,
                  inputType: TextInputType.streetAddress,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: _getTitle(I18n.of(context)!.change_password),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(Routes.CHANGE_PASSWORD),
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: CTALoadingButton(
                    label: I18n.of(context)!.save_changes,
                    mainColor: Theme.of(context).primaryColor,
                    onPressed: _changed ? submitChanges : null,
                    isCompleteAction: !_loading,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
