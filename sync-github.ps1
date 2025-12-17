# ========================================
# Script de Sincronização Automática
# Minha Gráfica BH - GitHub Sync
# ========================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   SINCRONIZAÇÃO COM GITHUB" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar se há alterações
$status = git status --porcelain
if (-not $status) {
    Write-Host "✓ Nenhuma alteração para sincronizar" -ForegroundColor Green
    Write-Host ""
    exit 0
}

Write-Host "📝 Alterações encontradas:" -ForegroundColor Yellow
git status --short
Write-Host ""

# Solicitar mensagem de commit
$defaultMessage = "Atualização automática - $(Get-Date -Format 'dd/MM/yyyy HH:mm')"
Write-Host "Digite a mensagem do commit (ou pressione Enter para usar padrão):" -ForegroundColor Cyan
Write-Host "Padrão: $defaultMessage" -ForegroundColor Gray
$commitMessage = Read-Host "Mensagem"

if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    $commitMessage = $defaultMessage
}

Write-Host ""
Write-Host "🔄 Sincronizando com GitHub..." -ForegroundColor Yellow
Write-Host ""

# Adicionar todos os arquivos
Write-Host "1. Adicionando arquivos..." -ForegroundColor Cyan
git add .
Write-Host "   ✓ Arquivos adicionados" -ForegroundColor Green
Write-Host ""

# Fazer commit
Write-Host "2. Criando commit..." -ForegroundColor Cyan
git commit -m "$commitMessage"
Write-Host "   ✓ Commit criado" -ForegroundColor Green
Write-Host ""

# Push para GitHub
Write-Host "3. Enviando para GitHub..." -ForegroundColor Cyan
try {
    git push origin main
    Write-Host "   ✓ Código enviado com sucesso!" -ForegroundColor Green
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "   ✓ SINCRONIZAÇÃO CONCLUÍDA!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "🌐 Seu site será atualizado automaticamente na Vercel em alguns segundos..." -ForegroundColor Yellow
    Write-Host ""
} catch {
    Write-Host "   ✗ Erro ao enviar para GitHub" -ForegroundColor Red
    Write-Host ""
    Write-Host "Possíveis soluções:" -ForegroundColor Yellow
    Write-Host "1. Verifique se o repositório remoto está configurado:" -ForegroundColor White
    Write-Host "   git remote -v" -ForegroundColor Gray
    Write-Host ""
    Write-Host "2. Configure o repositório remoto (se necessário):" -ForegroundColor White
    Write-Host "   git remote add origin https://github.com/SEU-USUARIO/minha-grafica-bh.git" -ForegroundColor Gray
    Write-Host ""
    Write-Host "3. Verifique suas credenciais do GitHub" -ForegroundColor White
    Write-Host ""
}
