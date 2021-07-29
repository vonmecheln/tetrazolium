import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseFirebaseDataSource {
  CollectionReference getCollection(String collectionPath) {
    return FirebaseFirestore.instance.collection(collectionPath);
  }
}
