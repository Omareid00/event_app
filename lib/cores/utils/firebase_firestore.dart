import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/models/event_task_data.dart';

 abstract class FirebaseFirestoreService {
   CollectionReference<EventTaskData> _getCollectionReference() {
     return FirebaseFirestore.instance
         .collection(EventTaskData.collectionName)
         .withConverter(fromFirestore: (snapshot, _) =>
         EventTaskData.fromFireStore(snapshot.data()!),
       toFirestore: (value, _) => value.toFireStore(),);
   }

   static createNeweventTask(EventTaskData eventTaskData) {
     var collectionReference = _getCollectionReference();
     var documentReference = collectionReference.doc();
     documentReference.set(eventTaskData);
   }
   