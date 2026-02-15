#!/bin/bash

################################################################################
# YUMI GITHUB INTEGRATION SETUP SCRIPT
################################################################################
# Description: Setup GitHub repository untuk Yumi (Embedded AI Assistant)
# Author: Claws (System Orchestrator) for Yume Group
# Usage: ./setup-yumi-github.sh
# Required: Git, SSH Key, GitHub Personal Access Token (PAT)
################################################################################

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
GITHUB_USER=""
GITHUB_TOKEN=""
REPO_NAME="yume-embedded-ai"
WORKSPACE="/workspace-yumi"
SSH_KEY="$HOME/.ssh/id_rsa"
README="$WORKSPACE/README.md"

# Functions
print_header() {
    echo -e "${BLUE}┌─────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${BLUE}│${NC}  🌼 YUMI GITHUB INTEGRATION SETUP SCRIPT  🌼                    ${BLUE}│${NC}"
    echo -e "${BLUE}│${NC}  Versi 1.0 - Setup Repository & Push Files              ${BLUE}│${NC}"
    echo -e "${BLUE}│${NC}  Author: Claws (System Orchestrator)                       ${BLUE}│${NC}"
    echo -e "${BLUE}└─────────────────────────────────────────────────────────────┘${NC}"
}

print_step() {
    echo -e "${GREEN}[STEP] $1${NC}"
}

print_info() {
    echo -e "${BLUE}[INFO] $1${NC}"
}

print_success() {
    echo -e "${GREEN}[SUCCESS] $1${NC}"
}

print_error() {
    echo -e "${RED}[ERROR] $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}[WARNING] $1${NC}"
}

check_dependencies() {
    print_step "Cek Dependencies..."
    
    # Check Git
    if ! command -v git &> /dev/null; then
        print_error "Git tidak terinstall. Silakan install dengan: sudo apt install git"
        exit 1
    fi
    
    # Check SSH Key
    if [ ! -f "$SSH_KEY" ]; then
        print_error "SSH Key tidak ditemukan: $SSH_KEY"
        print_info "Membuat SSH Key baru..."
        ssh-keygen -t rsa -b 4096 -f "$SSH_KEY" -q -N "yumi@github.com" -C "yumi@github.com" || exit 1
        print_success "SSH Key dibuat: $SSH_KEY"
    else
        print_success "SSH Key sudah ada: $SSH_KEY"
    fi
    
    # Check GitHub Token
    if [ -z "$GITHUB_TOKEN" ]; then
        print_warning "GitHub Token belum diset. Nanti akan diminta."
    fi
    
    # Check Workspace
    if [ ! -d "$WORKSPACE" ]; then
        print_error "Workspace tidak ditemukan: $WORKSPACE"
        exit 1
    fi
    
    print_success "Dependencies cek selesai!"
}

setup_github_token() {
    print_step "Setup GitHub Token (PAT)"
    echo -e "${YELLOW}Masukkan GitHub Personal Access Token (PAT):${NC}"
    echo -e "${YELLOW}Token harus punya permission: repo (full control), workflow${NC}"
    read -s -p "GitHub Token: " GITHUB_TOKEN
}

create_readme() {
    print_step "Membuat README.md untuk Yume Group..."
    
    cat > "$README" << 'EOF'
# 🌼 Yumi - AI Assistant Terintegrasi (Embedded AI)

**Yumi** adalah AI Assistant Terintegrasi (Embedded AI) untuk Yume Group dan Project Azzam.
Yumi ditanam di seluruh project dan startup milik Azzam (Webapp, Aplikasi, dll.)

## 📦 Fitur Utama Yumi

### 🐞 Melapor Bug & Error
- Lapor bug/error langsung dari aplikasi/webapp
- Upload screenshot error
- Klasifikasikan severity (Critical, High, Medium, Low)
- Routing ke tim development Yume Group

### ✨ Request Fitur Baru
- Request fitur baru langsung dari aplikasi
- Prioritas berdasarkan dampak operasional
- Dokumentasi requirement otomatis

### 📊 Monitoring Sistem
- Monitor kesehatan sistem Yume Group (POS, Absensi, dll.)
- Deteksi anomali otomatis
- Alert jika ada downtime/error kritis
- Dashboard monitoring real-time

### 📈 Analisis Data Operasional
- Analisis penjualan POS (revenue, margin, best-seller)
- Analisis kehadiran karyawan (absensi)
- Analisis efisiensi operasional (service time, order accuracy)

## 🏢 Yume Group - F&B Perusahaan Azzam

Yume Group adalah group F&B yang dikelola oleh Azzam, terdiri dari beberapa bisnis F&B seperti:
- **POS (Point of Sale)** - Sistem kasir Yume Group
- **Absensi Karyawan** - Sistem absensi Yume Group
- **Operasional** - Manajemen operasional Yume Group
- **Aplikasi Sistem** - Sistem aplikasi Yume Group

## 🚀 Project & Startup Azzam

Seluruh project dan startup milik Azzam akan menggunakan Yumi sebagai AI Assistant terintegrasi:
- **Yume Group (F&B)** - POS, Absensi, Operasional, Aplikasi Sistem
- **Startup Azzam** - Project-Project baru (Web, Mobile, Tech)
- **Project Personal** - Project pribadi Azzam (Hobi, Side Projects)

## 📱 Deployment (Embedded AI)

Yumi akan ditanam (embedded) di seluruh aplikasi/webapp milik Azzam:
- **Webapp** - Widget/sidebar di aplikasi web Azzam
- **Aplikasi Mobile** - Floating Action Button (FAB) di aplikasi mobile
- **Startup Azzam** - Internal Co-Pilot untuk tim startup

## 👤 Kontak

- **Owner:** Azzam (Fakhri Azzam)
- **Email:** contact@yumegroup.com
- **WhatsApp:** +62 812 232 18491
- **Telegram:** @ZantaraAIbot

## 📜 Lisensi

Yumi © 2026 Yume Group. All Rights Reserved.
EOF
    print_success "README.md dibuat!"
}

