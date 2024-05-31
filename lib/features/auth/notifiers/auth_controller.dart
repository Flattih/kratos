import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kratos/features/auth/repository/auth_repository.dart';

// In Real App, this user provider is very useful to get the user data in the whole app
final userProvider = StateProvider<User?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authRepository: ref.read(authRepoProvider));
});
final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.read(authControllerProvider.notifier);
  return authController.authStateChange;
});

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;

  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(false);

  // Firebase auth state change

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  // Sign up with email and password

  Future<bool> signUpWithEmailAndPassword(
      {required String email, required String password, required WidgetRef ref}) async {
    state = true;
    final user = await _authRepository.signUpWithEmailAndPassword(email: email, password: password);
    state = false;
    user.fold(
      (l) => Fluttertoast.showToast(msg: l.message),
      (userModel) => ref.read(userProvider.notifier).update((state) => userModel),
    );
    return user.isRight();
  }

  // Sign in with email and password
  Future<bool> signInWithEmailAndPassword(
      {required String email, required String password, required WidgetRef ref}) async {
    state = true;
    final user = await _authRepository.signInWithEmailAndPassword(email: email, password: password);
    state = false;
    user.fold(
      (l) => Fluttertoast.showToast(msg: l.message),
      (userModel) => ref.read(userProvider.notifier).update((state) => userModel),
    );
    return user.isRight();
  }

  //Logout
  Future<bool> logout() async {
    await _authRepository.logout();
    return true;
  }
}
