import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/features/patient_appointments/domain/use_cases/get_my_appointments_usecase.dart';
import 'package:telemedicine/features/patient_appointments/domain/use_cases/cancel_appointment_usecase.dart';
import 'package:telemedicine/features/patient_appointments/domain/entities/appointment.dart';

part 'appointment_states.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final GetMyAppointmentsUseCase getMyAppointmentsUseCase;
  final CancelAppointmentUseCase cancelAppointmentUseCase;

  AppointmentCubit({
    required this.getMyAppointmentsUseCase,
    required this.cancelAppointmentUseCase,
  }) : super(AppointmentsInitial());

  Future<void> getMyAppointments({required int statusNumber}) async {
    emit(AppointmentsLoading());

    final result = await getMyAppointmentsUseCase.call(
      statusNumber: statusNumber,
    );

    result.fold(
      (failure) => emit(AppointmentsError(failure.message)),
      (appointments) => emit(AppointmentsSuccess(appointments)),
    );
  }

  Future<void> cancelAppointment({required int appointmentId}) async {
    emit(CancelAppointmentLoading());

    final result = await cancelAppointmentUseCase.call(
      appointmentId: appointmentId,
    );

    result.fold(
      (failure) => emit(CancelAppointmentError(failure.message)),
      (_) => emit(CancelAppointmentSuccess()),
    );
  }
}
