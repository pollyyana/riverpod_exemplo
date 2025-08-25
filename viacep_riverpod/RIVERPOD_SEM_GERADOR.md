# Riverpod Sem Gerador de Código - Guia de Estudo

## 🎯 Objetivo
Este projeto demonstra como usar Riverpod **sem** o gerador de código, para fins de estudo e aprendizado.

## 📚 Conceitos Fundamentais

### 1. **Provider**
É a unidade básica do Riverpod. Fornece dados ou objetos para outros widgets.

```dart
// Provider simples
final cepRepositoryProvider = Provider<CepRepository>((ref) {
  return CepRepository(client: http.Client());
});
```

### 2. **StateNotifier**
Classe que gerencia estado mutável. Ideal para lógica de negócio.

```dart
class CepNotifier extends StateNotifier<AsyncValue<CepModel?>> {
  final CepRepository _repository;

  CepNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> buscarCep(String cep) async {
    // Lógica aqui
  }
}
```

### 3. **StateNotifierProvider**
Provider que fornece um StateNotifier.

```dart
final cepNotifierProvider = StateNotifierProvider<CepNotifier, AsyncValue<CepModel?>>((ref) {
  final repository = ref.watch(cepRepositoryProvider);
  return CepNotifier(repository);
});
```

## 🔧 Tipos de Providers

### Provider Simples
```dart
final cepFormatterProvider = Provider<MaskTextInputFormatter>((ref) {
  return MaskTextInputFormatter(
    mask: '#####-###',
    filter: {'#': RegExp(r'[0-9]')},
  );
});
```

### StateNotifierProvider
```dart
final cepNotifierProvider = StateNotifierProvider<CepNotifier, AsyncValue<CepModel?>>((ref) {
  final repository = ref.watch(cepRepositoryProvider);
  return CepNotifier(repository);
});
```

### FutureProvider (para operações assíncronas simples)
```dart
final cepFutureProvider = FutureProvider.family<CepModel, String>((ref, cep) async {
  final repository = ref.read(cepRepositoryProvider);
  return await repository.consultarCep(cep);
});
```

## 📱 Como Usar nos Widgets

### ConsumerWidget
```dart
class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Observar estado
    final cepState = ref.watch(cepNotifierProvider);
    
    // Executar ação
    ref.read(cepNotifierProvider.notifier).buscarCep('01310-100');
    
    return Scaffold(/* ... */);
  }
}
```

### ConsumerStatefulWidget
```dart
class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final cepState = ref.watch(cepNotifierProvider);
    return Scaffold(/* ... */);
  }
}
```

## 🔄 Gerenciamento de Estado

### AsyncValue
Representa estados assíncronos:
- `AsyncValue.data(value)`: Dados carregados
- `AsyncValue.loading()`: Carregando
- `AsyncValue.error(error, stackTrace)`: Erro

```dart
// No StateNotifier
state = const AsyncValue.loading();
state = AsyncValue.data(cepModel);
state = AsyncValue.error('Erro', StackTrace.current);
```

### Observando Estados
```dart
final cepState = ref.watch(cepNotifierProvider);

if (cepState.isLoading) {
  return CircularProgressIndicator();
}

if (cepState.hasError) {
  return Text('Erro: ${cepState.error}');
}

if (cepState.hasValue) {
  return Text('CEP: ${cepState.value!.cep}');
}
```

## 🔗 Injeção de Dependências

### Dependências entre Providers
```dart
final cepRepositoryProvider = Provider<CepRepository>((ref) {
  return CepRepository(client: http.Client());
});

final cepNotifierProvider = StateNotifierProvider<CepNotifier, AsyncValue<CepModel?>>((ref) {
  // Usa o repositório do provider acima
  final repository = ref.watch(cepRepositoryProvider);
  return CepNotifier(repository);
});
```

### ref.watch() vs ref.read()
- **ref.watch()**: Observa mudanças no provider
- **ref.read()**: Lê o valor uma vez (não reativo)

```dart
// Reativo - reconstrói quando o provider muda
final repository = ref.watch(cepRepositoryProvider);

// Não reativo - lê apenas uma vez
final repository = ref.read(cepRepositoryProvider);
```

## 🧹 Gerenciamento de Ciclo de Vida

### ref.onDispose()
```dart
final cepTextControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  
  // Limpa quando o provider for descartado
  ref.onDispose(() {
    controller.dispose();
  });
  
  return controller;
});
```

## 🎯 Vantagens do Riverpod Manual

1. **Controle Total**: Você controla exatamente como os providers funcionam
2. **Entendimento Profundo**: Força você a entender os conceitos
3. **Flexibilidade**: Pode customizar qualquer aspecto
4. **Sem Dependências Extras**: Não precisa do build_runner

## 🚀 Próximos Passos para Estudo

1. **Experimente diferentes tipos de providers**:
   - `Provider`
   - `StateNotifierProvider`
   - `FutureProvider`
   - `StreamProvider`

2. **Teste injeção de dependências**:
   - Crie providers que dependem de outros
   - Use `ref.watch()` e `ref.read()`

3. **Implemente gerenciamento de estado complexo**:
   - Múltiplos StateNotifiers
   - Estados combinados

4. **Adicione testes**:
   - Teste providers isoladamente
   - Teste widgets com providers

## 📖 Recursos para Aprendizado

- [Documentação oficial do Riverpod](https://riverpod.dev/)
- [Exemplos no GitHub](https://github.com/rrousselGit/riverpod)
- [Cookbook do Riverpod](https://riverpod.dev/docs/cookbooks/)

---

**Dica**: Comece com providers simples e vá aumentando a complexidade gradualmente!
