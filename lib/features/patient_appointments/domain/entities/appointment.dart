class Appointment {
  final int appointmentId;
  final String doctorName;
  final DateTime appointmentDate;
  final String status;

  Appointment({
    required this.appointmentId,
    required this.doctorName,
    required this.appointmentDate,
    required this.status,
  });
}
