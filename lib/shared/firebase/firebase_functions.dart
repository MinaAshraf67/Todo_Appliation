import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFunctions {
  void addTask() {
    FirebaseFirestore.instance.collection("Tasks");
  }
}
