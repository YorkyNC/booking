import 'package:fpdart/fpdart.dart';

import '../../../../core/exceptions/domain_exception.dart';
import '../../data/models/add_attachment_response.dart';
import '../entities/attachment_entity.dart';
import '../requests/add_attachment_request.dart';
import '../requests/get_attachment_request.dart';

abstract class IAttachmentRepository {
  Future<Either<DomainException, AddAttachmentResponse>> addAttachment(
    AddAttachmentRequest request,
  );

  Future<Either<DomainException, AttachmentEntity>> getAttachment(
    GetAttachmentRequest request,
  );
}
