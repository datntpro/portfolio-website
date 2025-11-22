# 📦 Push to GitHub

## 🚀 Quick Setup

### 1. Initialize Git

```bash
cd unified-portfolio

# Initialize git (if not already)
git init

# Add all files
git add .

# First commit
git commit -m "Initial commit: Unified Portfolio with Cloudflare Workers support"
```

### 2. Create GitHub Repository

**Option A: Via GitHub CLI (Recommended)**

```bash
# Install GitHub CLI if needed
# macOS: brew install gh
# Login
gh auth login

# Create repo
gh repo create unified-portfolio --public --source=. --remote=origin --push

# Done! Repo created and pushed
```

**Option B: Via GitHub Website**

1. Vào https://github.com/new
2. Repository name: `unified-portfolio`
3. Description: "Portfolio website với Cloudflare Workers và Decap CMS"
4. Public
5. **DON'T** initialize with README, .gitignore, or license (đã có sẵn)
6. Create repository

### 3. Connect and Push

```bash
# Add remote
git remote add origin https://github.com/datntpro/unified-portfolio.git

# Verify
git remote -v

# Push
git branch -M main
git push -u origin main
```

## 🔐 Setup GitHub Secrets (for Auto-Deploy)

### 1. Get Cloudflare API Token

```bash
# Login to Cloudflare
npx wrangler login

# Get account info
npx wrangler whoami
```

Or manually:
1. Vào https://dash.cloudflare.com/profile/api-tokens
2. Create Token → "Edit Cloudflare Workers" template
3. Copy token

### 2. Add Secrets to GitHub

1. Vào repo: https://github.com/datntpro/unified-portfolio
2. Settings → Secrets and variables → Actions
3. New repository secret:

**Secret 1:**
- Name: `CLOUDFLARE_API_TOKEN`
- Value: (paste your API token)

**Secret 2:**
- Name: `CLOUDFLARE_ACCOUNT_ID`
- Value: (your account ID from wrangler whoami)

### 3. Test Auto-Deploy

```bash
# Make a small change
echo "# Test" >> README.md

# Commit and push
git add .
git commit -m "Test auto-deploy"
git push

# Check GitHub Actions
# Repo → Actions tab → Watch deployment
```

## 📝 Repository Settings

### Branch Protection (Optional)

Settings → Branches → Add rule:

- Branch name pattern: `main`
- ✅ Require pull request reviews before merging
- ✅ Require status checks to pass before merging
  - Select: `Deploy to Cloudflare Workers`

### Topics (for discoverability)

Settings → General → Topics:

```
astro, cloudflare-workers, portfolio, blog, decap-cms, 
tailwindcss, security, devsecops, typescript
```

### About Section

Settings → General → About:

- Description: "Portfolio website với Cloudflare Workers và Decap CMS"
- Website: https://datngotien.dev (or your Workers URL)
- Topics: (add relevant tags)

## 🎨 README Badge

Add deployment status badge to README:

```markdown
[![Deploy to Cloudflare Workers](https://github.com/datntpro/unified-portfolio/actions/workflows/deploy.yml/badge.svg)](https://github.com/datntpro/unified-portfolio/actions/workflows/deploy.yml)
```

## 📊 GitHub Pages (Optional)

Nếu muốn host documentation trên GitHub Pages:

1. Settings → Pages
2. Source: Deploy from a branch
3. Branch: `main` / `docs` folder
4. Save

## 🔄 Workflow

### Daily Development

```bash
# Create feature branch
git checkout -b feature/new-blog-post

# Make changes
# ... edit files ...

# Commit
git add .
git commit -m "Add new blog post about security scanning"

# Push
git push origin feature/new-blog-post

# Create PR on GitHub
gh pr create --title "Add new blog post" --body "Description"

# Or via web: https://github.com/datntpro/unified-portfolio/compare
```

### Merge and Deploy

```bash
# Merge PR (via GitHub UI or CLI)
gh pr merge

# Pull latest
git checkout main
git pull

# Auto-deploy will trigger via GitHub Actions
```

## 🐛 Troubleshooting

### Push rejected:

```bash
# Pull first
git pull origin main --rebase

# Then push
git push origin main
```

### Large files:

```bash
# Check file sizes
git ls-files -z | xargs -0 du -h | sort -h | tail -20

# Remove large files from history
git filter-branch --tree-filter 'rm -f path/to/large/file' HEAD
```

### Reset to remote:

```bash
# Discard local changes
git fetch origin
git reset --hard origin/main
```

## 📚 Git Best Practices

### Commit Messages

Follow conventional commits:

```bash
git commit -m "feat: add new blog post about SAST"
git commit -m "fix: resolve admin page 404 issue"
git commit -m "docs: update deployment guide"
git commit -m "style: improve mobile navigation"
git commit -m "refactor: optimize build configuration"
```

### Branch Naming

```bash
feature/blog-post-sast
fix/admin-404
docs/deployment-guide
style/mobile-nav
refactor/build-config
```

## 🎉 Done!

Your portfolio is now on GitHub with auto-deploy to Cloudflare Workers! 🚀

**Next steps:**
1. ✅ Verify GitHub Actions deployment
2. ✅ Setup custom domain (if needed)
3. ✅ Configure Decap CMS authentication
4. ✅ Write your first blog post
5. ✅ Share on social media!

---

**Questions?** Open an issue on GitHub or contact hi@datnt.work
