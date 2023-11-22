import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String username;
  final String uid;
  final String profileImageUrl;
  final bool active;
  final int lastSeen;
  final String email;

  UserModel(
      {required this.username,
      required this.uid,
      required this.profileImageUrl,
      required this.active,
      required this.lastSeen,
      required this.email});

  static UserModel fromSnap(DocumentSnapshot snap) {
    Map<String, dynamic> data = snap.data() as Map<String, dynamic>;

    return UserModel(
      uid: data['uid'],
      email: data['email'],
      username: data['username'],
      profileImageUrl: data['profileImageUrl'],
      active: data['active'],
      lastSeen: data['lastSeen'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'uid': uid,
      'profileImageUrl': profileImageUrl,
      'active': active,
      'lastSeen': lastSeen,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      uid: map['uid'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      active: map['active'] ?? false,
      lastSeen: map['lastSeen'] ?? 0,
      email: map['email'] ?? '',
    );
  }
}
