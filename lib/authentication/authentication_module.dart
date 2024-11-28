import 'package:flutter_dev_test/authentication/data/remote/datasources_impl/signin_datasouce_impl.dart';
import 'package:flutter_dev_test/authentication/presentation/blocs/signin/signin_bloc.dart';
import 'package:flutter_dev_test/authentication/presentation/views/login_page.dart';
import 'package:flutter_dev_test/authentication/presentation/views/recory_secret_page.dart';
import 'package:flutter_dev_test/core/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../home/presentation/view/home_page.dart';
import 'data/remote/datasources/recory_secret_datasource.dart';
import 'data/remote/datasources/signin_datasource.dart';
import 'data/remote/datasources_impl/recory_secret_datasource_impl.dart';
import 'presentation/blocs/recory_secret/recory_secret_bloc.dart';
import 'presentation/controllers/input_secret_controller.dart';
import 'presentation/controllers/login_controller.dart';

class AuthenticationModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.add<SigninDatasource>(SigninDatasouceImpl.new);
    i.addSingleton<RecorySecretBloc>(RecorySecretBloc.new);
    i.addSingleton<LoginController>(LoginController.new);
    i.addSingleton<SigninBloc>(SigninBloc.new);
    i.add<RecorySecretDatasource>(RecorySecretDatasourceImpl.new);

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
    r.child('/home', child: (_) => const HomePage());
  }
}
