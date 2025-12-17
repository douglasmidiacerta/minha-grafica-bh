# ========================================
# Script de Configuração Inicial do GitHub
# Execute apenas uma vez
# ========================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   CONFIGURAÇÃO INICIAL DO GITHUB" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar se Git está instalado
try {
    $gitVersion = git --version
    Write-Host "✓ Git detectado: $gitVersion" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "✗ Git não encontrado!" -ForegroundColor Red
    Write-Host "Por favor, instale o Git: https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host ""
    exit 1
}

# Configurar usuário Git
Write-Host "📝 CONFIGURAÇÃO DO USUÁRIO" -ForegroundColor Yellow
Write-Host ""

$currentName = git config user.name 2>$null
$currentEmail = git config user.email 2>$null

if ($currentName) {
    Write-Host "Nome atual: $currentName" -ForegroundColor Gray
    Write-Host "Deseja manter? (S/N) [S]:" -ForegroundColor Cyan
    $keep = Read-Host
    if ($keep -eq "N" -or $keep -eq "n") {
        $currentName = $null
    }
}

if (-not $currentName) {
    Write-Host "Digite seu nome completo:" -ForegroundColor Cyan
    $name = Read-Host
    git config --global user.name "$name"
    Write-Host "✓ Nome configurado: $name" -ForegroundColor Green
    Write-Host ""
}

if ($currentEmail) {
    Write-Host "Email atual: $currentEmail" -ForegroundColor Gray
    Write-Host "Deseja manter? (S/N) [S]:" -ForegroundColor Cyan
    $keep = Read-Host
    if ($keep -eq "N" -or $keep -eq "n") {
        $currentEmail = $null
    }
}

if (-not $currentEmail) {
    Write-Host "Digite seu email do GitHub:" -ForegroundColor Cyan
    $email = Read-Host
    git config --global user.email "$email"
    Write-Host "✓ Email configurado: $email" -ForegroundColor Green
    Write-Host ""
}

# Configurar repositório remoto
Write-Host ""
Write-Host "🔗 CONFIGURAÇÃO DO REPOSITÓRIO REMOTO" -ForegroundColor Yellow
Write-Host ""

$currentRemote = git remote get-url origin 2>$null
if ($currentRemote) {
    Write-Host "Repositório remoto atual: $currentRemote" -ForegroundColor Gray
    Write-Host "Deseja manter? (S/N) [S]:" -ForegroundColor Cyan
    $keep = Read-Host
    if ($keep -eq "N" -or $keep -eq "n") {
        git remote remove origin
        $currentRemote = $null
    }
}

if (-not $currentRemote) {
    Write-Host "Digite a URL do seu repositório GitHub:" -ForegroundColor Cyan
    Write-Host "Exemplo: https://github.com/seu-usuario/minha-grafica-bh.git" -ForegroundColor Gray
    $repoUrl = Read-Host "URL"
    
    git remote add origin "$repoUrl"
    Write-Host "✓ Repositório remoto configurado" -ForegroundColor Green
    Write-Host ""
}

# Fazer commit inicial
Write-Host ""
Write-Host "📦 COMMIT INICIAL" -ForegroundColor Yellow
Write-Host ""

$hasCommits = git log --oneline 2>$null
if (-not $hasCommits) {
    Write-Host "Criando commit inicial..." -ForegroundColor Cyan
    git add .
    git commit -m "Commit inicial - Site Minha Gráfica BH"
    Write-Host "✓ Commit inicial criado" -ForegroundColor Green
    Write-Host ""
}

# Push inicial
Write-Host ""
Write-Host "🚀 ENVIANDO PARA GITHUB" -ForegroundColor Yellow
Write-Host ""

Write-Host "Deseja enviar o código para o GitHub agora? (S/N) [S]:" -ForegroundColor Cyan
$push = Read-Host

if ([string]::IsNullOrWhiteSpace($push) -or $push -eq "S" -or $push -eq "s") {
    Write-Host "Enviando para GitHub..." -ForegroundColor Cyan
    try {
        git push -u origin main
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Green
        Write-Host "   ✓ CONFIGURAÇÃO CONCLUÍDA!" -ForegroundColor Green
        Write-Host "========================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "🎉 Seu código está no GitHub!" -ForegroundColor Green
        Write-Host ""
        Write-Host "📝 Próximos passos:" -ForegroundColor Yellow
        Write-Host "1. Acesse: https://vercel.com" -ForegroundColor White
        Write-Host "2. Faça login com sua conta GitHub" -ForegroundColor White
        Write-Host "3. Clique em 'New Project'" -ForegroundColor White
        Write-Host "4. Selecione o repositório 'minha-grafica-bh'" -ForegroundColor White
        Write-Host "5. Clique em 'Deploy'" -ForegroundColor White
        Write-Host ""
        Write-Host "✨ A partir de agora, use o script 'sync-github.ps1' para atualizar!" -ForegroundColor Cyan
        Write-Host ""
    } catch {
        Write-Host "✗ Erro ao enviar para GitHub" -ForegroundColor Red
        Write-Host ""
        Write-Host "Verifique:" -ForegroundColor Yellow
        Write-Host "1. Se você criou o repositório no GitHub" -ForegroundColor White
        Write-Host "2. Se a URL está correta" -ForegroundColor White
        Write-Host "3. Se você tem permissão para fazer push" -ForegroundColor White
        Write-Host ""
    }
}

Write-Host ""
