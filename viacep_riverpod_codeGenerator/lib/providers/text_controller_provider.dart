import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

part 'text_controller_provider.g.dart';

@riverpod
class CepTextController extends _$CepTextController {
  @override
  TextEditingController build() {
    final controller = TextEditingController();
    ref.onDispose(() {
      controller.dispose();
    });
    return controller;
  }
}

@riverpod
MaskTextInputFormatter cepFormatter(CepFormatterRef ref) {
  return MaskTextInputFormatter(
    mask: '#####-###',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}
