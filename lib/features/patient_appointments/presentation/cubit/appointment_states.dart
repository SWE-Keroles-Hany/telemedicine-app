part of 'appointment_cubit.dart';

abstract class AppointmentState {}

class AppointmentsInitial extends AppointmentState {}

class AppointmentsLoading extends AppointmentState {}

class AppointmentsSuccess extends AppointmentState {
  final List<Appointment> appointments;

  AppointmentsSuccess(this.appointments);
}

class AppointmentsError extends AppointmentState {
  final String message;

  AppointmentsError(this.message);
}
