import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/core/components/events/domain/models/summary_highlight_entity.dart';
import 'package:booking/src/core/components/users/domain/models/user_entity.dart';

part 'suspect_entity.freezed.dart';
part 'suspect_entity.g.dart';

@freezed
class SuspectEntity with _$SuspectEntity {
  factory SuspectEntity({
    required String id,
    UserEntity? user,
    required String imageUrl,
    String? description,
    @Default([]) List<SummaryHighlightEntity> highlights,
  }) = _SuspectEntity;

  factory SuspectEntity.fromJson(Map<String, dynamic> json) => _$SuspectEntityFromJson(json);
}
