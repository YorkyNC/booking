import 'package:booking/src/core/services/auth/models/user_entity.dart';
import 'package:booking/src/features/history/domain/enum/booking_status.dart';
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
    @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) required BookingStatus status,
    required int floor,
    required String date,
  }) = _GetHistoryEntity;

  factory GetHistoryEntity.fromJson(Map<String, dynamic> json) => _$GetHistoryEntityFromJson(json);
}

BookingStatus _statusFromJson(String status) => BookingStatus.fromString(status);
String _statusToJson(BookingStatus status) => status.value;

// CORRECTED: The JSON returns an array directly, not an object with "bookings" property
@freezed
class GetHistoryList with _$GetHistoryList {
  const factory GetHistoryList({
    required List<GetHistoryEntity> bookings, // Changed from 'bookings' to 'data' or keep as list
  }) = _GetHistoryList;

  // Since the JSON is a direct array, you might want to handle it differently:
  factory GetHistoryList.fromJson(List<dynamic> json) =>
      GetHistoryList(bookings: json.map((e) => GetHistoryEntity.fromJson(e)).toList());

  // Alternative: If you expect the JSON to be wrapped in an object later:
  // factory GetHistoryList.fromJson(Map<String, dynamic> json) => _$GetHistoryListFromJson(json);
}

// ALTERNATIVE APPROACH: Handle the array directly without wrapper class
// You could also just use: List<GetHistoryEntity>.from(jsonArray.map((x) => GetHistoryEntity.fromJson(x)))

// If you need to keep the current structure but the API returns a direct array,
// you can create a helper method:
extension GetHistoryListExtension on GetHistoryList {
  static GetHistoryList fromJsonArray(List<dynamic> jsonArray) {
    return GetHistoryList(
      bookings: jsonArray.map((json) => GetHistoryEntity.fromJson(json)).toList(),
    );
  }
}
