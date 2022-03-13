import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:tetrazolium/app/modules/login/domain/entities/login_credential.dart';
import 'package:tetrazolium/app/modules/login/domain/errors/errors.dart';
import 'package:tetrazolium/app/modules/login/domain/repositories/login_repository.dart';

part 'login_with_email.g.dart';

abstract class ILoginWithEmail {
  Future<Either<Exception, LoggedUserInfo>> call(LoginCredential credential);
}

@Injectable(singleton: false)
class LoginWithEmail extends ILoginWithEmail {
  final ILoginRepository repository;

  LoginWithEmail(this.repository);

  @override
  Future<Either<Exception, LoggedUserInfo>> call(
    LoginCredential credential,
  ) async {
    if (!credential.isValidEmail) {
      return Left(ErrorLoginEmail(message: "Invalid Email"));
    } else if (!credential.isValidPassword) {
      return Left(ErrorLoginEmail(message: "Invalid Password"));
    }

    return await repository.loginEmail(
      email: credential.email,
      password: credential.password,
    );
  }
}
