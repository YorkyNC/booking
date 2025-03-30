import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'get_posts_response.freezed.dart';
part 'get_posts_response.g.dart';

@freezed
class GetPostsResponse extends BaseEntity with _$GetPostsResponse {
  const factory GetPostsResponse({
    required String url,
  }) = _GetPostsResponse;

  factory GetPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPostsResponseFromJson(json);
}
