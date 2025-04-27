import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/domain_exception.dart';
import '../../../../core/utils/loggers/logger.dart';
import '../../domain/entities/attachment_entity.dart';
import '../../domain/repositories/i_attachment_repository.dart';
import '../../domain/requests/add_attachment_request.dart';
import '../../domain/requests/get_attachment_request.dart';
import '../datasources/remote/attachment_remote_impl.dart';
import '../datasources/remote/i_attachment_remote.dart';
import '../models/add_attachment_response.dart';

@named
@LazySingleton(as: IAttachmentRepository)
class AttachmentRepositoryImpl implements IAttachmentRepository {
  final IAttachmentRemote _attachmentImpl;
  AttachmentRepositoryImpl(@Named.from(AttachmentRemoteImpl) this._attachmentImpl);

  @override
  Future<Either<DomainException, AddAttachmentResponse>> addAttachment(AddAttachmentRequest file) async {
    try {
      final requests = await _attachmentImpl.addAttachment(file);

      return requests.fold(
        (error) => Left(error),
        (result) {
          return Right(result);
        },
      );
    } catch (e) {
      log(e.toString());
      return Left(UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, AttachmentEntity>> getAttachment(GetAttachmentRequest request) async {
    try {
      final requests = await _attachmentImpl.getAttachment(request);

      return requests.fold(
        (error) => Left(error),
        (response) {
          final AttachmentEntity result = response;

          return Right(result);
        },
      );
    } catch (e) {
      log(e.toString());
      return Left(UnknownException(message: e.toString()));
    }
  }
}
