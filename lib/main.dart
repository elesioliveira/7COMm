import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/app_colors.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: MaterialApp.router(
        title: 'Dev Flutter Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
        ),
        routerConfig: Modular.routerConfig,
      ),
    );
  }
}
