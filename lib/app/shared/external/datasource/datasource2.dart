import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tetrazolium/app/shared/domain/entities/entity.dart';

abstract class Datasource2<T extends Entity> extends Mapper<T> {
  final FirebaseFirestore firestore;
  late CollectionReference collection;

  Datasource2(String _collection, this.firestore) {
    collection = firestore.collection(_collection);
  }

  Future<List<T>> getAll(String id) async {
    collection = firestore.collection(id);
    var result = await collection.get();
    return result.docs.map((e) => fromMap(e.data() as Map)).toList();
  }
}

abstract class Mapper<T> {
  Map<String, dynamic> toMap(T entity);
  T fromMap(Map<dynamic, dynamic> map);
}
