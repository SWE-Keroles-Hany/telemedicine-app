class TopDoctorModel {
  final int id;
  final String name;
  final String specialty;
  final double rate;
  final String pictureUrl;

  TopDoctorModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rate,
    required this.pictureUrl,
  });

  factory TopDoctorModel.fromJson(Map<String, dynamic> json) {
    return TopDoctorModel(
      id: json['id'],
      name: json['name'],
      specialty: json['specialty'],
      rate: json['rate'].toDouble(),
      pictureUrl: json['pictureUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialty': specialty,
      'rate': rate,
      'pictureUrl': pictureUrl,
    };
  }
}
