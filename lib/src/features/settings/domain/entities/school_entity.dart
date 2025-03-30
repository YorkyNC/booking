import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/features/settings/domain/entities/class_entity.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'school_entity.freezed.dart';
part 'school_entity.g.dart';

@freezed
class SchoolEntity extends BaseEntity with _$SchoolEntity {
  const factory SchoolEntity({
    required String id,
    String? jobType,
    required List<ClassEntity> classes,
    String? teacherId,
  }) = _SchoolEntity;

  factory SchoolEntity.fromJson(Map<String, dynamic> json) => _$SchoolEntityFromJson(json);
}
