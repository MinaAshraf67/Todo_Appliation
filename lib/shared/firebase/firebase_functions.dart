import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) {
            return value.toJson();
          },
        );
  }

  static Future<void> addTasktoFireStore(TaskModel taskModel) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    taskModel.id = docRef.id;
    return docRef.set(taskModel);
  }

// Real-time changes
  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
    return getTasksCollection()
        .where("date",
            isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();
  }

  static void deleteTask(String id) {
    getTasksCollection().doc(id).delete();
  }

  static Future<void> updateTask(TaskModel taskModel) {
    return getTasksCollection().doc(taskModel.id).update(
          taskModel.toJson(),
        );
  }
}



// For one time read

//  static Future<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
//     return getTasksCollection()
//         .where("date",
//             isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
//         .get();
//   }
// }
