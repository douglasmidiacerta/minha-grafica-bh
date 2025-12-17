# 🚀 Guia Completo: GitHub + Vercel

## 📋 Índice
1. [Configuração Inicial](#configuração-inicial)
2. [Como Atualizar o Site](#como-atualizar-o-site)
3. [Scripts Disponíveis](#scripts-disponíveis)
4. [Integração com Vercel](#integração-com-vercel)
5. [Solução de Problemas](#solução-de-problemas)

---

## 🎯 Configuração Inicial

### Passo 1: Criar Repositório no GitHub

1. Acesse: https://github.com
2. Faça login na sua conta
3. Clique no botão **"New"** (ou ícone +)
4. Preencha:
   - **Repository name:** `minha-grafica-bh`
   - **Description:** "Site profissional para Minha Gráfica BH"
   - Deixe como **Public** (para usar Vercel gratuito)
   - **NÃO** marque "Initialize with README"
5. Clique em **"Create repository"**

### Passo 2: Configurar Git Local

Abra o PowerShell na pasta do projeto e execute:

```powershell
.\setup-github.ps1
```

O script vai solicitar:
- ✅ Seu nome completo
- ✅ Seu email do GitHub
- ✅ URL do repositório (copiado do GitHub)

**Exemplo de URL:**
```
https://github.com/seu-usuario/minha-grafica-bh.git
```

---

## 🔄 Como Atualizar o Site

Depois da configuração inicial, sempre que fizer alterações:

### Opção 1: Sincronização Interativa (Recomendado)

```powershell
.\sync-github.ps1
```

Este script:
- ✅ Mostra as alterações feitas
- ✅ Permite digitar uma mensagem personalizada
- ✅ Envia para o GitHub
- ✅ Atualiza automaticamente na Vercel

### Opção 2: Sincronização Rápida

```powershell
.\quick-sync.ps1
```

Este script:
- ⚡ Sincroniza rapidamente
- ⚡ Usa mensagem automática com data/hora
- ⚡ Ideal para updates pequenos

---

## 📜 Scripts Disponíveis

### 1. `setup-github.ps1`
**Uso:** Uma vez apenas (configuração inicial)
```powershell
.\setup-github.ps1
```
**Função:** Configura Git, conecta ao GitHub e faz o primeiro push

### 2. `sync-github.ps1`
**Uso:** Sempre que fizer alterações
```powershell
.\sync-github.ps1
```
**Função:** Sincronização completa com mensagem personalizada

### 3. `quick-sync.ps1`
**Uso:** Para updates rápidos
```powershell
.\quick-sync.ps1
```
**Função:** Sincronização rápida com mensagem automática

---

## 🌐 Integração com Vercel

### Passo 1: Conectar Repositório na Vercel

1. Acesse: https://vercel.com
2. Clique em **"Sign Up"** ou **"Login"**
3. Escolha: **"Continue with GitHub"**
4. Autorize o acesso ao GitHub

### Passo 2: Criar Novo Projeto

1. No dashboard da Vercel, clique em **"New Project"**
2. Na lista de repositórios, encontre **"minha-grafica-bh"**
3. Clique em **"Import"**

### Passo 3: Configurar Deploy

1. **Project Name:** `minha-grafica-bh` (pode manter)
2. **Framework Preset:** Deixe como **"Other"**
3. **Root Directory:** Deixe como **"./"**
4. **Build Command:** Deixe vazio
5. **Output Directory:** Deixe vazio
6. Clique em **"Deploy"**

### 🎉 Pronto!

Após 1-2 minutos, seu site estará no ar!

A Vercel fornecerá:
- 🌐 **URL pública:** `https://minha-grafica-bh.vercel.app`
- 🔄 **Deploy automático:** A cada push no GitHub
- 📊 **Dashboard:** Para monitorar deploys

---

## 🔄 Fluxo de Trabalho Diário

### 1. Fazer Alterações
Edite seus arquivos HTML, CSS ou JS normalmente

### 2. Sincronizar
```powershell
.\sync-github.ps1
```

### 3. Aguardar Deploy
- ⏱️ A Vercel detecta automaticamente o push
- 🏗️ Faz o deploy (leva ~30 segundos)
- ✅ Site atualizado automaticamente!

### 4. Verificar
Acesse a URL da Vercel para ver as mudanças

---

## 🎨 Comandos Git Úteis

### Ver status das alterações
```powershell
git status
```

### Ver histórico de commits
```powershell
git log --oneline
```

### Ver diferenças
```powershell
git diff
```

### Desfazer alterações (antes do commit)
```powershell
git checkout -- nome-do-arquivo.html
```

### Ver repositório remoto
```powershell
git remote -v
```

---

## 🛠️ Solução de Problemas

### ❌ Problema: "git não reconhecido"

**Solução:**
1. Baixe o Git: https://git-scm.com/download/win
2. Instale com configurações padrão
3. Reinicie o PowerShell

---

### ❌ Problema: "Permission denied"

**Solução 1 - Usar HTTPS com Token:**
1. Acesse: https://github.com/settings/tokens
2. Clique em **"Generate new token (classic)"**
3. Marque: `repo` (todas as opções)
4. Clique em **"Generate token"**
5. **COPIE O TOKEN** (não será mostrado novamente)
6. Quando fizer push, use:
   - **Username:** seu-usuario
   - **Password:** cole-o-token

**Solução 2 - Usar SSH:**
```powershell
# Gerar chave SSH
ssh-keygen -t ed25519 -C "seu-email@example.com"

# Copiar chave pública
Get-Content ~/.ssh/id_ed25519.pub | Set-Clipboard

# Adicione em: https://github.com/settings/keys
```

---

### ❌ Problema: "Repository not found"

**Solução:**
Verifique a URL do repositório:
```powershell
git remote -v
```

Se estiver errada, atualize:
```powershell
git remote set-url origin https://github.com/SEU-USUARIO/minha-grafica-bh.git
```

---

### ❌ Problema: "Changes not showing on Vercel"

**Solução:**
1. Verifique se o push foi bem-sucedido:
   ```powershell
   git status
   ```

2. Acesse o dashboard da Vercel
3. Verifique a aba **"Deployments"**
4. Se houver erro, clique no deployment para ver logs

---

### ❌ Problema: Conflitos ao fazer push

**Solução:**
```powershell
# Baixar alterações do GitHub
git pull origin main

# Resolver conflitos manualmente nos arquivos
# Depois:
git add .
git commit -m "Resolvendo conflitos"
git push origin main
```

---

## 📊 Verificar Status do Deploy

### No GitHub:
1. Acesse seu repositório
2. Veja o ícone ✅ ou ❌ ao lado do último commit

### Na Vercel:
1. Acesse: https://vercel.com/dashboard
2. Clique no projeto **"minha-grafica-bh"**
3. Veja todos os deploys na aba **"Deployments"**

---

## 🎯 Boas Práticas

### ✅ Fazer commits frequentes
Melhor fazer vários commits pequenos do que um grande

### ✅ Usar mensagens descritivas
```powershell
# ❌ Ruim
git commit -m "update"

# ✅ Bom
git commit -m "Adiciona menu mobile responsivo"
```

### ✅ Testar localmente antes do push
Sempre abra o site no navegador antes de sincronizar

### ✅ Fazer backup
O GitHub funciona como backup automático do seu código

---

## 📞 Suporte

### GitHub:
- Documentação: https://docs.github.com
- Suporte: https://support.github.com

### Vercel:
- Documentação: https://vercel.com/docs
- Comunidade: https://github.com/vercel/vercel/discussions

---

## 🎉 Pronto para Começar!

Execute agora:
```powershell
.\setup-github.ps1
```

E comece a sincronizar suas alterações automaticamente! 🚀
