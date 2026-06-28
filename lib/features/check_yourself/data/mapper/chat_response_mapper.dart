import 'package:telemedicine/features/check_yourself/data/models/chat_response_model.dart';
import 'package:telemedicine/features/check_yourself/domain/entities/chat_response_entity.dart';

extension ChatResponseMapper on ChatResponseModel {
  ChatResponseEntity toEntity() {
    return ChatResponseEntity(
      id: id,
      response: response,
      messageCount: messageCount,
      summary: summary,
      suggestedDoctorIds: suggestedDoctorIds,
      route: route,
    );
  }
}
