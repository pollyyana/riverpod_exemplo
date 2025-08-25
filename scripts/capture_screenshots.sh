#!/bin/bash

# Script para capturar screenshots dos projetos Flutter
# Uso: ./scripts/capture_screenshots.sh [projeto]

set -e

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para imprimir mensagens coloridas
print_message() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}================================${NC}"
}

# Verificar se o Flutter está instalado
check_flutter() {
    if ! command -v flutter &> /dev/null; then
        print_error "Flutter não está instalado ou não está no PATH"
        exit 1
    fi
    print_message "Flutter encontrado: $(flutter --version | head -n 1)"
}

# Função para capturar screenshots de um projeto
capture_project_screenshots() {
    local project_dir=$1
    local project_name=$(basename "$project_dir")
    
    print_header "Capturando screenshots do projeto: $project_name"
    
    # Verificar se o projeto existe
    if [ ! -d "$project_dir" ]; then
        print_error "Projeto $project_dir não encontrado"
        return 1
    fi
    
    # Navegar para o projeto
    cd "$project_dir"
    
    # Verificar se é um projeto Flutter válido
    if [ ! -f "pubspec.yaml" ]; then
        print_error "pubspec.yaml não encontrado em $project_dir"
        return 1
    fi
    
    # Instalar dependências
    print_message "Instalando dependências..."
    flutter pub get
    
    # Verificar se há um dispositivo/emulador disponível
    local devices=$(flutter devices --machine | grep -c '"type":"device"')
    if [ "$devices" -eq 0 ]; then
        print_warning "Nenhum dispositivo/emulador encontrado"
        print_message "Iniciando emulador Android..."
        # Tentar iniciar emulador (ajuste conforme necessário)
        # emulator -avd Pixel_4_API_30 &
        # sleep 30
    fi
    
    # Criar diretório de screenshots se não existir
    mkdir -p "../assets/screenshots/$project_name"
    
    # Capturar screenshots
    print_message "Capturando screenshots..."
    
    # Tela principal (assumindo que o app já está rodando)
    if flutter screenshot "../assets/screenshots/$project_name/main_screen.png" 2>/dev/null; then
        print_message "✓ main_screen.png capturada"
    else
        print_warning "Não foi possível capturar main_screen.png"
    fi
    
    # Aguardar um pouco para simular interação
    sleep 2
    
    # Tentar capturar outras telas
    if flutter screenshot "../assets/screenshots/$project_name/result_screen.png" 2>/dev/null; then
        print_message "✓ result_screen.png capturada"
    else
        print_warning "Não foi possível capturar result_screen.png"
    fi
    
    if flutter screenshot "../assets/screenshots/$project_name/states_screen.png" 2>/dev/null; then
        print_message "✓ states_screen.png capturada"
    else
        print_warning "Não foi possível capturar states_screen.png"
    fi
    
    print_message "Screenshots salvas em: assets/screenshots/$project_name/"
    
    # Voltar ao diretório raiz
    cd ..
}

# Função principal
main() {
    print_header "Capturador de Screenshots - Riverpod Exemplo"
    
    # Verificar Flutter
    check_flutter
    
    # Se um projeto específico foi fornecido
    if [ $# -eq 1 ]; then
        local project=$1
        case $project in
            "flutter_cep"|"viacep_riverpod"|"viacep_riverpod_codeGenerator")
                capture_project_screenshots "$project"
                ;;
            *)
                print_error "Projeto inválido: $project"
                print_message "Projetos disponíveis: flutter_cep, viacep_riverpod, viacep_riverpod_codeGenerator"
                exit 1
                ;;
        esac
    else
        # Capturar screenshots de todos os projetos
        print_message "Capturando screenshots de todos os projetos..."
        
        for project in flutter_cep viacep_riverpod viacep_riverpod_codeGenerator; do
            if [ -d "$project" ]; then
                capture_project_screenshots "$project"
                echo ""
            else
                print_warning "Projeto $project não encontrado"
            fi
        done
    fi
    
    print_header "Captura de screenshots concluída!"
    print_message "Verifique as imagens em: assets/screenshots/"
}

# Executar função principal
main "$@"
