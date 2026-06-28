import 'dart:convert';
import 'dart:developer';

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

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    final responseData = json['response'];
    final summaryData = json['summary'];
    return ChatResponseModel(
      id: json['id']?.toString(),

      response: responseData,

      messageCount: json['message_count'] as int?,

      summary: summaryData is Map
          ? summaryData['text']?.toString()
          : summaryData?.toString(),

      suggestedDoctorIds: json['suggested_doctor_ids'] != null
          ? List<dynamic>.from(json['suggested_doctor_ids'])
          : null,

      route: json['route']?.toString(),
    );
  }
}
