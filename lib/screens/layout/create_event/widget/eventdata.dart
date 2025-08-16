class EventData {
  String? eventId;
  final String eventTitle;
  final String eventDescription;
  final DateTime selectDate;
  final String eventCategoryId;
  final String eventCategoryImage;

  final bool isFavorite;

  EventData({
    this.eventId,
    required this.eventTitle,
    required this.eventDescription,
    required this.selectDate,
    required this.eventCategoryId,
    required this.eventCategoryImage,
    required this.isFavorite,
  });


}