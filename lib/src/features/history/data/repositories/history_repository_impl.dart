import 'dart:developer';

import 'package:booking/src/features/history/domain/enum/entities/get_history_entity.dart';
import 'package:booking/src/features/history/domain/enum/repositories/i_history_repository.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/domain_exception.dart';
import '../datasources/remote/history_remote_impl.dart';
import '../datasources/remote/i_history_remote.dart';

@named
@LazySingleton(as: IHistoryRepository)
class HistoryRepositoryImpl implements IHistoryRepository {
  final IHistoryRemote _historyImpl;
  HistoryRepositoryImpl(@Named.from(HistoryRemoteImpl) this._historyImpl);

  @override
  Future<Either<DomainException, GetHistoryList>> getHistory(GetHistoryRequest file) async {
    try {
      final requests = await _historyImpl.getHistory(file);

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
}
