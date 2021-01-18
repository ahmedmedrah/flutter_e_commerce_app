import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference categoryCollectionReference =
      FirebaseFirestore.instance.collection('Categories');

  Future<List<QueryDocumentSnapshot>> getCategories() async {
    var value = await categoryCollectionReference.get();
    return value.docs;
  }

  final CollectionReference productCollectionReference =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await productCollectionReference.get();
    return value.docs;
  }
}
