// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuccessImpl _$$SuccessImplFromJson(Map<String, dynamic> json) =>
    _$SuccessImpl(
      json['data'] as Map<String, dynamic>,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SuccessImplToJson(_$SuccessImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'runtimeType': instance.$type,
    };

_$ErrorImpl _$$ErrorImplFromJson(Map<String, dynamic> json) => _$ErrorImpl(
      json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorImplToJson(_$ErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };

_$LoadingImpl _$$LoadingImplFromJson(Map<String, dynamic> json) =>
    _$LoadingImpl(
      json['message'] as String?,
      json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingImplToJson(_$LoadingImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
