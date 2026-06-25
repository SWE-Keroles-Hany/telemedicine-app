import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/features/check_yourself/domain/usecases/send_message_usecase.dart';
import 'package:telemedicine/features/check_yourself/presentation/cubit/check_yourself_states.dart';

class CheckYourselfCubit extends Cubit<CheckYourselfState> {
  final SendMessageUseCase sendMessageUseCase;

  CheckYourselfCubit({required this.sendMessageUseCase})
    : super(CheckYourselfInitial());

  Future<void> sendMessage({
    required int patientId,
    required String message,
    required String route,
    List<File>? files,
  }) async {
    emit(CheckYourselfLoading());

    final result = await sendMessageUseCase.sendMessage(
      patientId: patientId,
      message: message,
      route: route,
      files: files,
    );

    result.fold(
      (failure) => emit(CheckYourselfError(failure.message)),
      (chatResponse) => emit(CheckYourselfSuccess(chatResponse)),
    );
  }
}
