import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tetrazolium/app/shared/domain/entities/entity.dart';

abstract class Datasource<T extends Entity> extends Mapper<T> {
  final FirebaseFirestore firestore;
  late CollectionReference collection;

  Datasource(String _collection, this.firestore) {
    collection = firestore.collection(_collection);
  }

  Future<bool> addOrUpdate(T entity) async {
    await collection.doc(entity.id).set(toMap(entity));
    return true;
  }

  Future<T> getByid(String id) async {
    var result = await collection.doc(id).get();
    return fromMap(result.data() as Map);
  }

  Future<List<T>> getAll() async {
    var result = await collection.get();
    return result.docs.map((e) => fromMap(e.data() as Map)).toList();
  }

  Future<bool> removeById(String id) async {
    await collection.doc(id).delete();
    return true;
  }

  Future<Stream<List<T>>> getStream() async {
    var result = collection.snapshots();
    return result.map((analysis) =>
        analysis.docs.map((e) => fromMap(e.data() as Map)).toList());
  }
}

abstract class Mapper<T> {
  Map<String, dynamic> toMap(T entity);
  T fromMap(Map<dynamic, dynamic> map);
}
