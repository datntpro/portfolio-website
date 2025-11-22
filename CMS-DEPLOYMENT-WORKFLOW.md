# 🚀 CMS Deployment Workflow

## 📋 Tổng quan

Workflow đầy đủ để deploy portfolio lên Cloudflare Workers và setup Decap CMS với GitHub OAuth.

## 🎯 Workflow Steps

### Phase 1: Push to GitHub

```bash
cd unified-portfolio

# Init git
git init
git add .
git commit -m "Initial commit: Portfolio with Decap CMS"

# Create repo và push
gh repo create unified-portfolio --public --source=. --push

# Hoặc manual
git remote add origin https://github.com/datntpro/unified-portfolio.git
git branch -M main
git push -u origin main
```

✅ **Checkpoint:** Code đã có trên GitHub

---

### Phase 2: Deploy to Cloudflare Workers

```bash
# Login to Cloudflare
npx wrangler login

# Update wrangler.toml với Account ID
# Find at: https://dash.cloudflare.com/ → Workers & Pages

# Deploy
npm run deploy
```

**Output:**
```
Published unified-portfolio (0.45 sec)
  https://unified-portfolio.your-subdomain.workers.dev
```

✅ **Checkpoint:** Website live trên Cloudflare Workers

**Copy URL này:** `https://unified-portfolio.your-subdomain.workers.dev`

---

### Phase 3: Setup GitHub OAuth App

1. **Vào:** https://github.com/settings/developers

2. **New OAuth App**

3. **Điền thông tin:**
   - Application name: `Unified Portfolio CMS`
   - Homepage URL: `https://unified-portfolio.your-subdomain.workers.dev` ← Paste URL từ Phase 2
   - Description: `Decap CMS for blog management`
   - Authorization callback URL: `https://api.netlify.com/auth/done` ← Quan trọng!

4. **Register application**

5. **Copy credentials:**
   - Client ID: `abc123...`
   - Generate Client Secret: `xyz789...`

✅ **Checkpoint:** OAuth App created với production URL

---

### Phase 4: Setup Netlify (Free tier)

⚠️ **Lưu ý:** Netlify chỉ dùng để handle OAuth, không host website!

1. **Vào:** https://app.netlify.com/start

2. **Import from GitHub:**
   - Select repo: `datntpro/unified-portfolio`
   - Build command: `npm run build`
   - Publish directory: `dist`
   - Click "Deploy site"

3. **Enable Identity:**
   - Site settings → Identity
   - Click "Enable Identity"
   - Registration: "Invite only"

4. **Enable Git Gateway:**
   - Services → Git Gateway
   - Click "Enable Git Gateway"

5. **Add GitHub OAuth:**
   - Identity → External providers
   - Add provider → GitHub
   - Paste Client ID (từ Phase 3)
   - Paste Client Secret (từ Phase 3)
   - Save

✅ **Checkpoint:** Netlify configured for OAuth handling

---

### Phase 5: Test CMS

1. **Truy cập CMS trên Cloudflare Workers:**
   ```
   https://unified-portfolio.your-subdomain.workers.dev/admin/
   ```

2. **Click "Login with GitHub"**

3. **Authorize app** trên GitHub popup

4. **Success!** Bạn sẽ thấy:
   - Existing blog post: "Welcome to my blog"
   - Collections: Blog Posts
   - Media library

5. **Test create post:**
   - Click "New Blog Posts"
   - Fill in details
   - Click "Publish"
   - Check GitHub repo → New commit!

✅ **Checkpoint:** CMS hoạt động, posts sync với GitHub

---

### Phase 6: Setup GitHub Actions (Auto-deploy)

1. **Get Cloudflare API Token:**
   - https://dash.cloudflare.com/profile/api-tokens
   - Create Token → "Edit Cloudflare Workers"
   - Copy token

2. **Add GitHub Secrets:**
   - Repo → Settings → Secrets → Actions
   - New secret: `CLOUDFLARE_API_TOKEN` = (paste token)
   - New secret: `CLOUDFLARE_ACCOUNT_ID` = (your account ID)

