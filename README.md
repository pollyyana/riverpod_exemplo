# 📱 Exemplos de Riverpod - Consulta de CEP

[![Flutter](https://img.shields.io/badge/Flutter-3.32.8-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.8.1-blue.svg)](https://dart.dev/)
[![Riverpod](https://img.shields.io/badge/Riverpod-Latest-orange.svg)](https://riverpod.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Este repositório demonstra a evolução de um aplicativo Flutter de consulta de CEP, desde uma implementação tradicional até o uso avançado do Riverpod com code generation.

## 🎯 Sobre o Projeto

O projeto apresenta três implementações diferentes do mesmo aplicativo de consulta de CEP, demonstrando as melhores práticas e evolução do gerenciamento de estado no Flutter:

1. **Implementação Tradicional** - Estado gerenciado com `setState`
2. **Riverpod Básico** - Gerenciamento de estado com Riverpod
3. **Riverpod com Code Generation** - Implementação otimizada com geração de código

## 📸 Screenshots

### Tela Principal
![Tela Principal](assets/screenshots/main_screen.png)

### Resultado da Consulta
![Resultado da Consulta](assets/screenshots/result_screen.png)

### Estados de Loading e Erro
![Estados](assets/screenshots/states_screen.png)

> **Nota:** Para capturar screenshots automaticamente, use o script: `./scripts/capture_screenshots.sh [projeto]`

## 🏗️ Estrutura do Projeto

```
riverpod_exemplo/
├── 📁 flutter_cep/                    # Implementação tradicional
│   ├── 📁 lib/
│   ├── 📁 test/
│   ├── 📄 pubspec.yaml
│   └── 📄 README.md
├── 📁 viacep_riverpod/               # Riverpod sem code generation
│   ├── 📁 lib/
│   ├── 📁 test/
│   ├── 📄 pubspec.yaml
│   └── 📄 README.md
├── 📁 viacep_riverpod_codeGenerator/ # Riverpod com code generation
│   ├── 📁 lib/
│   ├── 📁 test/
│   ├── 📄 pubspec.yaml
│   └── 📄 README.md
├── 📁 assets/screenshots/            # Screenshots do app
├── 📄 .gitignore
└── 📄 README.md
```

## 🚀 Como Executar

### Pré-requisitos

- [Flutter](https://flutter.dev/docs/get-started/install) 3.32.8 ou superior
- [Dart](https://dart.dev/get-dart) 3.8.1 ou superior
- Android Studio / VS Code com extensões Flutter

### Instalação

1. **Clone o repositório**
   ```bash
   git clone https://github.com/seu-usuario/riverpod_exemplo.git
   cd riverpod_exemplo
   ```

2. **Execute um dos projetos**
   ```bash
   # Projeto base
   cd flutter_cep
   flutter pub get
   flutter run

   # Riverpod sem code generation
   cd ../viacep_riverpod
   flutter pub get
   flutter run

   # Riverpod com code generation
   cd ../viacep_riverpod_codeGenerator
   flutter pub get
   flutter run
   ```

## 📚 Documentação

Cada projeto contém documentação detalhada:

| Projeto | Documentação | Descrição |
|---------|--------------|-----------|
| `flutter_cep` | `README.md` | Implementação tradicional com `setState` |
| `viacep_riverpod` | `RIVERPOD_SEM_GERADOR.md` | Riverpod sem code generation |
| `viacep_riverpod_codeGenerator` | `TRANSFORMACAO_RIVERPOD.md` | Riverpod com code generation |
| Todos | `RESUMO_FINAL.md` | Comparativo entre as implementações |

## 🛠️ Tecnologias Utilizadas

### Core
- [Flutter](https://flutter.dev/) - Framework de UI
- [Dart](https://dart.dev/) - Linguagem de programação

### Gerenciamento de Estado
- [Riverpod](https://riverpod.dev/) - Gerenciamento de estado
- [riverpod_generator](https://pub.dev/packages/riverpod_generator) - Code generation

### APIs e Serviços
- [ViaCEP API](https://viacep.com.br/) - Consulta de CEP
- [HTTP](https://pub.dev/packages/http) - Cliente HTTP

### Desenvolvimento
- [flutter_lints](https://pub.dev/packages/flutter_lints) - Linting
- [test](https://pub.dev/packages/test) - Testes unitários

## 🔄 Comparativo das Implementações

| Aspecto | Tradicional | Riverpod | Riverpod + Code Gen |
|---------|-------------|----------|-------------------|
| **Complexidade** | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Manutenibilidade** | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Performance** | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Testabilidade** | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Curva de Aprendizado** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |

## 🧪 Testes

Para executar os testes em cada projeto:

```bash
cd [nome-do-projeto]
flutter test
```

## 🛠️ Scripts Úteis

### Captura de Screenshots
```bash
# Capturar screenshots de todos os projetos
./scripts/capture_screenshots.sh

# Capturar screenshots de um projeto específico
./scripts/capture_screenshots.sh flutter_cep
./scripts/capture_screenshots.sh viacep_riverpod
./scripts/capture_screenshots.sh viacep_riverpod_codeGenerator
```

### Limpeza de Build
```bash
# Limpar builds de todos os projetos
find . -name "build" -type d -exec rm -rf {} + 2>/dev/null || true
```

## 📱 Funcionalidades

- ✅ Consulta de CEP via API ViaCEP
- ✅ Validação de entrada
- ✅ Estados de loading e erro
- ✅ Interface responsiva
- ✅ Tratamento de erros
- ✅ Cache de consultas
- ✅ Testes unitários

## 🤝 Contribuição

Contribuições são bem-vindas! Para contribuir:

1. **Fork** o projeto
2. **Crie** uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. **Commit** suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. **Push** para a branch (`git push origin feature/AmazingFeature`)
5. **Abra** um Pull Request

### Diretrizes de Contribuição

- Mantenha o código limpo e bem documentado
- Adicione testes para novas funcionalidades
- Siga as convenções de nomenclatura do Dart/Flutter
- Atualize a documentação quando necessário

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

## 👨‍💻 Autor

**Seu Nome**
- GitHub: [@seu-usuario](https://github.com/seu-usuario)
- LinkedIn: [Seu LinkedIn](https://linkedin.com/in/seu-perfil)

## 🙏 Agradecimentos

- [Riverpod](https://riverpod.dev/) pela excelente biblioteca de gerenciamento de estado
- [ViaCEP](https://viacep.com.br/) pela API gratuita de consulta de CEP
- Comunidade Flutter pelo suporte e documentação

---

⭐ **Se este projeto te ajudou, considere dar uma estrela!**
