import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pisiit/features/auth/repository/auth_repository.dart';
import 'package:pisiit/models/user_model.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});

final userInfoAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authRepositoryProvider);
  return authController.getCurrentUserData();
});

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;
  AuthController({
    required this.authRepository,
    required this.ref,
  });

  Future<UserModel?> getCurrentUserInfo() async {
    UserModel? user = await authRepository.getCurrentUserData();
    return user;
  }

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    UserModel? user = await authRepository.signInWithEmailAndPassword(
      email,
      password,
    );
    return user;
  }

  void signUpWithEmailAndPassword(String email, String password) async {
    return authRepository.signUpWithEmailAndPassword(email, password);
  }

  Future<void> signOut() async {
    await authRepository.signOut();
  }

  Future<void> saveUserDataToFirebase(
      String username, String profileImageUrl) async {
    authRepository.saveUserDataToFirebase(username, profileImageUrl);
  }
}
