import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/user_model.dart';

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

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
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

  static Future<void> addUserToFirestorer(UserModel userModel) {
    var collection = getUsersCollection();
    var docRef = collection.doc(userModel.id);

    return docRef.set(userModel);
  }

  static Future<void> createUser(
    String name,
    int age,
    String emailAddress,
    String password,
    Function onSuccess,
    Function onError,
  ) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (credential.user?.uid != null) {
        UserModel user = UserModel(
            id: credential.user!.uid,
            name: name,
            email: emailAddress,
            age: age);
        addUserToFirestorer(user).then((value) {
          onSuccess();
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);

        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> login(String emailAddress, String password,
      Function onSuccess, Function onError) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      if (credential.user?.uid != null) {
        var user = await readUserFromFirestore(credential.user!.uid);
        onSuccess(user);
      }
    } on FirebaseAuthException catch (e) {
      onError("Wrong Email or Password");

      // if (e.code == 'user-not-found') {
      //   print('Username or password is wrong.');
      // }
    }
  }

  static Future<UserModel?> readUserFromFirestore(String id) async {
    DocumentSnapshot<UserModel> doc = await getUsersCollection().doc(id).get();
    return doc.data();
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
