import 'package:telemedicine/core/shared_models/medical_history/models/attachment_entity.dart';
import 'package:telemedicine/core/shared_models/medical_history/models/attachment_model.dart';

extension AttachmentModelMapper on AttachmentModel {
  AttachmentEntity get toEntity => AttachmentEntity(
    fileUrl: fileUrl,
    attachmentType: attachmentType,
  );
}