3. **Test auto-deploy:**
   ```bash
   # Make a change
   echo "test" >> README.md
   git add .
   git commit -m "Test auto-deploy"
   git push
   
   # Check GitHub Actions tab
   ```

✅ **Checkpoint:** Auto-deploy working

---

## 🎊 Done!

### Bạn đã có:

✅ **Portfolio website** live trên Cloudflare Workers  
✅ **Decap CMS** với GitHub OAuth  
✅ **Auto-deploy** via GitHub Actions  
✅ **Blog management** từ browser  
✅ **Git-based workflow** với version control  

### URLs quan trọng:

| Service | URL |
|---------|-----|
| **Website** | https://unified-portfolio.your-subdomain.workers.dev |
| **CMS Admin** | https://unified-portfolio.your-subdomain.workers.dev/admin/ |
| **GitHub Repo** | https://github.com/datntpro/unified-portfolio |
| **Netlify Dashboard** | https://app.netlify.com/ |
| **Cloudflare Dashboard** | https://dash.cloudflare.com/ |

---

## 🔄 Daily Workflow

### Viết blog post mới:

1. Vào: `https://your-site.workers.dev/admin/`
2. Login with GitHub (chỉ lần đầu)
3. New Blog Posts
4. Write content
5. Publish
6. **Auto magic:**
   - Commit to GitHub
   - Trigger GitHub Actions
   - Deploy to Cloudflare Workers
   - Live in ~2 minutes!

---

## 🐛 Troubleshooting

### CMS không login được:

**Check:**
- [ ] OAuth App Homepage URL đúng chưa?
- [ ] Callback URL là `https://api.netlify.com/auth/done`?
- [ ] Git Gateway enabled trong Netlify?
- [ ] GitHub OAuth credentials đúng trong Netlify?

**Fix:**
```bash
# Verify OAuth App settings
# GitHub → Settings → Developer settings → OAuth Apps
# Check Homepage URL = production URL
# Check Callback URL = Netlify URL
```

### CMS không thấy posts:

**Check:**
- [ ] Repo name đúng: `datntpro/unified-portfolio`?
- [ ] Branch name đúng: `main`?
- [ ] Folder path đúng: `src/content/blog`?

**Fix:**
- Check `src/pages/admin/index.astro` config
- Verify repo exists và accessible

### Deploy failed:

**Check:**
- [ ] Wrangler authenticated?
- [ ] Account ID correct trong wrangler.toml?
- [ ] Build successful?

**Fix:**
```bash
npx wrangler whoami
npx wrangler login
npm run build
npm run deploy
```

---

## 📝 Notes

### Về Netlify:

- **Không host website** trên Netlify
- Chỉ dùng để handle OAuth flow
- Free tier đủ dùng (1000 users)
- Có thể ignore Netlify site URL

### Về Cloudflare Workers:

- **Host website** trên Workers
- CMS admin tại `/admin/`
- Fast global CDN
- Free tier: 100k requests/day

### Về GitHub OAuth:

- Homepage URL = nơi website được host
- Callback URL = nơi handle OAuth (Netlify)
- Có thể có nhiều OAuth Apps cho dev/prod

---

## 🎯 Custom Domain (Optional)

Nếu muốn dùng custom domain:

1. **Add domain to Cloudflare:**
   - Dashboard → Add site
   - Enter: `datngotien.dev`

2. **Update Workers route:**
   - Edit `wrangler.toml`:
   ```toml
   routes = [
     { pattern = "datngotien.dev/*", zone_name = "datngotien.dev" }
   ]
   ```

3. **Update OAuth App:**
   - Homepage URL: `https://datngotien.dev`
   - Callback URL: giữ nguyên

4. **Deploy:**
   ```bash
   npm run deploy
   ```

---

**Questions?** Check docs hoặc email: hi@datnt.work
