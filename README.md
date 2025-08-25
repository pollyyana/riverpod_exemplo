# Exemplos de Riverpod

Este repositório contém exemplos práticos de implementação do Riverpod em projetos Flutter.

## Estrutura do Projeto

### 1. `flutter_cep/`
Projeto base com implementação tradicional de consulta de CEP.

### 2. `viacep_riverpod/`
Implementação usando Riverpod sem code generation.

### 3. `viacep_riverpod_codeGenerator/`
Implementação usando Riverpod com code generation.

## Como Executar

Para cada projeto, navegue até o diretório correspondente e execute:

```bash
flutter pub get
flutter run
```

## Documentação

Cada projeto contém documentação específica:
- `README.md` - Instruções básicas
- `TRANSFORMACAO_RIVERPOD.md` - Detalhes da transformação
- `RIVERPOD_SEM_GERADOR.md` - Implementação sem code generation
- `RESUMO_FINAL.md` - Resumo das implementações

## Tecnologias Utilizadas

- Flutter
- Riverpod
- Code Generation (riverpod_generator)
- ViaCEP API

## Estrutura de Arquivos

```
riverpod_exemplo/
├── flutter_cep/                    # Projeto base
├── viacep_riverpod/               # Riverpod sem code generation
├── viacep_riverpod_codeGenerator/ # Riverpod com code generation
├── .gitignore                     # Configuração do Git
└── README.md                      # Este arquivo
```

## Contribuição

Para contribuir com este projeto:

1. Faça um fork do repositório
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request

## Licença

Este projeto está sob a licença MIT.
