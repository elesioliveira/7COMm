import 'package:flutter_dev_test/authentication/authentication_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home/presentation/view/home_page.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: AuthenticationModule());
    r.child('/home', child: (_) => const HomePage());
  }
}
