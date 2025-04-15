import 'package:booking/src/core/components/users/domain/models/user_entity.dart';
import 'package:booking/src/features/seat/domain/entities/get_all_seat_entity.dart';
import 'package:booking/src/features/seat/domain/entities/seat_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_reservation_entity.freezed.dart';
part 'create_reservation_entity.g.dart';

@freezed
class CreateReservationEntity with _$CreateReservationEntity {
  const factory CreateReservationEntity({
    required int id,
    required String startTime,
    required String endTime,
    required String date,
    required int floor,
    @JsonKey(fromJson: _statusFromJson) required SeatStatus status,
    required SeatItemEntity seat,
    required UserEntity user,
  }) = _CreateReservationEntity;

  factory CreateReservationEntity.fromJson(Map<String, dynamic> json) => _$CreateReservationEntityFromJson(json);
}

SeatStatus _statusFromJson(dynamic json) {
  if (json == null) return SeatStatus.unavailable;

  // Handle string values
  if (json is String) {
    switch (json.toUpperCase()) {
      case 'PENDING':
        return SeatStatus.pending;
      case 'AVAILABLE':
        return SeatStatus.available;
      case 'DELETED':
        return SeatStatus.deleted;
      case 'UNAVAILABLE':
        return SeatStatus.unavailable;
      default:
        return SeatStatus.unavailable;
    }
  }

  // Try to parse as enum directly if it's not a string
  try {
    return SeatStatus.values[json as int];
  } catch (e) {
    return SeatStatus.unavailable;
  }
}
