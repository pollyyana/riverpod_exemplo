import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import '../models/cep_model.dart';
import '../repositories/cep_repository.dart';

part 'cep_provider.g.dart';

@riverpod
CepRepository cepRepository(CepRepositoryRef ref) {
  return CepRepository(client: http.Client());
}

@riverpod
class CepNotifier extends _$CepNotifier {
  @override
  FutureOr<CepModel?> build() {
    return null;
  }

  Future<void> buscarCep(String cep) async {
    if (cep.trim().isEmpty) {
      state = AsyncValue.error('Digite um CEP válido!', StackTrace.current);
      return;
    }

    state = const AsyncValue.loading();
    
    try {
      final repository = ref.read(cepRepositoryProvider);
      final cepModel = await repository.consultarCep(cep);
      state = AsyncValue.data(cepModel);
    } catch (e) {
      state = AsyncValue.error('Erro ao buscar endereço', StackTrace.current);
    }
  }

  void limparCep() {
    state = const AsyncValue.data(null);
  }
}
