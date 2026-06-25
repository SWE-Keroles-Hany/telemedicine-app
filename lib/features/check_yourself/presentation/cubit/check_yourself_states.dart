import 'package:telemedicine/features/check_yourself/domain/entities/chat_response_entity.dart';

abstract class CheckYourselfState {}

class CheckYourselfInitial extends CheckYourselfState {}

class CheckYourselfLoading extends CheckYourselfState {}

class CheckYourselfSuccess extends CheckYourselfState {
  final ChatResponseEntity chatResponse;

  CheckYourselfSuccess(this.chatResponse);
}

class CheckYourselfError extends CheckYourselfState {
  final String message;

  CheckYourselfError(this.message);
}
