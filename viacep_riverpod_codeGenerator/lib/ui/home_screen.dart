import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_cep/providers/cep_provider.dart';
import 'package:flutter_cep/ui/widgets/address_widget.dart';
import 'package:flutter_cep/ui/widgets/cep_search_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cepState = ref.watch(cepNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de CEP'),
        leading: const Icon(Icons.location_city),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary.withValues(alpha: 0.1),
                    theme.colorScheme.secondary.withValues(alpha: 0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 4),
                  Icon(
                    Icons.search_rounded,
                    size: 48,
                    color: theme.colorScheme.primary,
                  ),
                  Text(
                    'Busque por qualquer CEP',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Digite o CEP e descubra o endereço completo',
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Widget de busca de CEP
            const CepSearchWidget(),

            // Exibir resultado se houver
            cepState.hasValue && cepState.value != null
                ? AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 1000),
                    child: AddressWidget(
                      cepModel: cepState.value!,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
