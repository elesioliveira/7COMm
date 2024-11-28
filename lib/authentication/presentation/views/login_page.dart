import 'package:flutter/material.dart';
import 'package:flutter_dev_test/authentication/presentation/blocs/signin/signin_state.dart';
import 'package:flutter_dev_test/authentication/presentation/controllers/login_controller.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_gaps.dart';
import '../../../core/utils/app_typography.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/shared/widgets/button_app.dart';
import '../widget/text_form_field_app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.loginController});

  final LoginController loginController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordIsVisibility = true;
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  void onChangedVisibilityPassword() {
    setState(() {
      passwordIsVisibility = !passwordIsVisibility;
    });
  }

  @override
  void dispose() {
    super.dispose();
    user.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            height: screen.height / 1,
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: DSGaps.hapV90(context)),
                Image.asset('assets/logo.png', scale: 1.8),
                SizedBox(height: DSGaps.hapV20(context)),
                AppTextFromFieldWidget(
                  controller: user,
                  hintText: 'E-mail',
                ),
                SizedBox(height: DSGaps.hapV20(context)),
                AppTextFromFieldWidget(
                  isVisibilityPasswrod: passwordIsVisibility,
                  onChanged: (p0) {
                    setState(() {});
                  },
                  controller: password,
                  suffix: password.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            onChangedVisibilityPassword();
                          },
                          child: Icon(passwordIsVisibility
                              ? Icons.visibility_off_outlined
                              : Icons.visibility),
                        )
                      : null,
                  hintText: 'Senha',
                ),
                SizedBox(height: DSGaps.hapV20(context)),
                // submit
                BlocBuilder(
                  bloc: widget.loginController.signinBloc,
                  builder: (context, state) {
                    if (state is SigninLoading) {
                      return AppButton(
                          childButton: const CircularProgressIndicator(),
                          backgroundColor: AppColors.secondary,
                          onTap: null);
                    } else {
                      return AppButton(
                        childButton: const Text(
                          'Entrar',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: AppColors.primary,
                        onTap: () async {
                          widget.loginController.submitAuthentication(context,
                              user: user.text, password: password.text);
                        },
                      );
                    }
                  },
                ),
                //restart password
                const Expanded(child: SizedBox()),
                Text('Esqueci a senha',
                    style: normal(color: AppColors.primary)),
                SizedBox(height: DSGaps.hapV50(context))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
