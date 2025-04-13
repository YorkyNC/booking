import 'package:booking/src/features/seat/domain/entities/get_all_seat_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'seat_item_entity.freezed.dart';
part 'seat_item_entity.g.dart';

@freezed
class SeatItemEntity with _$SeatItemEntity {
  const factory SeatItemEntity({
    required int id,
    required String number,
    required String location,
    @JsonKey(fromJson: _statusFromJson) required SeatStatus status,
    required int floor,
  }) = _SeatItemEntity;

  factory SeatItemEntity.fromJson(Map<String, dynamic> json) => _$SeatItemEntityFromJson(json);
}

// Custom converter for seat status
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
