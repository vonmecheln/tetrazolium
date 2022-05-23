import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/login/domain/errors/errors.dart';
import 'package:tetrazolium/app/modules/login/infra/models/user_model.dart';
import '../../infra/datasource/login_data_source.dart';

part 'firebase_datasource.g.dart';

@Injectable(singleton: false)
class FirebaseDataSourceImpl implements ILoginDataSource {
  final FirebaseAuth auth;

  FirebaseDataSourceImpl(this.auth);

  @override
  Future<UserModel> currentUser() async {
    var user = (auth.currentUser);

    if (user == null)
      throw ErrorGetLoggedUser(message: "Usuário não presentex");

    return UserModel(
      name: user.displayName ?? "",
      phoneNumber: user.phoneNumber ?? "",
      email: user.email ?? "",
    );
  }

  @override
  Future<UserModel> loginEmail(
      {required String email, required String password}) async {
    var result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    var user = result.user;
    return UserModel(
      name: user!.displayName ?? "",
      phoneNumber: user.phoneNumber ?? "",
      email: user.email ?? "",
    );
  }

  @override
  Future<UserModel> loginPhone({required String phone}) {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    return await auth.signOut();
  }

  @override
  Future<UserModel> validateCode({
    required String verificationId,
    required String code,
  }) {
    throw UnimplementedError();
  }
}
