class DoctorModel {
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

  DoctorModel({
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

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      
      id: json['id'],
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      specialty: json['specialty'] ?? '',
      yearsOfExperience: json['yearsOfExperience'] ?? 0,
      clinicAddress: json['clinicAddress'] ?? '',
      bio: json['bio'] ?? '',
      profilePictureUrl: json['profilePictureUrl'] ?? '',
      rate: json['rate'],
      rateCount: json['rateCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {

      'rate': rate,
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'specialty': specialty,
      'yearsOfExperience': yearsOfExperience,
      'clinicAddress': clinicAddress,
      'bio': bio,
      'profilePictureUrl': profilePictureUrl,
      'rateCount': rateCount,
    };
  }
}
