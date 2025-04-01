import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_response.freezed.dart';
part 'network_response.g.dart'; // For JSON serialization if needed

@freezed
class NetworkResponse with _$NetworkResponse {
  const factory NetworkResponse.success(Map<String, dynamic> data) = _Success;
  const factory NetworkResponse.error(String message) = _Error;
  const factory NetworkResponse.loading([String? message]) = _Loading;

  factory NetworkResponse.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseFromJson(json); // Optional if you want to use fromJson
}
