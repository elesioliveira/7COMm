import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/authentication/presentation/blocs/recory_secret/recory_secret_state.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_gaps.dart';
import '../../../core/utils/app_typography.dart';
import '../blocs/recory_secret/recory_secret_bloc.dart';
import '../blocs/signin/signin_bloc.dart';
import '../controllers/input_secret_controller.dart';
import '../../../core/shared/widgets/button_app.dart';
import '../widget/input_secret_app.dart';

class RecorySecretPage extends StatefulWidget {
  const RecorySecretPage(
      {super.key,
      required this.inputSecretController,
      required this.bloc,
      required this.signinBloc});
  final InputSecretController inputSecretController;
  final RecorySecretBloc bloc;
  final SigninBloc signinBloc;

  @override
  State<RecorySecretPage> createState() => _RecorySecretPageState();
}

class _RecorySecretPageState extends State<RecorySecretPage> {
  TextEditingController teste = TextEditingController();

  void submitSecretRecory() async {
    await widget.bloc.recorySecret(
        user: widget.signinBloc.userBloc,
        password: widget.signinBloc.passwordBloc,
        code: widget.inputSecretController.code,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: const Icon(CupertinoIcons.chevron_back)),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            height: screenSize.height / 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: DSGaps.hapV40(context)),
                Text('Verificação',
                    style: normal(fontWeight: FontWeight.w500, fontSize: 20)),
                SizedBox(height: DSGaps.hapV10(context)),
                Text('Insira o código que foi enviado:', style: subTitle()),
                SizedBox(height: DSGaps.hapV50(context)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InputSecretApp(
                        focusNode: widget.inputSecretController.focusFirst,
                        // absoverPoint: false,
                        controller:
                            widget.inputSecretController.inputSecretFirst,
                        onChanged: (String data) {
                          setState(() {
                            widget.inputSecretController.onChangedFocusInput(
                                data: data, index: 0, context: context);
                          });
                        },
                      ),
                      SizedBox(width: DSGaps.gapH20(context)),
                      InputSecretApp(
                        focusNode: widget.inputSecretController.focusSecond,
                        absoverPoint: widget.inputSecretController
                            .inputSecretFirst.text.isEmpty,
                        controller:
                            widget.inputSecretController.inputSecretSecond,
                        onChanged: (String data) {
                          setState(() {
                            widget.inputSecretController.onChangedFocusInput(
                                data: data, index: 1, context: context);
                          });
                        },
                      ),
                      SizedBox(width: DSGaps.gapH20(context)),
                      InputSecretApp(
                        focusNode: widget.inputSecretController.focusThird,
                        absoverPoint: widget.inputSecretController
                            .inputSecretSecond.text.isEmpty,
                        controller:
                            widget.inputSecretController.inputSecretThird,
                        onChanged: (String data) {
                          setState(() {
                            widget.inputSecretController.onChangedFocusInput(
                                data: data, index: 2, context: context);
                          });
                        },
                      ),
                      SizedBox(width: DSGaps.gapH20(context)),
                      InputSecretApp(
                        focusNode: widget.inputSecretController.focusFourth,
                        absoverPoint: widget.inputSecretController
                            .inputSecretThird.text.isEmpty,
                        controller:
                            widget.inputSecretController.inputSecretFourth,
                        onChanged: (String data) {
                          setState(() {
                            widget.inputSecretController.onChangedFocusInput(
                                data: data, index: 3, context: context);
                          });
                        },
                      ),
                      SizedBox(width: DSGaps.gapH20(context)),
                      InputSecretApp(
                        focusNode: widget.inputSecretController.focusFifth,
                        absoverPoint: widget.inputSecretController
                            .inputSecretFourth.text.isEmpty,
                        controller:
                            widget.inputSecretController.inputSecretFifith,
                        onChanged: (String data) {
                          setState(() {
                            widget.inputSecretController.onChangedFocusInput(
                                data: data, index: 4, context: context);
                          });
                        },
                      ),
                      SizedBox(width: DSGaps.gapH20(context)),
                      InputSecretApp(
                        focusNode: widget.inputSecretController.focusSixth,
                        absoverPoint: widget.inputSecretController
                            .inputSecretFifith.text.isEmpty,
                        controller:
                            widget.inputSecretController.inputSecretSixth,
                        onChanged: (String data) {
                          setState(() {
                            widget.inputSecretController.onChangedFocusInput(
                                data: data, index: 5, context: context);
                          });
                        },
                      ),
                      SizedBox(width: DSGaps.gapH20(context)),
                    ]),
                SizedBox(height: DSGaps.hapV50(context)),
                BlocBuilder(
                  bloc: widget.bloc,
                  builder: (context, state) {
                    if (state is RecorySecretStateLoading) {
                      return AppButton(
                          childButton: const CircularProgressIndicator(),
                          backgroundColor: AppColors.secondary,
                          onTap: null);
                    } else {
                      return AppButton(
                        childButton: const Text(
                          'Confirmar',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: widget.inputSecretController.inputSecretSixth
                                .text.isEmpty
                            ? null
                            : () async {
                                widget.inputSecretController
                                    .innerJoinTextEditingSecretCode();
                                submitSecretRecory();
                              },
                        backgroundColor: widget.inputSecretController
                                .inputSecretSixth.text.isEmpty
                            ? AppColors.secondary
                            : AppColors.primary,
                      );
                    }
                  },
                ),
                SizedBox(height: DSGaps.hapV50(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.question_square),
                    SizedBox(width: DSGaps.gapH20(context)),
                    Text('Não recebi o código', style: normal())
                  ],
                ),
                const Expanded(child: SizedBox())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
