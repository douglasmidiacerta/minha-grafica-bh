# ========================================
# Script de Sincronização Rápida
# Usa mensagem automática
# ========================================

Write-Host "🚀 Sincronização Rápida..." -ForegroundColor Cyan

# Adicionar, commitar e enviar em um comando
git add .
$message = "Update - $(Get-Date -Format 'dd/MM/yyyy HH:mm')"
git commit -m "$message"
git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Sincronizado com sucesso!" -ForegroundColor Green
    Write-Host "🌐 Vercel atualizará automaticamente..." -ForegroundColor Yellow
} else {
    Write-Host "✗ Erro na sincronização" -ForegroundColor Red
}
