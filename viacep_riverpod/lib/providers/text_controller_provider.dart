import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// Provider para o TextEditingController
final cepTextControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  
  // Limpa o controller quando o provider for descartado
  ref.onDispose(() {
    controller.dispose();
  });
  
  return controller;
});

// Provider para o formatter
final cepFormatterProvider = Provider<MaskTextInputFormatter>((ref) {
  return MaskTextInputFormatter(
    mask: '#####-###',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
});
