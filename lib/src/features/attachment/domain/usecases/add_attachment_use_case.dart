import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/models/add_attachment_response.dart';
import '../../data/repositories/attachment_repository_impl.dart';
import '../repositories/i_attachment_repository.dart';
import '../requests/add_attachment_request.dart';

@lazySingleton
class AddAttachmentUseCase
    extends UseCase<AddAttachmentResponse, AddAttachmentRequest> {
  final IAttachmentRepository _repository;

  AddAttachmentUseCase(@Named.from(AttachmentRepositoryImpl) this._repository);

  @override
  Future<Either<DomainException, AddAttachmentResponse>> execute(
      AddAttachmentRequest requestModel) {
    return _repository.addAttachment(requestModel);
  }
}
