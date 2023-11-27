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

    //     UserModel? user;
    // if (userData.data() != null) {
    //   user = UserModel.fromMap(userData.data()!);
    // }
    // return user;
  }

  void sendRequest({
    required String recieverUserId,
    required String message,
    required String currentUserId,
  }) {
    var timeSent = DateTime.now();
    var requestId = const Uuid().v1();

    final RequestModel request = RequestModel(
        uid: requestId,
        currentUserUid: currentUserId,
        recepieUserUid: recieverUserId,
        imageSender: "",
        opener: message,
        timeRequest: timeSent);

    firestore
        .collection("Users")
        .doc(recieverUserId)
        .collection("Requests")
        .doc(requestId)
        .set(request.toMap());
    firestore
        .collection("Users")
        .doc(currentUserId)
        .update({"numberPisit": -1});
  }

  // Stream<List<ChatContact>> getChatContacts() {
  //   return firestore
  //       .collection('users')
  //       .doc(auth.currentUser!.uid)
  //       .collection('chats')
  //       .snapshots()
  //       .asyncMap((event) async {
  //     List<ChatContact> contacts = [];
  //     for (var document in event.docs) {
  //       var chatContact = ChatContact.fromMap(document.data());
  //       var userData = await firestore
  //           .collection('users')
  //           .doc(chatContact.contactId)
  //           .get();
  //       var user = UserModel.fromMap(userData.data()!);

  //       contacts.add(
  //         ChatContact(
  //           name: user.name,
  //           profilePic: user.profilePic,
  //           contactId: chatContact.contactId,
  //           timeSent: chatContact.timeSent,
  //           lastMessage: chatContact.lastMessage,
  //         ),
  //       );
  //     }
  //     return contacts;
  //   });
  // }

  Stream<List<RequestModel>> getAllRequest() {
    return firestore
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .collection('Requests')
        .snapshots()
        .asyncMap(
      (event) async {
        List<RequestModel> requests = [];
        for (var document in event.docs) {
          var requestModel = RequestModel.fromMap(document.data());

          var userData = await firestore
              .collection('Users')
              .doc(requestModel.currentUserUid)
              .get();
          var user = UserModel.fromMap(userData.data()!);

          requests.add(RequestModel(
              uid: requestModel.uid,
              currentUserUid: requestModel.currentUserUid,
              recepieUserUid: requestModel.recepieUserUid,
              imageSender: user.imageURLs![0],
              opener: requestModel.opener,
              timeRequest: requestModel.timeRequest));
        }
        return requests;
      },
    );
  }
}
