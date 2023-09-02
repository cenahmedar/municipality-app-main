import 'package:dio/dio.dart';
import 'package:municipality_app/constants/apis.dart';
import 'package:municipality_app/models/attachment_type.dart';
import 'package:municipality_app/models/uploaded_file.dart';

import 'package:municipality_app/utils/http_utils.dart';

class FilesService {
  late HttpUtil _httpUtil;
  FilesService() {
    _httpUtil = HttpUtil();
  }

  Future<List<UploadedFile>?> getUserAttachments() async {
    try {
      final List<dynamic> data =
          await _httpUtil.makeRequest(path: Apis.GET_USER_ATTACHMENTS);
      return data
          .map<UploadedFile>((json) => UploadedFile.fromJson(json))
          .toList();
    } catch (exp) {
      return null;
    }
  }

  Future<List<AttachmentType>?> getAttachmentTypes() async {
    try {
      final List<dynamic> data =
          await _httpUtil.makeRequest(path: Apis.GET_ATTACHMENT_TYPES);

      return data
          .map<AttachmentType>((json) => AttachmentType.fromJson(json))
          .toList();
    } catch (exp) {
      return null;
    }
  }

  Future<UploadedFile?> updateUserAttachment({
    required double id,
    required MultipartFile thedoc,
  }) async {
    Map<String, dynamic> bodyData = {
      'thedoc': thedoc,
    };
    try {
      final dynamic data = await _httpUtil.makeRequest(
        path: "UserProfile/UpdateUserAttachment/$id",
        type: RequestType.post,
        data: FormData.fromMap(bodyData),
      );
      return UploadedFile.fromJson(data);
    } catch (exp) {
      print(exp);
      return null;
    }
  }

  Future<String?> downloadFile({required int id}) async {
    try {
      final dynamic data = await _httpUtil.makeRequest(
        path: "attachment/DownloadFromUsers/$id",
        type: RequestType.post,
      );
      return data;
    } catch (exp) {
      return null;
    }
  }

  Future<UploadedFile?> uploadUserAttachment(
      {required String attachmentName,
      required MultipartFile thedoc,
      required double attachmentTypeId}) async {
    Map<String, dynamic> bodyData = {
      'Thedoc': thedoc,
      'AttachmentName': attachmentName,
      'AttachTypeId': attachmentTypeId,
    };
    try {
      final dynamic data = await _httpUtil.makeRequest(
        path: "UserProfile/UploadUserAttachment",
        type: RequestType.post,
        data: FormData.fromMap(bodyData),
      );
      return UploadedFile.fromJson(data);
    } catch (exp) {
      print(exp);
      return null;
    }
  }
}
