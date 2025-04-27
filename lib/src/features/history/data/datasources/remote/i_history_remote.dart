import 'package:booking/src/core/exceptions/domain_exception.dart';
import 'package:booking/src/features/history/domain/enum/entities/get_history_entity.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:fpdart/fpdart.dart';

abstract class IHistoryRemote {
  Future<Either<DomainException, GetHistoryList>> getHistory(
    GetHistoryRequest request,
  );
}
