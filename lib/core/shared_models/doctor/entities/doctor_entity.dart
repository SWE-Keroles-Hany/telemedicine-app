class DoctorEntity {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String specialty;
  final int yearsOfExperience;
  final String clinicAddress;
  final String bio;
  final String? profilePictureUrl;
  final num rate;
  final int rateCount;
  const DoctorEntity({
    required this.rate,
    required this.rateCount,
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.specialty,
    required this.yearsOfExperience,
    required this.clinicAddress,
    required this.bio,
    required this.profilePictureUrl,
  });
}
