# Consulta de CEP com Riverpod

Este projeto demonstra como consultar CEPs usando a API do ViaCEP com Flutter e Riverpod para gerenciamento de estado.

## 🚀 Funcionalidades

- Consulta de CEPs via API do ViaCEP
- Interface moderna e responsiva
- Gerenciamento de estado com Riverpod
- Tratamento de erros
- Formatação automática de CEP
- Animações suaves

## 🏗️ Arquitetura

O projeto foi refatorado para usar **Riverpod** seguindo as melhores práticas:

### Providers

- **`cepNotifierProvider`**: Gerencia o estado da consulta de CEP
- **`cepRepositoryProvider`**: Fornece instância do repositório
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
│   ├── cep_provider.dart
│   └── text_controller_provider.dart
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
- **Riverpod**: Gerenciamento de estado
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

## 🎯 Benefícios da Refatoração para Riverpod

### ✅ Antes (StatefulWidget)
- Estado gerenciado localmente
- Lógica misturada com UI
- Difícil de testar
- Reutilização limitada

### ✅ Depois (Riverpod)
- Estado centralizado e reativo
- Separação clara de responsabilidades
- Fácil de testar
- Alta reutilização
- Injeção de dependências automática
- Gerenciamento de ciclo de vida automático

## 📊 Exemplo de Uso dos Providers

```dart
// Observar estado
final cepState = ref.watch(cepNotifierProvider);

// Executar ação
await ref.read(cepNotifierProvider.notifier).buscarCep('01310-100');

// Acessar repositório
final repository = ref.read(cepRepositoryProvider);
```

## 🧪 Testes

O projeto está preparado para testes unitários e de widgets com Riverpod.

## 📄 Licença

Este projeto está sob a licença MIT.
