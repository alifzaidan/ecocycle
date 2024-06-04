import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecocycle/models/user_model.dart';

CollectionReference user = FirebaseFirestore.instance.collection('users');

class DbUser {
  static Stream<QuerySnapshot> getData() {
    return user.snapshots();
  }

  static Future<void> addData({required UserModel itemuser}) async {
    await user.add(itemuser.toJson());
  }

  static Future<void> updateData(
      {required DocumentSnapshot snapshot, required UserModel itemuser}) async {
    await user.doc(snapshot.id).update(itemuser.toJson());
  }

  static Future<List<QueryDocumentSnapshot<Object?>>> getUserByEmail(
      String email) {
    return user
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.docs);
  }

  static Future<void> deleteData(DocumentSnapshot<Object?> itemuser) async {
    await user.doc(itemuser.id).delete();
  }
}
