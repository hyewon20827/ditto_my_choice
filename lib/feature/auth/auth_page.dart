import 'package:ditto/domain/entity/Auth/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Authpage extends ConsumerWidget {
  const Authpage({
    super.key,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final state =
    ref.watch(authViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: state.when(
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },

        error: (error, stackTrace) {
          print(error);

          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },

        data: (auth) {
          return Center(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Text(auth.accessToken),
                Text(auth.user.nickname),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(
                      authViewModelProvider
                          .notifier,
                    );
                        // .refreshUser();
                  },
                  child: const Text('새로고침'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}