class ChatResponseEntity {
  final String? id;
  final String? response;
  final int? messageCount;
  final String? summary;
  final List<dynamic>? suggestedDoctorIds;
  final String? route;

  ChatResponseEntity({
    this.id,
    this.response,
    this.messageCount,
    this.summary,
    this.suggestedDoctorIds,
    this.route,
  });
}
