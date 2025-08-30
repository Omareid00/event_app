
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/screens/layout/create_event/widget/eventdata.dart';

 abstract class FirebaseFirestoreService {
   static CollectionReference<EventData> _getCollectionReference() {
     return FirebaseFirestore.instance
         .collection(EventData.collectionName)
         .withConverter(fromFirestore: (snapshot, _) =>
         EventData.fromFirestore(snapshot.data()!),
       toFirestore: (value, _) => value.toFirestore(),);
   }

   static Future<bool> createNewEventTask(EventData eventData) async {
     try{
       var collectionReference = _getCollectionReference();
       var documentReference = collectionReference.doc();
       eventData.eventId = documentReference.id;
       documentReference.set(eventData);
        return Future.value(true);
     }catch(e){
       return Future.value(false);
     }

   }

   static Future<List<EventData>> getEventList() async{
     var collectionReference = _getCollectionReference();
     var dataCollection = await collectionReference.get();
     return dataCollection.docs.map((e) {
       return e.data();
     }).toList();


   }

   static Stream<QuerySnapshot<EventData>> getStreamEventList({required String categoryId}) {
     var collectionReference = _getCollectionReference().where("eventCategoryId",
     isEqualTo: categoryId);
     return collectionReference.snapshots();
   }
   static Stream<QuerySnapshot<EventData>> getFavouriteStreamEventList() {
     var collectionReference = _getCollectionReference().where("isFavorite",
     isEqualTo: true);
     return collectionReference.snapshots();
   }
   static Future<void> updateEvent({required EventData eventData}) {
     var collectionReference = _getCollectionReference();
     var documentReference = collectionReference.doc(eventData.eventId);
     return documentReference.update({"isFavorite":eventData.isFavorite});

   }


}

