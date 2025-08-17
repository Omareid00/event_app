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
     this.isFavorite=false,
  });


  factory EventData.fromFirestore(Map<String, dynamic> json) {
    return EventData(
      eventId: json['eventId'],
      eventTitle: json['eventTitle'],
      eventDescription: json['eventDescription'],
      selectDate: DateTime.parse(json['selectDate']),
      eventCategoryId: json['eventCategoryId'],
      eventCategoryImage: json['eventCategoryImage'],
      isFavorite: json['isFavorite'] ?? false,
    );


  }

  Map<String, dynamic> toFirestore() {
    return {
      'eventId': eventId,
      'eventTitle': eventTitle,
      'eventDescription': eventDescription,
      'selectDate': selectDate.toIso8601String(),
      'eventCategoryId': eventCategoryId,
      'eventCategoryImage': eventCategoryImage,
      'isFavorite': isFavorite,
    };
  }
}
