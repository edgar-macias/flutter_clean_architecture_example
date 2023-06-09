import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/either.dart';
import '../../domain/enums.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/authentication_repository.dart';

const _key = 'sessionId';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FlutterSecureStorage _secureStorage;

  AuthenticationRepositoryImpl(this._secureStorage);

  @override
  Future<bool> get isSignedIn async {
    final sessionId = await _secureStorage.read(key: _key);
    return sessionId != null;
  }

  @override
  Future<User?> getUserData() => Future.value(User());

  @override
  Future<Either<SignInFailure, User>> signIn(
    String username,
    String password,
  ) async {
    if (username != 'test') {
      return Either.left(SignInFailure.notFound);
    }

    if (password != '123456') {
      return Either.left(SignInFailure.unauthorized);
    }

    await _secureStorage.write(key: _key, value: '123');

    return Either.right(User());
  }

  @override
  Future<void> signOut() async {
    return _secureStorage.delete(key: _key);
  }
}
