class AttachmentModel {
  final String fileUrl;
  final String attachmentType;

  AttachmentModel({
    required this.fileUrl,
    required this.attachmentType,
  });

  factory AttachmentModel.fromJson(Map<String, dynamic> json) {
    return AttachmentModel(
      fileUrl: json['fileUrl'] ?? '',
      attachmentType: json['attachmentType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fileUrl': fileUrl,
      'attachmentType': attachmentType,
    };
  }
}
