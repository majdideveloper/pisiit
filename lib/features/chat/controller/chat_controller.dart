import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pisiit/features/chat/repository/chat_repository.dart';
import 'package:pisiit/models/request_model.dart';

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
  }) {
    chatRepository.sendRequest(
        recieverUserId: recieverUserId,
        message: message,
        currentUserId: currentUserId);
  }

  Stream<List<RequestModel>> getAllRequest() {
    return chatRepository.getAllRequest();
  }
}
