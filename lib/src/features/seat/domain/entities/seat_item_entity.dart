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
    required SeatStatus status,
  }) = _SeatItemEntity;

  factory SeatItemEntity.fromJson(Map<String, dynamic> json) => _$SeatItemEntityFromJson(json);
}
