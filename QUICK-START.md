# ⚡ Quick Start Guide

## 🚀 Deploy trong 10 phút

### 1️⃣ Push to GitHub (1 phút)

```bash
git init
git add .
git commit -m "Initial commit"
gh repo create unified-portfolio --public --source=. --push
```

### 2️⃣ Deploy to Cloudflare Workers (2 phút)

```bash
npx wrangler login
npm run deploy
```

Copy URL: `https://unified-portfolio.xxx.workers.dev`

### 3️⃣ Create GitHub OAuth App (2 phút)

- Vào: https://github.com/settings/developers
- New OAuth App
- Name: `Unified Portfolio CMS`
- Homepage: `https://unified-portfolio.xxx.workers.dev` ← Paste URL
- Callback: `https://api.netlify.com/auth/done`
- Copy Client ID & Secret

### 4️⃣ Setup Netlify (3 phút)

- Vào: https://app.netlify.com/start
- Import: `datntpro/unified-portfolio`
- Deploy
- Enable Identity + Git Gateway
- Add GitHub OAuth (paste credentials)

### 5️⃣ Test CMS (2 phút)

- Visit: `https://unified-portfolio.xxx.workers.dev/admin/`
- Login with GitHub
- Create blog post
- Publish → Auto commit! 🎉

## ✅ Done!

**Website:** https://unified-portfolio.xxx.workers.dev  
**CMS:** https://unified-portfolio.xxx.workers.dev/admin/  
**GitHub:** https://github.com/datntpro/unified-portfolio

---

## 📚 Detailed Guides

- **Full workflow:** [CMS-DEPLOYMENT-WORKFLOW.md](./CMS-DEPLOYMENT-WORKFLOW.md)
- **OAuth setup:** [GITHUB-OAUTH-SETUP.md](./GITHUB-OAUTH-SETUP.md)
- **Checklist:** [CMS-GITHUB-CHECKLIST.md](./CMS-GITHUB-CHECKLIST.md)
- **Workers deploy:** [WORKERS-DEPLOY.md](./WORKERS-DEPLOY.md)

---

**Need help?** Email: hi@datnt.work
