// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_stat_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetStatEntityImpl _$$GetStatEntityImplFromJson(Map<String, dynamic> json) =>
    _$GetStatEntityImpl(
      hoursInLibrary: (json['hoursInLibrary'] as num).toInt(),
      minutesInLibrary: (json['minutesInLibrary'] as num).toInt(),
      bookingDaysInMonth: (json['bookingDaysInMonth'] as num).toInt(),
      recordDay: (json['recordDay'] as num).toInt(),
      recordHours: (json['recordHours'] as num).toInt(),
    );

Map<String, dynamic> _$$GetStatEntityImplToJson(_$GetStatEntityImpl instance) =>
    <String, dynamic>{
      'hoursInLibrary': instance.hoursInLibrary,
      'minutesInLibrary': instance.minutesInLibrary,
      'bookingDaysInMonth': instance.bookingDaysInMonth,
      'recordDay': instance.recordDay,
      'recordHours': instance.recordHours,
    };
