import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';
import 'verify_data_response.dart';

part 'verify_response.freezed.dart';
part 'verify_response.g.dart';

@freezed
class VerifyResponse extends BaseEntity with _$VerifyResponse {
  const factory VerifyResponse({
    required String status,
    required VerifyDataResponse data,
  }) = _VerifyResponse;

  factory VerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseFromJson(json);
}
