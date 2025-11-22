# ✅ GitHub OAuth Setup Checklist

## 📋 Pre-requisites

- [ ] Code đã push lên GitHub repo: `datntpro/unified-portfolio`
- [ ] GitHub account: `datntpro`
- [ ] Netlify account (free tier)

## 🔧 Setup Steps

### 1. GitHub OAuth App

- [ ] Vào https://github.com/settings/developers
- [ ] Click "New OAuth App"
- [ ] Điền thông tin:
  - [ ] Application name: `Unified Portfolio CMS`
  - [ ] Homepage URL: `http://localhost:4321`
  - [ ] Callback URL: `https://api.netlify.com/auth/done`
- [ ] Click "Register application"
- [ ] Copy **Client ID**: `________________`
- [ ] Generate **Client Secret**: `________________`

### 2. Netlify Site

- [ ] Vào https://app.netlify.com/start
- [ ] Click "Import an existing project"
- [ ] Connect to GitHub
- [ ] Select repo: `datntpro/unified-portfolio`
- [ ] Build settings:
  - [ ] Build command: `npm run build`
  - [ ] Publish directory: `dist`
- [ ] Click "Deploy site"
- [ ] Wait for deployment to complete
- [ ] Copy site URL: `________________`

### 3. Netlify Identity

- [ ] Site settings → Identity
- [ ] Click "Enable Identity"
- [ ] Registration preferences: "Invite only" (recommended)
- [ ] Services → Git Gateway
- [ ] Click "Enable Git Gateway"

### 4. GitHub OAuth in Netlify

- [ ] Identity → External providers
- [ ] Click "Add provider"
- [ ] Select "GitHub"
- [ ] Paste **Client ID** from step 1
- [ ] Paste **Client Secret** from step 1
- [ ] Click "Install provider"

### 5. Update OAuth App (After Deploy)

- [ ] Vào GitHub OAuth App settings
- [ ] Update Homepage URL to production URL
- [ ] Keep Callback URL as `https://api.netlify.com/auth/done`

### 6. Test CMS

- [ ] Local: `npm run dev`
- [ ] Visit: `http://localhost:4321/admin/`
- [ ] Click "Login with GitHub"
- [ ] Authorize app on GitHub
- [ ] Verify: Can see existing blog post
- [ ] Test: Create new blog post
- [ ] Verify: Changes committed to GitHub

## 🎯 Verification

### CMS Working:
- [ ] Can login with GitHub
- [ ] Can see existing blog posts
- [ ] Can create new post
- [ ] Can edit existing post
- [ ] Can upload images
- [ ] Changes appear in GitHub commits
- [ ] Website updates after commit

### Production:
- [ ] CMS accessible at production URL
- [ ] OAuth flow works on production
- [ ] Posts sync correctly
- [ ] Images upload successfully

## 🐛 Troubleshooting

### Cannot login:
- [ ] Check OAuth App credentials
- [ ] Verify callback URL is correct
- [ ] Clear browser cache
- [ ] Try incognito mode

### Cannot see posts:
- [ ] Check repo name in config
- [ ] Verify branch name (main/master)
- [ ] Check folder path: `src/content/blog`

### Cannot commit:
- [ ] Check Git Gateway is enabled
- [ ] Verify GitHub OAuth has repo access
- [ ] Check Netlify Identity is active

## 📝 Notes

**Important URLs:**
- GitHub OAuth Apps: https://github.com/settings/developers
- Netlify Dashboard: https://app.netlify.com/
- CMS Admin: http://localhost:4321/admin/
- Production CMS: https://your-site.netlify.app/admin/

**Credentials Storage:**
- Store Client ID and Secret securely
- Don't commit secrets to Git
- Use environment variables if needed

**Cost:**
- GitHub OAuth: Free
- Netlify Identity: Free tier (1000 users)
- Git Gateway: Free
- Total: $0/month 🎉

## ✅ Done!

Once all checkboxes are checked, your CMS is ready to use!

**Next steps:**
1. Write your first blog post via CMS
2. Upload featured images
3. Publish and verify on website
4. Share on social media!

---

**Need help?** See [GITHUB-OAUTH-SETUP.md](./GITHUB-OAUTH-SETUP.md) for detailed guide.
