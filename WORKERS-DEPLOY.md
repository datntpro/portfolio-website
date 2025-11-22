# 🚀 Deploy to Cloudflare Workers

## 📋 Prerequisites

1. **Cloudflare Account**
   - Sign up at https://dash.cloudflare.com/sign-up
   - Free tier is sufficient

2. **Wrangler CLI** (Already installed)
   ```bash
   npm install -D wrangler
   ```

3. **GitHub Account** (for repo and CI/CD)

## 🔧 Configuration

### 1. Update wrangler.toml

Edit `wrangler.toml` và thêm Account ID:

```toml
name = "unified-portfolio"
account_id = "your-account-id-here"  # ← Update this
```

**Tìm Account ID:**
1. Vào https://dash.cloudflare.com/
2. Workers & Pages → Overview
3. Copy Account ID từ sidebar phải

### 2. Authenticate Wrangler

```bash
npx wrangler login
```

Browser sẽ mở để authorize. Click "Allow" để kết nối.

## 🏗️ Build & Deploy

### Option 1: Deploy thủ công (Khuyến nghị lần đầu)

```bash
# Build project
npm run build

# Deploy to Workers
npm run deploy

# Or use wrangler directly
npx wrangler deploy
```

**Output mẫu:**
```
Total Upload: 245.67 KiB / gzip: 67.89 KiB
Uploaded unified-portfolio (2.34 sec)
Published unified-portfolio (0.45 sec)
  https://unified-portfolio.your-subdomain.workers.dev
Current Deployment ID: abc123def456
```

### Option 2: GitHub Actions (Auto-deploy)

#### Setup Secrets:

1. **Get Cloudflare API Token:**
   - Vào https://dash.cloudflare.com/profile/api-tokens
   - Create Token → "Edit Cloudflare Workers" template
   - Copy token

2. **Add to GitHub Secrets:**
   - Repo → Settings → Secrets and variables → Actions
   - New repository secret:
     - Name: `CLOUDFLARE_API_TOKEN`
     - Value: (paste token)
   - New repository secret:
     - Name: `CLOUDFLARE_ACCOUNT_ID`
     - Value: (your account ID)

3. **Push to GitHub:**
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

GitHub Actions sẽ tự động deploy mỗi khi push!

## 🌐 Custom Domain

### Setup Custom Domain:

1. **Add domain to Cloudflare:**
   - Dashboard → Add site
   - Enter domain: `datngotien.dev`
   - Follow DNS setup

2. **Update wrangler.toml:**
   ```toml
   routes = [
     { pattern = "datngotien.dev/*", zone_name = "datngotien.dev" }
   ]
   ```

3. **Deploy lại:**
   ```bash
   npm run deploy
   ```

4. **Verify:**
   - Vào Workers & Pages → unified-portfolio → Settings → Triggers
   - Check Routes đã được add

## 🔐 Environment Variables

### Add secrets:

```bash
# Add API keys or sensitive data
npx wrangler secret put API_KEY

# List secrets
npx wrangler secret list
```

### Add public vars:

Edit `wrangler.toml`:
```toml
[vars]
ENVIRONMENT = "production"
SITE_URL = "https://datngotien.dev"
```

## 📊 Monitoring

### View logs:

```bash
# Real-time logs
npx wrangler tail

# Filter by status
npx wrangler tail --status error
```

### Metrics:

- Dashboard → Workers & Pages → unified-portfolio
- Analytics tab
- View requests, errors, CPU time

## 🔄 Update & Rollback

### Deploy new version:

```bash
npm run build
npm run deploy
```

### Rollback:

```bash
# List deployments
npx wrangler deployments list

# Rollback to specific deployment
npx wrangler rollback [deployment-id]
```

## 🧪 Testing

### Test locally:

```bash
# Dev mode (with hot reload)
npm run dev

# Test production build locally
npm run build
npx wrangler dev
```

### Test deployed version:

```bash
curl https://unified-portfolio.your-subdomain.workers.dev
curl https://unified-portfolio.your-subdomain.workers.dev/admin/
```

## 📝 Post-Deploy Checklist

- [ ] Website accessible at Workers URL
- [ ] All pages load correctly
- [ ] Admin panel accessible at `/admin/`
- [ ] Images display properly
- [ ] Navigation works
- [ ] Mobile responsive
- [ ] Custom domain configured (if applicable)
- [ ] SSL/HTTPS working
- [ ] Decap CMS authentication setup

## 🎯 Decap CMS Setup

After deploying, setup CMS authentication:

1. **Enable Netlify Identity** (recommended)
   - Create free Netlify site
   - Enable Identity
   - Enable Git Gateway
   - Invite yourself: hi@datnt.work

2. **Or use GitHub OAuth**
   - Update `src/pages/admin/config.yml.ts`
   - Change backend to GitHub
   - Setup OAuth app

See [DECAP-CMS-SETUP.md](./DECAP-CMS-SETUP.md) for details.

## 🚨 Troubleshooting

### Build fails:

```bash
# Clear cache
rm -rf node_modules dist .astro
npm install
npm run build
```

### Deploy fails:

```bash
# Check authentication
npx wrangler whoami

# Re-login
npx wrangler login

# Check account ID
npx wrangler whoami
```

### 404 errors:

- Check `_routes.json` in dist/
- Verify all pages are built
- Check wrangler.toml routes

### Worker exceeds limits:

- Free tier: 100,000 requests/day
- CPU time: 10ms per request
- Bundle size: 1MB compressed

Optimize:
```bash
# Check bundle size
ls -lh dist/_worker.js/

# Analyze
npx wrangler deploy --dry-run
```

## 📚 Resources

- [Cloudflare Workers Docs](https://developers.cloudflare.com/workers/)
- [Astro Cloudflare Adapter](https://docs.astro.build/en/guides/integrations-guide/cloudflare/)
- [Wrangler CLI](https://developers.cloudflare.com/workers/wrangler/)

## 🎉 Success!

Your portfolio is now live on Cloudflare Workers! 🚀

**Next steps:**
1. Setup Decap CMS authentication
2. Write your first blog post
3. Share on social media
4. Monitor analytics

---

**Questions?** Check the docs or open an issue on GitHub.
