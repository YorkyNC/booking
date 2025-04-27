import 'package:booking/src/core/services/auth/models/user_entity.dart';
import 'package:booking/src/features/seat/domain/entities/seat_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_history_entity.freezed.dart';
part 'get_history_entity.g.dart';

@freezed
class GetHistoryEntity with _$GetHistoryEntity {
  const factory GetHistoryEntity({
    required int id,
    required UserEntity user,
    required SeatItemEntity seat,
    required DateTime startTime,
    required DateTime endTime,
    required String status,
    required int floor,
    required String date,
  }) = _GetHistoryEntity;

  factory GetHistoryEntity.fromJson(Map<String, dynamic> json) => _$GetHistoryEntityFromJson(json);
}

@freezed
class GetHistoryList with _$GetHistoryList {
  const factory GetHistoryList({
    required List<GetHistoryEntity> bookings,
  }) = _GetHistoryList;

  factory GetHistoryList.fromJson(Map<String, dynamic> json) => _$GetHistoryListFromJson(json);
}
