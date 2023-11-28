import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pisiit/features/chat/repository/chat_repository.dart';
import 'package:pisiit/models/chat_contact_model.dart';
import 'package:pisiit/models/request_model.dart';
import 'package:pisiit/models/user_model.dart';

final chatControllerProvider = Provider((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return ChatController(chatRepository: chatRepository, ref: ref);
});

class ChatController {
  final ChatRepository chatRepository;
  final ProviderRef ref;
  ChatController({
    required this.chatRepository,
    required this.ref,
  });

  void sendRequest({
    required String recieverUserId,
    required String message,
    required String currentUserId,
    required UserModel senderUserModel,
  }) {
    chatRepository.sendRequest(
      recieverUserId: recieverUserId,
      message: message,
      currentUserId: currentUserId,
      senderUserModel: senderUserModel,
    );
  }

  void cancelRequest({
    required String requestId,
    required String userId,
  }) {
    return chatRepository.cancelRequest(
      requestId: requestId,
      userId: userId,
    );
  }

  void accepteRequest(
      {required UserModel senderUserData,
      required UserModel recieverUserData,
      required RequestModel requestModel}) {
    return chatRepository.accepteRequest(
        senderUserData: senderUserData,
        recieverUserData: recieverUserData,
        requestModel: requestModel);
  }

  Stream<List<RequestModel>> getAllRequest() {
    return chatRepository.getAllRequest();
  }

  Stream<List<ChatContactModel>> getAllChatcontact() {
    return chatRepository.getChatContacts();
  }
}
