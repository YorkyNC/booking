// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyResponseImpl _$$VerifyResponseImplFromJson(Map<String, dynamic> json) =>
    _$VerifyResponseImpl(
      status: json['status'] as String,
      data: VerifyDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VerifyResponseImplToJson(
        _$VerifyResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
