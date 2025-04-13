import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_request.dart';

part 'get_seat_request.freezed.dart';
part 'get_seat_request.g.dart';

@freezed
class GetSeatRequest extends BaseRequest with _$GetSeatRequest {
  const factory GetSeatRequest({
    required int id,
  }) = _GetSeatRequest;

  factory GetSeatRequest.fromJson(Map<String, dynamic> json) => _$GetSeatRequestFromJson(json);
}
