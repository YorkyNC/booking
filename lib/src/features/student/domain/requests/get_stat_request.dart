import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_stat_request.freezed.dart';
part 'get_stat_request.g.dart';

@freezed
class GetStatRequest with _$GetStatRequest {
  const factory GetStatRequest({
    required int userId,
  }) = _GetStatRequest;

  factory GetStatRequest.fromJson(Map<String, dynamic> json) => _$GetStatRequestFromJson(json);
}
