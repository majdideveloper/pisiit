import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pisiit/features/home/repository/home_repository.dart';
import 'package:pisiit/models/request_model.dart';
import 'package:pisiit/models/user_model.dart';

final allUserControllerProvider = FutureProvider.autoDispose((ref) {
  final homeController = ref.watch(homeRepositoryProvider);
  return homeController.fetchAllUser();
});

final homeControllerProvider = Provider((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return HomeController(homeRepository: homeRepository, ref: ref);
});

class HomeController {
  final HomeRepository homeRepository;
  final ProviderRef ref;
  HomeController({
    required this.homeRepository,
    required this.ref,
  });

  Future<List<UserModel>?> fetchAllUser() async {
    List<UserModel>? listUser = await homeRepository.fetchAllUser();
    return listUser;
  }

  Future<bool> canSendRequest(String userId) async {
    return await homeRepository.canSendRequest(userId);
  }

  // void sendRequest({
  //   required String recieverUserId,
  //   required String message,
  //   required String currentUserId,
  // }) {
  //   homeRepository.sendRequest(
  //       recieverUserId: recieverUserId,
  //       message: message,
  //       currentUserId: currentUserId);
  // }

  Stream<List<UserModel>> getAllUsers() {
    return homeRepository.getAllUsers();
  }

  Stream<int> numberRequest() {
    return homeRepository.numberRequest();
  }

  // Stream<List<RequestModel>> getAllRequest() {
  //   return homeRepository.getAllRequest();
  // }
}
