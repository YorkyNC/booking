import 'package:booking/src/core/exceptions/domain_exception.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/get_history_entity.dart';
import '../requests/get_history_request.dart';

abstract class IHistoryRepository {
  Future<Either<DomainException, GetHistoryList>> getHistory(
    GetHistoryRequest request,
  );
}
