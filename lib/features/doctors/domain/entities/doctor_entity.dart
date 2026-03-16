class DoctorEntity {
  final String name;
  final String specialty;
  final String hospital;
  final String location;
  final double rating;
  final int reviewCount;
  final int experienceYears;
  final int patientCount;
  final String about;
  final String imageAsset;

  const DoctorEntity({
    required this.name,
    required this.specialty,
    required this.hospital,
    required this.location,
    required this.rating,
    required this.reviewCount,
    required this.experienceYears,
    required this.patientCount,
    required this.about,
    required this.imageAsset,
  });
}
