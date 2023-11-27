import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pisiit/models/request_model.dart';
import 'package:pisiit/models/user_model.dart';
import 'package:uuid/uuid.dart';

final chatRepositoryProvider = Provider(
  (ref) => ChatRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class ChatRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  ChatRepository({
    required this.auth,
    required this.firestore,
  });

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
              nameSender: user.name,
              opener: requestModel.opener,
              timeRequest: requestModel.timeRequest));
        }
        return requests;
      },
    );
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
        nameSender: "",
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

  void cancelRequest({
    required String requestId,
    required String userId,
  }) {
    firestore
        .collection("Users")
        .doc(userId)
        .collection("Requests")
        .doc(requestId)
        .delete();
  }
}
