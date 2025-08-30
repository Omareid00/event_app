class EventTaskData {
  static const String collectionName = 'EventTask';
  final String eventId;
  final String eventTitle;
  final String eventCategory;
  final String eventDescription;
  final bool isFavourite;

  EventTaskData({
    required this.eventId,
    required this.eventTitle,
    required this.eventCategory,
    required this.eventDescription,
    required this.isFavourite,
  });
}
