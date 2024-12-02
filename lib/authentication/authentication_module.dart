import 'package:flutter_dev_test/authentication/data/remote/repositories_impl/signin_repository_impl.dart';
import 'package:flutter_dev_test/authentication/presentation/blocs/signin/signin_bloc.dart';
import 'package:flutter_dev_test/authentication/presentation/views/login_page.dart';
import 'package:flutter_dev_test/authentication/presentation/views/recory_secret_page.dart';
import 'package:flutter_dev_test/core/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'data/datasources/recory_secret_datasource.dart';
import 'data/datasources/signin_datasource.dart';
import 'data/remote/repositories/recory_secret_repository.dart';
import 'data/remote/repositories/signin_repository.dart';
import 'data/remote/repositories_impl/recory_secret_repository_impl.dart';
import 'presentation/blocs/recory_secret/recory_secret_bloc.dart';
import 'presentation/controllers/input_secret_controller.dart';
import 'presentation/controllers/login_controller.dart';

class AuthenticationModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.add<RecorySecretDatasource>(RecorySecretDatasource.new);
    i.add<SigninRepositoryDatasource>(SigninRepositoryDatasource.new);
    i.add<SigninRepository>(SigninRepositoryImpl.new);
    i.add<RecorySecretRepository>(RecorySecretRepositoryImpl.new);
    i.addSingleton<RecorySecretBloc>(RecorySecretBloc.new);
    i.addSingleton<SigninBloc>(SigninBloc.new);
    i.addSingleton<LoginController>(LoginController.new);
    i.add<InputSecretController>(InputSecretController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/',
        child: (_) =>
            LoginPage(loginController: Modular.get<LoginController>()));
    r.child('/secretPage',
        child: (_) => RecorySecretPage(
            signinBloc: Modular.get<SigninBloc>(),
            bloc: Modular.get<RecorySecretBloc>(),
            inputSecretController: Modular.get<InputSecretController>()));
  }
}
