import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:booking/src/features/events/domain/requests/get_events_count_request.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';

@lazySingleton
class GetEventsCountUseCase extends UseCase<int, GetEventsCountRequest> {
  GetEventsCountUseCase();

  @override
  Future<Either<DomainException, int>> execute(GetEventsCountRequest requestModel) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(10);
  }
}
