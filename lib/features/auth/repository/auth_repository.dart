import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kratos/core/failure.dart';
import 'package:kratos/core/type_defs.dart';

final authRepoProvider = Provider<AuthRepository>((ref) => AuthRepository(firebaseAuth: FirebaseAuth.instance));

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  AuthRepository({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  // Firebase auth state change
  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  // Sign in with email and password
  FutureEither<User?> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return Right(userCredential.user);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? ''));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  // Sign up with email and password
  FutureEither<User?> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return Right(userCredential.user);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? ''));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //Logout
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
