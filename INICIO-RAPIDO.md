# ⚡ Início Rápido - 5 Minutos

## 🎯 Configuração Inicial (Fazer 1 vez)

### 1️⃣ Criar Repositório no GitHub
```
1. Acesse: https://github.com/new
2. Nome: minha-grafica-bh
3. Deixe Público
4. Clique "Create repository"
5. Copie a URL: https://github.com/SEU-USUARIO/minha-grafica-bh.git
```

### 2️⃣ Configurar Git Local
```powershell
.\setup-github.ps1
```
**O script vai pedir:**
- Seu nome
- Seu email
- URL do GitHub (que você copiou acima)

---

## 🔄 Uso Diário (Toda vez que fizer alterações)

### Atualizar o Site
```powershell
.\sync-github.ps1
```

**Ou para sincronização rápida:**
```powershell
.\quick-sync.ps1
```

---

## 🌐 Conectar na Vercel (Fazer 1 vez)

### 1️⃣ Acessar Vercel
```
1. https://vercel.com
2. Login com GitHub
3. Autorizar acesso
```

### 2️⃣ Importar Projeto
```
1. Clicar "New Project"
2. Selecionar "minha-grafica-bh"
3. Clicar "Deploy"
4. Aguardar 1-2 minutos
```

### 3️⃣ Pronto! 🎉
```
Seu site estará em:
https://minha-grafica-bh.vercel.app

A cada push no GitHub, a Vercel atualiza automaticamente!
```

---

## 📋 Resumo dos Comandos

| Comando | Quando Usar |
|---------|-------------|
| `.\setup-github.ps1` | Apenas 1 vez (configuração inicial) |
| `.\sync-github.ps1` | Sempre que fizer alterações |
| `.\quick-sync.ps1` | Para updates rápidos |

---

## 🆘 Precisa de Ajuda?

Consulte o **GUIA-GITHUB-VERCEL.md** para documentação completa!
