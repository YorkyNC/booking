import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/attachment_repository_impl.dart';
import '../entities/attachment_entity.dart';
import '../repositories/i_attachment_repository.dart';
import '../requests/get_attachment_request.dart';

@lazySingleton
class GetAttachmentUseCase
    extends UseCase<AttachmentEntity, GetAttachmentRequest> {
  final IAttachmentRepository _repository;

  GetAttachmentUseCase(@Named.from(AttachmentRepositoryImpl) this._repository);

  @override
  Future<Either<DomainException, AttachmentEntity>> execute(
      GetAttachmentRequest requestModel) {
    return _repository.getAttachment(requestModel);
  }
}
