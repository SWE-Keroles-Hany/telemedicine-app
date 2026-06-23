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

class CancelAppointmentLoading extends AppointmentState {}

class CancelAppointmentSuccess extends AppointmentState {}

class CancelAppointmentError extends AppointmentState {
  final String message;

  CancelAppointmentError(this.message);
}
