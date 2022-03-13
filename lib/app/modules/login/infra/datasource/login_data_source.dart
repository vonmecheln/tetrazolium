import 'package:tetrazolium/app/modules/login/infra/models/user_model.dart';

abstract class ILoginDataSource {
  Future<UserModel> loginPhone({required String phone});
  Future<UserModel> loginEmail(
      {required String email, required String password});
  Future<UserModel> validateCode(
      {required String verificationId, required String code});

  Future<UserModel> currentUser();

  Future<void> logout();
}
