import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:municipality_app/constants/app_constants.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/attachment_type.dart';
import 'package:municipality_app/models/uploaded_file.dart';
import 'package:municipality_app/pages/success_page.dart';
import 'package:municipality_app/services/files_service.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';

class FilePreviewPage extends StatefulWidget {
  // final UploadedFile? uploadedFile;
  final AttachmentType attachmentType;
  final Function(UploadedFile?, String?) onFileChange;
  final String? base64image;
  FilePreviewPage({
    // required this.uploadedFile,
    required this.onFileChange,
    required this.base64image,
    required this.attachmentType,
  });
  @override
  State<FilePreviewPage> createState() => _FilePreviewPageState();
}

class _FilePreviewPageState extends State<FilePreviewPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ImagePicker _picker = ImagePicker();
  final FilesService _filesService = FilesService();
  String? _downloadedImageB64;
  bool _loading = true;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        if (widget.attachmentType.file != null) {
          _downloadedImageB64 = widget.base64image ??
              await _filesService.downloadFile(
                id: widget.attachmentType.file!.id.round(),
              );
        }

        setState(() {
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

  updateImage() async {
    try {
      final XFile? selectedImage =
          await _picker.pickImage(source: ImageSource.gallery);

      setState(() {
        _loading = true;
      });
      MultipartFile thedoc = await MultipartFile.fromFile(
        selectedImage?.path ?? '',
        filename: selectedImage?.name,
      );

      String base64Image =
          base64Encode(await selectedImage?.readAsBytes() ?? []);
      UploadedFile? newFile;
      if (widget.attachmentType.file != null &&
          widget.attachmentType.file?.id != null) {
        newFile = await _filesService.updateUserAttachment(
          id: widget.attachmentType.file!.id,
          thedoc: thedoc,
        );
      } else {
        newFile = await _filesService.uploadUserAttachment(
          thedoc: thedoc,
          attachmentName: selectedImage?.name ?? '',
          attachmentTypeId: widget.attachmentType.id,
        );
      }

      widget.onFileChange(newFile, base64Image);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SuccessPage(
            showBack: true,
            ctaButtonText: I18n.of(context)!.back_to_home_screen,
            ctaButtonOnClick: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
            successMessage: I18n.of(context)!.file_updated_successfully,
            appBarTitle: widget.attachmentType.name,
          ),
        ),
      );
    } catch (e) {}
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
        title: widget.attachmentType.name,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 50,
                  left: 36,
                  right: 36,
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: _downloadedImageB64 != null
                          ? Image.memory(
                              base64Decode(_downloadedImageB64!),
                              height: 304,
                              width: 304,
                              fit: BoxFit.fill,
                            )
                          : Image.asset(
                              'assets/images/image_loading_placeholder.jpeg',
                              height: 304,
                              width: 304,
                              fit: BoxFit.fill,
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            I18n.of(context)!.date_added,
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      fontSize: 13.0,
                                      color: Color(0xFF6B6B6B),
                                    ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            formatter.format(DateTime.now()),
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      fontSize: 13.0,
                                      color: Color(0xFF6B6B6B),
                                    ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: updateImage,
                      child: Text(
                        I18n.of(context)!.update_photo,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: 17.0,
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
