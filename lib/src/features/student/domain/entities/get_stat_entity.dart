import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_stat_entity.freezed.dart';
part 'get_stat_entity.g.dart';

@freezed
class GetStatEntity with _$GetStatEntity {
  const factory GetStatEntity({
    required int hoursInLibrary,
    required int minutesInLibrary,
    required int bookingDaysInMonth,
    required int recordDay,
    required int recordHours,
  }) = _GetStatEntity;

  factory GetStatEntity.fromJson(Map<String, dynamic> json) => _$GetStatEntityFromJson(json);
}
