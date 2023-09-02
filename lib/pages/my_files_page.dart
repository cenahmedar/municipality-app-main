import 'package:flutter/material.dart';

import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/attachment_type.dart';
import 'package:municipality_app/models/uploaded_file.dart';

import 'package:municipality_app/services/files_service.dart';
import 'package:municipality_app/widgets/main_app_bar.dart';
import 'package:municipality_app/widgets/menu_drawer.dart';
import 'package:municipality_app/widgets/my_files_card.dart';

class MyFilesPage extends StatefulWidget {
  @override
  State<MyFilesPage> createState() => _MyFilesPageState();
}

class _MyFilesPageState extends State<MyFilesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<UploadedFile> _uploadedFiles = [];
  List<AttachmentType> _attachmentTypes = [];

  FilesService _filesService = FilesService();
  bool _loading = true;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        dynamic result = await Future.wait([
          _filesService.getUserAttachments(),
          _filesService.getAttachmentTypes()
        ]);
        _uploadedFiles = result[0] ?? [];
        _attachmentTypes = result[1] ?? [];
        _attachmentTypes = List<AttachmentType>.from(_attachmentTypes.map((e) {
          UploadedFile? _tempFile;
          try {
            _tempFile = _uploadedFiles.firstWhere(
              (element) => element.attachmentType.id == e.id,
            );
          } catch (exp) {}

          e.file = _tempFile;
          return e;
        }).toList());

        if (mounted)
          setState(() {
            _loading = false;
          });
      } catch (exp) {
        if (mounted)
          setState(() {
            _loading = false;
            _attachmentTypes = [];
            _uploadedFiles = [];
          });
      }
    });
    super.initState();
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
        title: I18n.of(context)!.my_files,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 22,
                  horizontal: 16,
                ),
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        List.generate(
                          _attachmentTypes.length,
                          (index) => MyFilesCard(
                            attachmentType: _attachmentTypes[index],
                            // uploadedFile: _attachmentTypes[index]?.file,
                            onFileChange: (UploadedFile file) {
                              setState(
                                () {
                                  _attachmentTypes[index].file = file;
                                },
                              );
                            },
                          ),
                        ).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
