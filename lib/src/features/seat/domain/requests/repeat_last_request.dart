import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeat_last_request.freezed.dart';
part 'repeat_last_request.g.dart';

@freezed
class RepeatLastRequest with _$RepeatLastRequest {
  const factory RepeatLastRequest({
    required int userId,
  }) = _RepeatLastRequest;

  factory RepeatLastRequest.fromJson(Map<String, dynamic> json) => _$RepeatLastRequestFromJson(json);
}
