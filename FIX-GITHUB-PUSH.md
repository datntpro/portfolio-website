# 🔧 Fix GitHub Push Issues

## 🚨 Vấn đề hiện tại:

1. ❌ Remote đang trỏ đến repo không tồn tại: `portfolio-website`
2. ❌ SSH key không được cấu hình

## ✅ Giải pháp:

### Option 1: Tạo Repo Mới (Khuyến nghị)

#### A. Via GitHub CLI (Nhanh nhất)

```bash
cd unified-portfolio

# Login GitHub CLI (nếu chưa)
gh auth login

# Tạo repo mới và push
gh repo create unified-portfolio --public --source=. --remote=origin --push

# Done! Repo đã được tạo và code đã được push
```

#### B. Via GitHub Website

**Bước 1: Tạo repo trên GitHub**

1. Vào https://github.com/new
2. Repository name: `unified-portfolio`
3. Description: "Portfolio website với Cloudflare Workers và Decap CMS"
4. Public
5. **KHÔNG** check "Initialize with README" (đã có sẵn)
6. Click "Create repository"

**Bước 2: Update remote và push**

```bash
cd unified-portfolio

# Remove remote cũ
git remote remove origin

# Add remote mới
git remote add origin https://github.com/datntpro/unified-portfolio.git

# Verify
git remote -v

# Push
git push -u origin main
```

### Option 2: Push vào Repo Hiện Tại

Nếu bạn đã có repo khác muốn dùng:

```bash
cd unified-portfolio

# Update remote URL
git remote set-url origin https://github.com/datntpro/YOUR-REPO-NAME.git

# Push
git push -u origin main
```

## 🔐 Setup SSH Key (Optional - cho lần sau)

Nếu muốn dùng SSH thay vì HTTPS:

### Bước 1: Tạo SSH Key

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "hi@datnt.work"

# Press Enter để dùng default location
# Nhập passphrase (hoặc Enter để skip)

# Start SSH agent
eval "$(ssh-agent -s)"

# Add key to agent
ssh-add ~/.ssh/id_ed25519
```

### Bước 2: Add SSH Key to GitHub

```bash
# Copy public key
cat ~/.ssh/id_ed25519.pub | pbcopy
# Or manually: cat ~/.ssh/id_ed25519.pub
```

1. Vào https://github.com/settings/keys
2. Click "New SSH key"
3. Title: "MacBook Pro" (hoặc tên máy)
4. Key: Paste key đã copy
5. Click "Add SSH key"

### Bước 3: Test SSH

```bash
# Test connection
ssh -T git@github.com

# Should see: "Hi datntpro! You've successfully authenticated..."
```

### Bước 4: Update Remote to SSH

```bash
cd unified-portfolio

# Change to SSH URL
git remote set-url origin git@github.com:datntpro/unified-portfolio.git

# Push
git push origin main
```

## 🎯 Quick Fix Script

Tạo file `fix-github.sh`:

```bash
#!/bin/bash

echo "🔧 Fixing GitHub remote..."

# Check if gh CLI is installed
if command -v gh &> /dev/null; then
    echo "✅ GitHub CLI found"
    echo "🚀 Creating repo and pushing..."
    gh repo create unified-portfolio --public --source=. --remote=origin --push
    echo "✅ Done!"
else
    echo "❌ GitHub CLI not found"
    echo "📝 Please install: brew install gh"
    echo ""
    echo "Or manually:"
    echo "1. Create repo at: https://github.com/new"
    echo "2. Run: git remote set-url origin https://github.com/datntpro/unified-portfolio.git"
    echo "3. Run: git push -u origin main"
fi
```

Chạy:
```bash
chmod +x fix-github.sh
./fix-github.sh
```

## 🧪 Verify Push

Sau khi push thành công:

```bash
# Check remote
git remote -v

# Check last commit
git log --oneline -1

# Verify on GitHub
open https://github.com/datntpro/unified-portfolio
```

## 🚨 Common Errors

### Error: "Permission denied (publickey)"

**Cause**: SSH key chưa được setup

**Fix**: Dùng HTTPS hoặc setup SSH key (xem trên)

```bash
git remote set-url origin https://github.com/datntpro/unified-portfolio.git
```

### Error: "Repository not found"

**Cause**: Repo chưa tồn tại hoặc URL sai

**Fix**: Tạo repo trước hoặc check URL

```bash
# Check current remote
git remote -v

# Update to correct URL
git remote set-url origin https://github.com/datntpro/CORRECT-REPO-NAME.git
```

### Error: "Authentication failed"

**Cause**: GitHub credentials chưa được lưu

**Fix**: Setup credential helper

```bash
# macOS
git config --global credential.helper osxkeychain

# Or use Personal Access Token
# GitHub → Settings → Developer settings → Personal access tokens
# Generate token with 'repo' scope
# Use token as password when pushing
```

### Error: "Updates were rejected"

**Cause**: Remote có commits mới hơn local

**Fix**: Pull trước khi push

```bash
git pull origin main --rebase
git push origin main
```

## 📝 Recommended Workflow

```bash
# 1. Create repo (choose one method)
gh repo create unified-portfolio --public --source=. --push

# OR manually via GitHub website + 
git remote add origin https://github.com/datntpro/unified-portfolio.git
git push -u origin main

# 2. Verify
open https://github.com/datntpro/unified-portfolio

# 3. Setup GitHub Actions secrets
# - CLOUDFLARE_API_TOKEN
# - CLOUDFLARE_ACCOUNT_ID

# 4. Push changes to trigger auto-deploy
git add .
git commit -m "Update configuration"
git push
```

## ✅ Success Checklist

- [ ] Repo created on GitHub
- [ ] Remote URL updated
- [ ] Code pushed successfully
- [ ] Repo visible at github.com/datntpro/unified-portfolio
- [ ] GitHub Actions secrets added
- [ ] Auto-deploy working

## 🆘 Still Having Issues?

1. **Check GitHub status**: https://www.githubstatus.com/
2. **Verify credentials**: `gh auth status` or check GitHub settings
3. **Try HTTPS instead of SSH**: More reliable for first-time setup
4. **Check repo permissions**: Make sure you own the repo

## 🎉 Next Steps

After successful push:

1. ✅ Setup GitHub Actions secrets
2. ✅ Deploy to Cloudflare Workers
3. ✅ Configure custom domain
4. ✅ Setup Decap CMS authentication

---

**Need help?** Open an issue or contact hi@datnt.work
