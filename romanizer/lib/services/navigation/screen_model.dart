import 'package:flutter/material.dart';

class ScreenModel {
  final int index;
  final String label;
  final Widget screenContent;

  const ScreenModel(
      {required this.index, required this.label, required this.screenContent});
}
