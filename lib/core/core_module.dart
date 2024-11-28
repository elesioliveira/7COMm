import 'package:flutter_dev_test/core/shared/http_manager.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add(HttpManager.new);
  }
}
