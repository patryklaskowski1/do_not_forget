import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_not_forget/models/item_model.dart';

class ItemsRepository {
  Stream<List<ItemModel>> getItemsStream() {
    return FirebaseFirestore.instance
        .collection('items')
        .orderBy('release_date')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return ItemModel(
            id: doc.id,
            title: doc['title'],
            description: doc['description'],
            releaseDate: (doc['release_date'] as Timestamp).toDate(),
          );
        },
      ).toList();
    });
  }

  Future<void> delete({required String id}) async {
    await FirebaseFirestore.instance.collection('items').doc(id).delete();
  }

  Future<void> add(
    String title,
    String description,
    DateTime releaseDate,
  ) async {
    await FirebaseFirestore.instance.collection('items').add(
      {
        'title': title,
        'description': description,
        'release_date': releaseDate,
      },
    );
  }

  Future<ItemModel> get({required String id}) async {
    final doc =
        await FirebaseFirestore.instance.collection('items').doc(id).get();
    return ItemModel(
      id: doc.id,
      title: doc['title'],
      description: doc['description'],
      releaseDate: (doc['release_date'] as Timestamp).toDate(),
    );
  }
}
