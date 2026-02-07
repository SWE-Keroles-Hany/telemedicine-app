// data/datasources/auth_remote_data_source.dart

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/firbase_errors.dart';
import '../models/user_model.dart';
import 'auth_remote_data_source.dart';

class AuthFirebaseDataSource implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthFirebaseDataSource(this._firebaseAuth);

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user!;
      return UserModel(uid: user.uid, email: user.email ?? '');
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      log(e.toString());
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> register({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user!;
      return UserModel(uid: user.uid, email: user.email ?? '');
    } on FirebaseAuthException catch (errorCode) {
      throw Exception(errorCode.code);
    } catch (errorCode) {
      throw Exception(errorCode.toString());
    }
  }
}
