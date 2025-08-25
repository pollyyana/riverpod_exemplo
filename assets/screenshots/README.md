# 📸 Instruções para Captura de Screenshots

Este diretório deve conter as screenshots do aplicativo para o README principal.

## 📱 Screenshots Necessárias

### 1. `main_screen.png`
- **Descrição:** Tela principal do app com campo de entrada de CEP
- **Como capturar:** Execute o app e capture a tela inicial

### 2. `result_screen.png`
- **Descrição:** Tela com resultado da consulta de CEP
- **Como capturar:** Digite um CEP válido (ex: 01001000) e capture a tela com os dados

### 3. `states_screen.png`
- **Descrição:** Estados de loading e erro
- **Como capturar:** Capture telas mostrando loading e mensagens de erro

## 🛠️ Como Capturar Screenshots

### Opção 1: Flutter Screenshot (Recomendado)
```bash
# Navegue para um dos projetos
cd flutter_cep

# Execute o app
flutter run

# Em outro terminal, capture screenshots
flutter screenshot main_screen.png
flutter screenshot result_screen.png
flutter screenshot states_screen.png
```

### Opção 2: Captura Manual
1. Execute o app em um emulador ou dispositivo
2. Use a ferramenta de captura de tela do seu sistema
3. Salve as imagens neste diretório com os nomes especificados

### Opção 3: Android Studio / VS Code
- Use a funcionalidade de screenshot integrada da IDE
- Salve as imagens neste diretório

## 📋 Especificações das Imagens

- **Formato:** PNG
- **Resolução:** Mínimo 1080x1920 (portrait) ou 1920x1080 (landscape)
- **Qualidade:** Alta (sem compressão excessiva)
- **Tamanho:** Máximo 2MB por imagem

## 🎨 Dicas para Boas Screenshots

1. **Use um emulador limpo** sem notificações
2. **Capture em modo claro** para melhor visibilidade
3. **Inclua elementos visuais** como ícones e botões
4. **Mostre diferentes estados** (loading, sucesso, erro)
5. **Mantenha consistência** entre as screenshots

## 📁 Estrutura de Arquivos

```
assets/screenshots/
├── main_screen.png      # Tela principal
├── result_screen.png    # Resultado da consulta
├── states_screen.png    # Estados de loading/erro
└── README.md           # Este arquivo
```

## 🔄 Atualização

Após capturar as screenshots:
1. Verifique se as imagens estão no formato correto
2. Teste se o README principal exibe as imagens corretamente
3. Commit as mudanças no Git
