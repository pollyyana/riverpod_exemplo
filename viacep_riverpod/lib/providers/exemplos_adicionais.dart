import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/cep_model.dart';
import '../repositories/cep_repository.dart';
import 'cep_provider.dart'; // Importando o provider principal

// ===== EXEMPLOS ADICIONAIS PARA ESTUDO =====

// 1. FutureProvider - Para operações assíncronas simples
final cepFutureProvider = FutureProvider.family<CepModel, String>((ref, cep) async {
  final repository = ref.read(cepRepositoryProvider);
  return await repository.consultarCep(cep);
});

// 2. Provider com dependência de outro provider
final httpClientProvider = Provider<http.Client>((ref) {
  return http.Client();
});

final cepRepositoryWithClientProvider = Provider<CepRepository>((ref) {
  final client = ref.watch(httpClientProvider);
  return CepRepository(client: client);
});

// 3. StateProvider - Para estado simples
final cepDigitadoProvider = StateProvider<String>((ref) => '');

// 4. Provider que combina múltiplos estados
final cepCompletoProvider = Provider<AsyncValue<CepModel?>>((ref) {
  final cepDigitado = ref.watch(cepDigitadoProvider);
  
  if (cepDigitado.isEmpty) {
    return const AsyncValue.data(null);
  }
  
  return ref.watch(cepFutureProvider(cepDigitado));
});

// 5. StateNotifier com estado mais complexo
class CepHistoricoNotifier extends StateNotifier<List<CepModel>> {
  CepHistoricoNotifier() : super([]);

  void adicionarCep(CepModel cep) {
    if (!state.contains(cep)) {
      state = [...state, cep];
    }
  }

  void removerCep(CepModel cep) {
    state = state.where((c) => c.cep != cep.cep).toList();
  }

  void limparHistorico() {
    state = [];
  }
}

final cepHistoricoProvider = StateNotifierProvider<CepHistoricoNotifier, List<CepModel>>((ref) {
  return CepHistoricoNotifier();
});

// 6. Provider que filtra dados
final cepsPorEstadoProvider = Provider.family<List<CepModel>, String>((ref, estado) {
  final historico = ref.watch(cepHistoricoProvider);
  return historico.where((cep) => cep.uf == estado).toList();
});

// 7. Computed Provider (combina múltiplos providers)
final estatisticasProvider = Provider<Map<String, dynamic>>((ref) {
  final historico = ref.watch(cepHistoricoProvider);
  
  if (historico.isEmpty) {
    return {
      'total': 0,
      'estados': {},
      'cidades': {},
    };
  }

  final estados = <String, int>{};
  final cidades = <String, int>{};

  for (final cep in historico) {
    estados[cep.uf] = (estados[cep.uf] ?? 0) + 1;
    cidades[cep.localidade] = (cidades[cep.localidade] ?? 0) + 1;
  }

  return {
    'total': historico.length,
    'estados': estados,
    'cidades': cidades,
  };
});

// 8. Provider com seletores (para performance)
final totalCepsProvider = Provider<int>((ref) {
  return ref.watch(cepHistoricoProvider).length;
});

final estadosUnicosProvider = Provider<Set<String>>((ref) {
  return ref.watch(cepHistoricoProvider).map((cep) => cep.uf).toSet();
});

// 9. Provider que simula cache
class CacheNotifier extends StateNotifier<Map<String, CepModel>> {
  CacheNotifier() : super({});

  void adicionarCache(String cep, CepModel model) {
    state = {...state, cep: model};
  }

  CepModel? buscarCache(String cep) {
    return state[cep];
  }

  void limparCache() {
    state = {};
  }
}

final cacheProvider = StateNotifierProvider<CacheNotifier, Map<String, CepModel>>((ref) {
  return CacheNotifier();
});

// 10. Provider que combina cache com busca
final cepComCacheProvider = FutureProvider.family<CepModel, String>((ref, cep) async {
  final cache = ref.read(cacheProvider);
  final cacheNotifier = ref.read(cacheProvider.notifier);
  
  // Verifica se está no cache
  if (cache.containsKey(cep)) {
    return cache[cep]!;
  }
  
  // Busca na API
  final repository = ref.read(cepRepositoryProvider);
  final cepModel = await repository.consultarCep(cep);
  
  // Adiciona ao cache
  cacheNotifier.adicionarCache(cep, cepModel);
  
  return cepModel;
});
