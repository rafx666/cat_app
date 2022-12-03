import 'package:cat_app/models/cat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CatsRepository {
  Stream<List<CatModel>> getCatStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Uzytkownik nie zalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('cat_info')
        .orderBy('data', descending: true)
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return CatModel(
              id: doc.id,
              catName: doc['cat_name'],
              catAge: doc['age'].toString(),
              catFood: doc['cat_food'],
              vet: doc['vet'],
              others: doc['others'],
              catDate: doc['data'],
            );
          },
        ).toList();
      },
    );
  }

  Future<void> delete({required String id}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Uzytkownik nie zalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection("cat_info")
        .doc(id)
        .delete();
  }

  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }

  Future<void> add({
    required catName,
    required age,
    required catFood,
    required vet,
    required others,
    required data,
  }) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Uzytkownik nie zalogowany');
    }
    FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('cat_info')
        .add({
      'cat_name': catName,
      'age': age,
      'cat_food': catFood,
      'vet': vet,
      'others': others,
      'data': data,
    });
  }
}
