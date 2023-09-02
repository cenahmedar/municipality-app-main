import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:municipality_app/constants/app_constants.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/attachment_type.dart';
import 'package:municipality_app/models/uploaded_file.dart';
import 'package:municipality_app/pages/file_preview_page.dart';
import 'package:municipality_app/services/files_service.dart';

class MyFilesCard extends StatefulWidget {
  // final UploadedFile? uploadedFile;
  final AttachmentType attachmentType;
  final Function(UploadedFile) onFileChange;

  MyFilesCard({
    // required this.uploadedFile,
    required this.onFileChange,
    required this.attachmentType,
  });

  @override
  State<MyFilesCard> createState() => _MyFilesCardState();
}

class _MyFilesCardState extends State<MyFilesCard> {
  final FilesService _filesService = FilesService();
  String? _downloadedImageB64;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        if (widget.attachmentType.file != null) {
          _downloadedImageB64 = await _filesService.downloadFile(
            id: widget.attachmentType.file!.id.round(),
          );
        }
      } catch (exp) {}
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FilePreviewPage(
              attachmentType: widget.attachmentType,
              base64image: _downloadedImageB64,
              onFileChange: (newFile, base64Image) {
                if (mounted)
                  setState(() {
                    _downloadedImageB64 = base64Image;
                  });
                widget.onFileChange(newFile!);
              },
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(19),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFB6C6D4),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.attachmentType.name,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          fontSize: 17.0,
                        ),
                  ),
                  Row(
                    children: [
                      Text(
                        I18n.of(context)!.date_added,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: 13.0,
                              color: Color(0xFFA4A4A4),
                            ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        formatter.format(DateTime.now()),
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: 13.0,
                              color: Color(0xFFA4A4A4),
                            ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 33,
              height: 33,
              child: _downloadedImageB64 != null
                  ? Image.memory(
                      base64Decode(_downloadedImageB64!),
                    )
                  : Image.asset('assets/images/image_loading_placeholder.jpeg'),
            )
          ],
        ),
      ),
    );
  }
}
