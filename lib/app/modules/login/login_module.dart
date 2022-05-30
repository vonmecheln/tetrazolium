import 'package:tetrazolium/app/modules/login/presenter/utils/input_store.dart';
import 'package:tetrazolium/app/modules/login/presenter/pages/login/login_page.dart';

// import 'external/datasource/firebase_datasource.dart';
// import 'package:tetrazolium/app/modules/login/infra/repositories/login_repository_impl.dart';
// import 'package:tetrazolium/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:tetrazolium/app/modules/login/presenter/pages/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => InputStore()),
    $LoginStore,
    // $LoginWithEmail,
    // $LoginRepositoryImpl,
    // $FirebaseDataSourceImpl,
    // $FirebaseDataSourceImpl,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
