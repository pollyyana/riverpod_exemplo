# Consulta de CEP com Riverpod (Sem Gerador)

Este projeto demonstra como consultar CEPs usando a API do ViaCEP com Flutter e Riverpod **sem gerador de código**, ideal para estudo e aprendizado.

## 🚀 Funcionalidades

- Consulta de CEPs via API do ViaCEP
- Interface moderna e responsiva
- Gerenciamento de estado com Riverpod (manual)
- Tratamento de erros
- Formatação automática de CEP
- Animações suaves

## 🏗️ Arquitetura

O projeto usa **Riverpod manual** (sem gerador de código) seguindo as melhores práticas:

### Providers Criados Manualmente

- **`cepRepositoryProvider`**: Fornece instância do repositório
- **`cepNotifierProvider`**: Gerencia o estado da consulta de CEP
- **`cepTextControllerProvider`**: Gerencia o TextEditingController
- **`cepFormatterProvider`**: Fornece o formatter para o campo CEP

### Estrutura de Pastas

```
lib/
├── core/
│   └── theme/
│       └── app_theme.dart
├── models/
│   └── cep_model.dart
├── providers/
│   ├── cep_provider.dart              # Providers principais
│   ├── text_controller_provider.dart  # Controllers
│   └── exemplos_adicionais.dart       # Exemplos para estudo
├── repositories/
│   └── cep_repository.dart
├── ui/
│   ├── home_screen.dart
│   └── widgets/
│       ├── address_widget.dart
│       └── cep_search_widget.dart
└── main.dart
```

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework de UI
- **Riverpod**: Gerenciamento de estado (sem gerador)
- **HTTP**: Requisições HTTP
- **Mask Text Input Formatter**: Formatação de campos

## 📱 Como Usar

1. Digite um CEP no campo de texto
2. Clique em "Buscar CEP"
3. Visualize as informações do endereço

## 🔧 Instalação

```bash
# Clone o repositório
git clone [url-do-repositorio]

# Entre na pasta
cd viacep_riverpod

# Instale as dependências
flutter pub get

# Execute o projeto
flutter run
```

## 🎯 Benefícios do Riverpod Manual

### ✅ Vantagens para Estudo
- **Controle Total**: Você controla exatamente como os providers funcionam
- **Entendimento Profundo**: Força você a entender os conceitos
- **Flexibilidade**: Pode customizar qualquer aspecto
- **Sem Dependências Extras**: Não precisa do build_runner

### ✅ Arquitetura Limpa
- Estado centralizado e reativo
- Separação clara de responsabilidades
- Fácil de testar
- Alta reutilização
- Injeção de dependências automática

## 📊 Exemplo de Uso dos Providers

```dart
// Observar estado
final cepState = ref.watch(cepNotifierProvider);

// Executar ação
await ref.read(cepNotifierProvider.notifier).buscarCep('01310-100');

// Acessar repositório
final repository = ref.read(cepRepositoryProvider);
```

## 🔍 Exemplos Adicionais para Estudo

O arquivo `lib/providers/exemplos_adicionais.dart` contém diversos exemplos:

1. **FutureProvider**: Para operações assíncronas simples
2. **StateProvider**: Para estado simples
3. **Provider.family**: Para providers com parâmetros
4. **Computed Providers**: Que combinam múltiplos estados
5. **Cache Providers**: Para otimização de performance
6. **Histórico**: Para manter lista de CEPs consultados

## 🧪 Testes

O projeto está preparado para testes unitários e de widgets com Riverpod.

## 📖 Recursos para Aprendizado

- [Documentação oficial do Riverpod](https://riverpod.dev/)
- [Exemplos no GitHub](https://github.com/rrousselGit/riverpod)
- [Cookbook do Riverpod](https://riverpod.dev/docs/cookbooks/)
- [Guia de Estudo](RIVERPOD_SEM_GERADOR.md)

## 🚀 Próximos Passos

1. Experimente os exemplos em `exemplos_adicionais.dart`
2. Adicione testes unitários
3. Implemente cache de CEPs
4. Adicione histórico de consultas
5. Implemente busca por endereço

## 📄 Licença

Este projeto está sob a licença MIT.
