import 'package:telemedicine/features/patient_appointments/data/models/appointment_model.dart';
import 'package:telemedicine/features/patient_appointments/domain/entities/appointment.dart';

extension AppointmentModelMapper on AppointmentModel {
  Appointment get toEntity => Appointment(
    appointmentId: appointmentId,
    doctorName: doctorName,
    appointmentDate: appointmentDate,
    status: status,
  );
}
