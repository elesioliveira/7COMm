import 'package:flutter/material.dart';

class DSGaps {
  static double gapH20(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.02; // Exemplo de 2% da largura
  }

  static double gapH50(BuildContext context) {
    return MediaQuery.of(context).size.width *
        0.055; // Exemplo de 2% da largura
  }

  static double gapH90(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.09; // Exemplo de 2% da largura
  }

  static double gapH130(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.13; // Exemplo de 2% da largura
  }

//GAPS VERTICAL

  static double hapV10(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.01;
  }

  static double hapV20(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.02;
  }

  static double hapV30(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.03;
  }

  static double hapV40(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.04;
  }

  static double hapV50(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.05;
  }

  static double hapV55(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.055;
  }

  static double hapV60(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.06;
  }

  static double hapV70(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.07;
  }

  static double hapV80(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.08;
  }

  static double hapV90(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.09;
  }
}
