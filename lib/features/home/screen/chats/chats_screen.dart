import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pisiit/features/auth/controller/auth_controller.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return ElevatedButton(
              onPressed: () {
                ref.read(authControllerProvider).signOut(context);
              },
              child: Text("out"),
            );
          },
        ),
      ),
    );
  }
}
