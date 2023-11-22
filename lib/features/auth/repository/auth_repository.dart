import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pisiit/models/user_model.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({
    required this.auth,
    required this.firestore,
  });

  Future<UserModel?> getCurrentUserData() async {
    var userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();

    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Convert Firebase User to UserModel
      UserModel userModel = UserModel(
          username: '',
          uid: result.user!.uid,
          email: result.user!.email!,
          profileImageUrl: '',
          active: false,
          lastSeen: 0);

      return userModel;
    } catch (error) {
      print("Error signing in: $error");
      return null;
    }
  }

  void signUpWithEmailAndPassword(String email, String password) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Convert Firebase User to UserModel
      UserModel userModel = UserModel(
          uid: result.user!.uid,
          email: result.user!.email!,
          profileImageUrl: '',
          active: false,
          lastSeen: 0,
          username: '');
    } on FirebaseAuthException catch (error) {
      print("Error signing up: $error");
      return null;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<void> saveUserDataToFirebase(
      String username, String profileImageUrl) async {
    try {
      // Reference to the user's document in Firestore
      DocumentReference userRef = firestore.collection('users').doc();

      // Data to update in the user's document
      Map<String, dynamic> userData = {
        'username': username,
        'profileImageUrl': profileImageUrl ?? '',
        // Add any other fields you want to save
      };

      // Update the user's document in Firestore
      await userRef.set(userData, SetOptions(merge: true));
    } catch (error) {
      print("Error saving user data: $error");
      // Handle the error accordingly
    }
  }
}
