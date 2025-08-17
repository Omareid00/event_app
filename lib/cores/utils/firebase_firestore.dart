import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/models/event_task_data.dart';
import 'package:event_app/screens/layout/create_event/widget/eventdata.dart';

 abstract class FirebaseFirestoreService {
   static CollectionReference<EventData> _getCollectionReference() {
     return FirebaseFirestore.instance
         .collection(EventTaskData.collectionName)
         .withConverter(fromFirestore: (snapshot, _) =>
         EventData.fromFirestore(snapshot.data()!),
       toFirestore: (value, _) => value.toFirestore(),);
   }

   static Future<void> createNewEventTask(EventData eventData) async {
     var collectionReference = _getCollectionReference();
     var documentReference = collectionReference.doc();
     return documentReference.set(eventData);
   }

   static Future<List<EventData>> getEventList() async{
     var collectionReference = _getCollectionReference();
     var dataCollection = await collectionReference.get();
     return dataCollection.docs.map((e) {
       return e.data();
     }).toList();


   }
}

