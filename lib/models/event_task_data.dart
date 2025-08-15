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

  factory EventTaskData.fromFirestore(Map<String, dynamic> json) {
    return EventTaskData(
      eventId: json['eventId'] ,
      eventTitle: json['eventTitle'] ,
      eventCategory: json['eventCategory'] ,
      eventDescription: json['eventDescription'] ,
      isFavourite: json['isFavourite'] ,
    );
  }


  Map<String, dynamic> toFirestore() {
    return {
      'eventId': eventId,
      'eventTitle': eventTitle,
      'eventCategory': eventCategory,
      'eventDescription': eventDescription,
      'isFavourite': isFavourite,
    };
  }


}
