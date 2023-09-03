import 'package:cloud_firestore/cloud_firestore.dart';

import '../../modles/task_model.dart';

class FirestoreUtils {
  static CollectionReference getCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) =>
              TaskModel.FromFirestore(snapshot.data()!),
          toFirestore: (taskModel, _) => taskModel.toFirestore(),
        );
  }

  static Future<void> addTask(TaskModel taskModel) async {
    var collection = getCollection();
    var doc = collection.doc();
    taskModel.id = doc.id;
    doc.set(taskModel);
  }
}
