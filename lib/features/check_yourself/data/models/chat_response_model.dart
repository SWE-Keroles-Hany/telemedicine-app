import 'dart:convert';
import 'package:telemedicine/features/check_yourself/domain/entities/chat_response_entity.dart';

class ChatResponseModel {
  final String? id;
  final String? response;
  final int? messageCount;
  final String? summary;
  final List<dynamic>? suggestedDoctorIds;
  final String? route;

  ChatResponseModel({
    this.id,
    this.response,
    this.messageCount,
    this.summary,
    this.suggestedDoctorIds,
    this.route,
  });

  // Helper to parse nested JSON strings (with single quotes)
  String? _parseNestedText(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    try {
      final normalized = raw.replaceAll("'", '"');
      final decoded = jsonDecode(normalized);
      if (decoded is Map && decoded['text'] is String) {
        return decoded['text'];
      }
    } catch (_) {
      // Fallback if parsing fails
    }
    return raw;
  }

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      id: json['id']?.toString(),
      response: json['response'] != null
          ? json['response']['text']?.toString()
          : null,
      messageCount: json['message_count'] as int?,
      summary: json['summary'] != null
          ? json['summary']['text']?.toString()
          : null,
      suggestedDoctorIds: json['suggested_doctor_ids'] != null
          ? List<dynamic>.from(json['suggested_doctor_ids'])
          : null,
      route: json['route']?.toString(),
    );
  }

  ChatResponseEntity get toEntity => ChatResponseEntity(
    id: id,
    response: _parseNestedText(response),
    messageCount: messageCount,
    summary: _parseNestedText(summary),
    suggestedDoctorIds: suggestedDoctorIds,
    route: route,
  );
}
