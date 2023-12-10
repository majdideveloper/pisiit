import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pisiit/models/request_model.dart';
import 'package:pisiit/models/user_model.dart';
import 'package:uuid/uuid.dart';

final homeRepositoryProvider = Provider(
  (ref) => HomeRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class HomeRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  HomeRepository({
    required this.auth,
    required this.firestore,
  });

  Stream<List<UserModel>> getAllUsers() {
    return firestore.collection("Users").snapshots().asyncMap((event) async {
      List<UserModel> users = [];
      for (var document in event.docs) {
        var userModel = UserModel.fromMap(document.data());
        if (auth.currentUser!.uid != userModel.uid) {
          users.add(userModel);
        }
      }
      return users;
    });
  }

  Future<List<UserModel>?> fetchAllUser() async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection('Users')
        .where("uid", isNotEqualTo: auth.currentUser!.uid)
        .get();

    List<UserModel>? listUsers;
    if (querySnapshot.docs != null) {
      listUsers = querySnapshot.docs
          .map((doc) => UserModel.fromMap(doc.data()))
          .toList();
    }
    return listUsers;
  }

  Stream<int> numberRequest() {
    return firestore
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .collection("Requests")
        .snapshots()
        .map((event) => event.size);
  }

// this new function about see button send Request in two sense....
  Future<bool> canSendRequest(String userId) async {
    DocumentSnapshot snapshot1 = await firestore
        .collection("Users")
        .doc(userId) //auth.currentUser!.uid)
        .collection('Requests')
        .doc(auth.currentUser!.uid) //userId)
        .get();

    DocumentSnapshot snapshot2 = await firestore
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .collection('Requests')
        .doc(userId)
        .get();

    return snapshot1.exists || snapshot2.exists;
  }
}