initialize_git_repo() {
    print_step "Initialize Git Repository..."
    
    cd "$WORKSPACE" || exit 1
    
    # Initialize repo
    if [ ! -d ".git" ]; then
        git init
        print_success "Git repository initialized!"
    else
        print_warning "Git repository sudah ada."
    fi
    
    # Add SSH Key to ssh-agent (optional, but helpful)
    eval "$(ssh-agent -s)" &> /dev/null
    ssh-add "$SSH_KEY" 2>/dev/null
    
    # Create .gitignore
    cat > .gitignore << 'EOF'
node_modules/
.DS_Store
.gitignore
.env
EOF
    
    # Add files
    git add .
    git commit -m "Initial commit: Yume Group - Embedded AI Assistant" || print_warning "Nothing to commit"
    
    print_success "Git repository ready!"
}

setup_github_repo() {
    print_step "Setup GitHub Repository via API..."
    
    # Create repository using GitHub API
    RESPONSE=$(curl -s -X POST \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        -d '{
            "name": "'"$REPO_NAME"'"",
            "description": "Yume Group - Embedded AI Assistant untuk F&B & Startup Azzam",
            "private": false,
            "auto_init": false
        }' \
        https://api.github.com/user/repos)
    
    # Check response
    if echo "$RESPONSE" | grep -q "already_exists"; then
        print_warning "Repository $REPO_NAME sudah ada. Menggunakan yang sudah ada."
    elif echo "$RESPONSE" | grep -q "created_at"; then
        print_success "Repository $REPO_NAME berhasil dibuat!"
    else
        print_error "Gagal membuat repository. Response: $RESPONSE"
        exit 1
    fi
}

push_to_github() {
    print_step "Push Files ke GitHub..."
    
    cd "$WORKSPACE" || exit 1
    
    # Get repo URL (with auth)
    # Note: We need to use HTTPS with token in URL
    REPO_URL="https://$GITHUB_TOKEN@github.com/$GITHUB_USER/$REPO_NAME.git"
    
    # Rename branch to main
    git branch -M main 2>/dev/null
    
    # Add remote
    git remote remove origin 2>/dev/null
    git remote add origin "$REPO_URL"
    
    # Push
    git push -u origin main || {
        print_error "Gagal push ke GitHub. Cek token dan permission."
        exit 1
    }
    
    print_success "Files berhasil dipush ke GitHub!"
}

print_final_info() {
    echo -e "${GREEN}┌─────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${GREEN}│${NC}  🌼 SETUP SELESAI! YUMI SUDAH DI GITHUB 🌼               ${GREEN}│${NC}"
    echo -e "${GREEN}│${NC}                                                            ${GREEN}│${NC}"
    echo -e "${GREEN}│${NC}  Repository: https://github.com/$GITHUB_USER/$REPO_NAME ${GREEN}│${NC}"
    echo -e "${GREEN}│${NC}  Workspace: $WORKSPACE                             ${GREEN}│${NC}"
    echo -e "${GREEN}│${NC}                                                            ${GREEN}│${NC}"
    echo -e "${GREEN}│${NC}  🌼 Yumi siap membantu Bos di project Azzam! 🌼          ${GREEN}│${NC}"
    echo -e "${GREEN}└─────────────────────────────────────────────────────────────┘${NC}"
}

# Main Script
main() {
    clear
    print_header
    
    # Check dependencies
    check_dependencies
    
    # Ask for GitHub info
    echo -e "${YELLOW}┌─────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${YELLOW}│${NC}  MASUKKAN GITHUB INFO YUME GROUP                          ${YELLOW}│${NC}"
    echo -e "${YELLOW}└─────────────────────────────────────────────────────────────┘${NC}"
    
    echo -e "${BLUE}1. GitHub Username (contoh: AzzamFakhri):${NC}"
    read -p "> "   " GITHUB_USER
    
    # Setup token
    setup_github_token
    
    # Ask for repo name (optional)
    read -p "2. Repository Name (default: $REPO_NAME): " input_name
    REPO_NAME=${input_name:-$REPO_NAME}
    
    # Confirm
    echo -e "${BLUE}3. Konfirmasi Setup:${NC}"
    echo -e "   GitHub User: $GITHUB_USER"
    echo -e "   Repository: $REPO_NAME"
    echo -e "   Workspace: $WORKSPACE"
    read -p "   Lanjutkan? (y/n): " confirm
    
    if [ "$confirm" != "y" ]; then
        print_warning "Setup dibatalkan."
        exit 0
    fi
    
    # Create README
    create_readme
    
    # Initialize Git
    initialize_git_repo
    
    # Setup GitHub Repo (via API)
    setup_github_repo
    
    # Push to GitHub
    push_to_github
    
    # Print final info
    print_final_info
}

# Run main
main
