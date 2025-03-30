import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_highlight_entity.freezed.dart';
part 'summary_highlight_entity.g.dart';

@freezed
class SummaryHighlightEntity with _$SummaryHighlightEntity {
  factory SummaryHighlightEntity({
    required String title,
    required String content,
  }) = _SummaryHighlightEntity;

  factory SummaryHighlightEntity.fromJson(Map<String, dynamic> json) =>
      _$SummaryHighlightEntityFromJson(json);
}