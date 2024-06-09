import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecocycle/models/notif_model.dart';

CollectionReference notification =
    FirebaseFirestore.instance.collection('notifications');

class DbNotification {
  static Stream<QuerySnapshot> getData() {
    return notification.snapshots();
  }

  static Future<void> addData(
      {required NotificationModel itemnotification}) async {
    await notification.add(itemnotification.toJson());
  }

  static Future<void> deleteData(
      DocumentSnapshot<Object?> itemnotification) async {
    await notification.doc(itemnotification.id).delete();
  }
}
