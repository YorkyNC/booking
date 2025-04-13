import 'package:booking/src/features/seat/domain/entities/seat_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_seat_entity.freezed.dart';
part 'get_all_seat_entity.g.dart';

@freezed
class GetAllSeatEntity with _$GetAllSeatEntity {
  const factory GetAllSeatEntity({
    required List<SeatItemEntity> data,
    required int count,
  }) = _GetAllSeatEntity;

  factory GetAllSeatEntity.fromJson(Map<String, dynamic> json) => _$GetAllSeatEntityFromJson(json);
}

enum SeatStatus {
  @JsonValue('AVAILABLE')
  available,

  @JsonValue('UNAVAILABLE')
  unavailable,

  @JsonValue('PENDING')
  pending,

  @JsonValue('DELETED')
  deleted,
}
