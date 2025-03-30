import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;

import '../../../../../core/api/client/endpoints.dart';
import '../../../../../core/api/client/rest/dio/dio_client.dart';
import '../../../../../core/exceptions/domain_exception.dart';
import '../../../../../core/services/storage/storage_service_impl.dart';
import '../../../domain/entities/attachment_entity.dart';
import '../../../domain/requests/add_attachment_request.dart';
import '../../../domain/requests/get_attachment_request.dart';
import '../../models/add_attachment_response.dart';
import 'i_attachment_remote.dart';

@named
@LazySingleton(as: IAttachmentRemote)
class AttachmentRemoteImpl implements IAttachmentRemote {
  final client = DioRestClient();
  StorageServiceImpl st = StorageServiceImpl();
  Map<String, String> headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
  };

  @override
  Future<Either<DomainException, AddAttachmentResponse>> addAttachment(
      AddAttachmentRequest file) async {
    try {
      String fileName = path.basename(file.attachment.name);
      String extension = path.extension(fileName).toLowerCase();

      ContentType contentType;
      switch (extension) {
        case '.jpg':
        case '.jpeg':
          contentType = ContentType.parse('image/jpeg');
          break;
        case '.png':
          contentType = ContentType.parse('image/png');
          break;
        case '.gif':
          contentType = ContentType.parse('image/gif');
          break;
        case '.pdf':
          contentType = ContentType.parse('application/pdf');
          break;
        default:
          contentType = ContentType.parse('application/octet-stream');
      }

      final formData = FormData.fromMap({
        'file_content': await MultipartFile.fromFile(
          file.attachment.path,
          filename: fileName,
          contentType:
              DioMediaType(contentType.primaryType, contentType.subType),
        ),
      });

      // FormData.fromMap({
      //   'file_content': await MultipartFile.fromFile(
      //     file.attachment.path,
      //     filename: file.attachment.name,
      //     contentType: DioMediaType('image', 'jpeg'),
      //   ),
      // });

      headers.addAll(({'authorization': 'Bearer ${st.getToken()}'}));

      final Either<DomainException, Response<dynamic>> response =
          await client.post(
        '${EndPoints.baseUrl}${EndPoints.attachment}?is_public=false',
        data: formData,
        options: Options(
          headers: headers,
        ),
      );

      return response.fold(
        (error) => Left(error),
        (result) async {
          if (result.statusCode == 201) {
            return Right(AddAttachmentResponse.fromJson(result.data));
          } else {
            return Left(UnknownException(message: result.statusMessage));
          }
        },
      );
    } catch (e) {
      return Left(NetworkException(message: 'Network error: $e'));
    }
  }

  @override
  Future<Either<DomainException, AttachmentEntity>> getAttachment(
      GetAttachmentRequest request) async {
    final Either<DomainException, Response<dynamic>> response =
        await client.get(
      '${EndPoints.baseUrl}${EndPoints.attachment}/${request.attachmentId}?resolution=480',
      options: Options(
        headers: headers,
      ),
    );

    return response.fold(
      (error) => Left(error),
      (result) async {
        return Right(AttachmentEntity.fromJson(result.data));
      },
    );
  }
}
