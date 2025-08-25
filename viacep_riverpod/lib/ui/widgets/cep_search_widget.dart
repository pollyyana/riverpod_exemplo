import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_cep/providers/cep_provider.dart';
import 'package:flutter_cep/providers/text_controller_provider.dart';

class CepSearchWidget extends ConsumerWidget {
  const CepSearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cepState = ref.watch(cepNotifierProvider);
    final cepController = ref.watch(cepTextControllerProvider);
    final cepFormatter = ref.watch(cepFormatterProvider);

    Future<void> buscarCep() async {
      FocusScope.of(context).unfocus();
      final cep = cepController.text.trim();
      await ref.read(cepNotifierProvider.notifier).buscarCep(cep);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: cepController,
          keyboardType: TextInputType.number,
          maxLength: 9,
          inputFormatters: [cepFormatter],
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.location_on_rounded),
            labelText: 'CEP',
            hintText: 'Digite o CEP (ex: 01310-100)',
            counterText: '',
          ),
        ),
        const SizedBox(height: 24),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: cepState.isLoading
              ? Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Buscando CEP...',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : ElevatedButton.icon(
                  onPressed: buscarCep,
                  icon: const Icon(Icons.search_rounded),
                  label: const Text('Buscar CEP'),
                ),
        ),
        const SizedBox(height: 24),

        // Exibir erro se houver
        cepState.hasError
            ? Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: theme.colorScheme.error.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      color: theme.colorScheme.error,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        cepState.error.toString(),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.error,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
