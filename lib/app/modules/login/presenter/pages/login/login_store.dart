import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tetrazolium/app/modules/login/domain/entities/login_credential.dart';
import 'package:tetrazolium/app/modules/login/presenter/utils/input_store.dart';

part 'login_store.g.dart';

@Injectable()
class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  // final ILoginWithEmail loginWithEmailUsecase;

  // _LoginStoreBase(this.loginWithEmailUsecase);

  InputStore inputStorePass = LoginInputStorePass();
  InputStore inputStoreEmail = LoginInputStoreEmail();

  @observable
  String email = "";

  @action
  setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  setPassword(String value) => password = value;

  @computed
  LoginCredential get credential => LoginCredential.withEmailAndPassword(
        email: email,
        password: password,
      );

  @computed
  bool get isValid => credential.isValidEmail && credential.isValidPassword;

  enterEmail() async {
    // loading.show();
    // await Future.delayed(Duration(seconds: 1));
    // var result = await loginWithEmailUsecase(credential);
    // await loading.hide();
    // result.fold((failure) {
    //   asuka.showSnackBar(SnackBar(content: Text(failure.message)));
    // }, (user) {
    //   authStore.setUser(user);
    //   Modular.to.popUntil(ModalRoute.withName(Modular.link.modulePath));
    //   Modular.to.pop();
    // });
  }
}
