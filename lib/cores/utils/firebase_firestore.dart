import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/models/event_task_data.dart';

 abstract class FirebaseFirestoreService {
   static CollectionReference<EventTaskData> _getCollectionReference() {
     return FirebaseFirestore.instance
         .collection(EventTaskData.collectionName)
         .withConverter(fromFirestore: (snapshot, _) =>
         EventTaskData.fromFirestore(snapshot.data()!),
       toFirestore: (value, _) => value.toFirestore(),);
   }

   static createNeweventTask(EventTaskData eventTaskData) {
     var collectionReference = _getCollectionReference();
     var documentReference = collectionReference.doc();
     documentReference.set(eventTaskData);
   }

   static Future<List<EventTaskData>> getEventList() async{
     var collectionReference = _getCollectionReference();
     var dataCollection = await collectionReference.get();
     return dataCollection.docs.map((e) {
       return e.data();
     }).toList();


   }
}

