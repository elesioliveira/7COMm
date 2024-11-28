import 'package:flutter/material.dart';

class InputSecretController {
  String code = '';
  List<String> listIndex = [];
  TextEditingController inputSecretFirst = TextEditingController();
  TextEditingController inputSecretSecond = TextEditingController();
  TextEditingController inputSecretThird = TextEditingController();
  TextEditingController inputSecretFourth = TextEditingController();
  TextEditingController inputSecretFifith = TextEditingController();
  TextEditingController inputSecretSixth = TextEditingController();
  final FocusNode focusFirst = FocusNode();
  final FocusNode focusSecond = FocusNode();
  final FocusNode focusThird = FocusNode();
  final FocusNode focusFourth = FocusNode();
  final FocusNode focusFifth = FocusNode();
  final FocusNode focusSixth = FocusNode();

  String innerJoinTextEditingSecretCode() {
    for (var element in listIndex) {
      code += element;
    }
    return code;
  }

  void onChangedFocusInput(
      {required String data,
      required int index,
      required BuildContext context}) {
    if (data == '') {
      switch (index) {
        case 0:
          focusFirst.unfocus();
          listIndex.removeAt(index);
          break;
        case 1:
          focusSecond.unfocus();
          FocusScope.of(context).requestFocus(focusFirst);
          listIndex.removeAt(index);
          break;
        case 2:
          focusThird.unfocus();
          FocusScope.of(context).requestFocus(focusSecond);
          listIndex.removeAt(index);
          break;
        case 3:
          focusFourth.unfocus();
          FocusScope.of(context).requestFocus(focusThird);
          listIndex.removeAt(index);
          break;
        case 4:
          focusFifth.unfocus();
          FocusScope.of(context).requestFocus(focusFourth);
          listIndex.removeAt(index);
          break;
        case 5:
          focusSixth.unfocus();
          FocusScope.of(context).requestFocus(focusFifth);
          listIndex.removeAt(index);
          break;
        default:
          print('Error on changed in inputs');
          return;
      }
      return;
    }
    if (data != '') {
      switch (index) {
        case 0:
          focusFirst.unfocus();
          listIndex.add(data);
          FocusScope.of(context).requestFocus(focusSecond);
          break;
        case 1:
          focusSecond.unfocus();
          listIndex.add(data);
          FocusScope.of(context).requestFocus(focusThird);
          break;
        case 2:
          focusThird.unfocus();
          listIndex.add(data);
          FocusScope.of(context).requestFocus(focusFourth);
          break;
        case 3:
          focusFourth.unfocus();
          listIndex.add(data);
          FocusScope.of(context).requestFocus(focusFifth);
          break;
        case 4:
          focusFifth.unfocus();
          listIndex.add(data);
          FocusScope.of(context).requestFocus(focusSixth);
          break;
        case 5:
          focusSixth.unfocus();
          listIndex.add(data);
          break;
        default:
          print('Error on changed in inputs');
          return;
      }
      return;
    }
  }
}
