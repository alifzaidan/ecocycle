import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecocycle/models/history_model.dart';

CollectionReference history = FirebaseFirestore.instance.collection('history');

class DbHistory {
  static Stream<QuerySnapshot> getData() {
    return history.snapshots();
  }

  static Future<void> addData({required HistoryModel itemhistory}) async {
    await history.add(itemhistory.toJson());
  }

  static Future<void> deleteData(DocumentSnapshot<Object?> itemhistory) async {
    await history.doc(itemhistory.id).delete();
  }
}
