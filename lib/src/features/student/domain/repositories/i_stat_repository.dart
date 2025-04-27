import 'package:booking/src/features/student/domain/entities/get_stat_entity.dart';
import 'package:booking/src/features/student/domain/requests/get_stat_request.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/exceptions/domain_exception.dart';

abstract class IStatRepository {
  Future<Either<DomainException, GetStatEntity>> getStat(
    GetStatRequest request,
  );
}
