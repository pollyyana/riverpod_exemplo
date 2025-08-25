import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/cep_model.dart';
import '../repositories/cep_repository.dart';

// Provider para o repositório
final cepRepositoryProvider = Provider<CepRepository>((ref) {
  return CepRepository(client: http.Client());
});

// Notifier para gerenciar o estado do CEP
class CepNotifier extends StateNotifier<AsyncValue<CepModel?>> {
  final CepRepository _repository;

  CepNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> buscarCep(String cep) async {
    if (cep.trim().isEmpty) {
      state = AsyncValue.error('Digite um CEP válido!', StackTrace.current);
      return;
    }

    state = const AsyncValue.loading();
    
    try {
      final cepModel = await _repository.consultarCep(cep);
      state = AsyncValue.data(cepModel);
    } catch (e) {
      state = AsyncValue.error('Erro ao buscar endereço', StackTrace.current);
    }
  }

  void limparCep() {
    state = const AsyncValue.data(null);
  }
}

// Provider para o notifier
final cepNotifierProvider = StateNotifierProvider<CepNotifier, AsyncValue<CepModel?>>((ref) {
  final repository = ref.watch(cepRepositoryProvider);
  return CepNotifier(repository);
});
