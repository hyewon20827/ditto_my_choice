import 'package:ditto/data/repository/auth_repository_impl.dart';
import 'package:ditto/domain/entity/Auth/dev_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repository/user_repository_impl.dart';
import 'social_login.dart';

final authViewModelProvider =
AsyncNotifierProvider<AuthViewModel, DevLogin>(
  AuthViewModel.new,
);

class AuthViewModel extends AsyncNotifier<DevLogin> {


  @override
  Future<DevLogin> build() {
    final repository = ref.watch(authRepositoryProvider);
    // return repository.socialLogin("GOOGLE", '40180677988bd9050b5c99cd1402055ca9726c14397025594eeb434720e0fcd5');
    return repository.getDevToken('40180677988bd9050b5c99cd1402055ca9726c14397025594eeb434720e0fcd5');
  }
}