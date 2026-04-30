class AppointmentModel {
  final int appointmentId;
  final String doctorName;
  final DateTime appointmentDate;
  final String status;

  AppointmentModel({
    required this.appointmentId,
    required this.doctorName,
    required this.appointmentDate,
    required this.status,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      appointmentId: json['appointmentId'] ?? 0,
      doctorName: json['doctorName'] ?? '',
      appointmentDate: DateTime.parse(json['appointmentDate']),
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appointmentId': appointmentId,
      'doctorName': doctorName,
      'appointmentDate': appointmentDate.toIso8601String(),
      'status': status,
    };
  }
}
