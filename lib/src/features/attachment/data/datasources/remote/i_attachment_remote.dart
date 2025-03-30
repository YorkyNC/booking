import 'package:fpdart/fpdart.dart';

import '../../../../../core/exceptions/domain_exception.dart';
import '../../../domain/entities/attachment_entity.dart';
import '../../../domain/requests/add_attachment_request.dart';
import '../../../domain/requests/get_attachment_request.dart';
import '../../models/add_attachment_response.dart';

abstract class IAttachmentRemote {
  Future<Either<DomainException, AddAttachmentResponse>> addAttachment(
    AddAttachmentRequest file,
  );

  Future<Either<DomainException, AttachmentEntity>> getAttachment(
      GetAttachmentRequest request);
}
