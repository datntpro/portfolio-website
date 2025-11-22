# ✅ Decap CMS - Sẵn sàng cho GitHub!

## 🎉 Đã cấu hình xong!

Decap CMS đã được setup để login bằng GitHub và sync posts trực tiếp lên repo.

## 📦 Đã làm gì:

### 1. **CMS Configuration**
- ✅ Updated admin page với GitHub backend
- ✅ Repo: `datntpro/unified-portfolio`
- ✅ Branch: `main`
- ✅ Folder: `src/content/blog`

### 2. **Documentation**
- ✅ `GITHUB-OAUTH-SETUP.md` - Chi tiết setup OAuth
- ✅ `CMS-GITHUB-CHECKLIST.md` - Checklist từng bước
- ✅ `setup-cms.sh` - Quick setup script

### 3. **Files Updated**
- ✅ `src/pages/admin/index.astro` - GitHub backend config
- ✅ `README-GITHUB.md` - Updated với CMS instructions

## 🚀 Cách setup (5 phút):

### Bước 1: Push code lên GitHub

```bash
cd unified-portfolio

# Init git (nếu chưa)
git init
git add .
git commit -m "Add Decap CMS with GitHub OAuth"

# Push to GitHub
git remote add origin https://github.com/datntpro/unified-portfolio.git
git branch -M main
git push -u origin main
```

### Bước 2: Tạo GitHub OAuth App

1. Vào: https://github.com/settings/developers
2. New OAuth App
3. Điền:
   - Name: `Unified Portfolio CMS`
   - Homepage: `http://localhost:4321`
   - Callback: `https://api.netlify.com/auth/done`
4. Copy **Client ID** và **Client Secret**

### Bước 3: Setup Netlify (Free)

1. Vào: https://app.netlify.com/start
2. Import từ GitHub: `datntpro/unified-portfolio`
3. Build: `npm run build`, Publish: `dist`
4. Deploy!

### Bước 4: Enable Git Gateway

1. Site settings → Identity → Enable Identity
2. Services → Git Gateway → Enable
3. External providers → GitHub
4. Paste Client ID và Secret

### Bước 5: Test!

```bash
npm run dev
```

Visit: http://localhost:4321/admin/
- Click "Login with GitHub"
- Authorize
- See your blog post!
- Create new post
- Publish → Auto commit to GitHub! 🎉

## 📝 Workflow sau khi setup:

### Viết blog post mới:

1. Vào `/admin/`
2. Login with GitHub (chỉ lần đầu)
3. Click "New Blog Posts"
4. Điền:
   - Title
   - Description
   - Publish Date
   - Author (auto: Ngô Tiến Đạt)
   - Featured Image (upload)
   - Tags
   - Body (Markdown editor)
5. Click "Publish"

**CMS sẽ tự động:**
- ✅ Tạo file `.md` trong `src/content/blog/`
- ✅ Commit lên GitHub với message
- ✅ Trigger GitHub Actions (nếu có)
- ✅ Auto-deploy website

### Edit blog post:

1. Vào `/admin/`
2. Click vào post
3. Edit content
4. Click "Publish"
5. Changes auto commit!

### Upload images:

1. Trong editor: "+" → "Image"
2. Upload file
3. Image lưu vào `public/images/uploads/`
4. Auto commit to GitHub

## 🎯 Tính năng:

### ✅ Đã có:
- Login bằng GitHub
- Xem tất cả blog posts
- Create/Edit/Delete posts
- Upload images
- Markdown editor với preview
- Auto commit to GitHub
- Git-based workflow

### 🔄 Sync workflow:
```
CMS Edit → Commit to GitHub → GitHub Actions → Deploy → Live!
```

## 📚 Documentation:

| File | Purpose |
|------|---------|
| `GITHUB-OAUTH-SETUP.md` | ✅ Chi tiết setup OAuth |
| `CMS-GITHUB-CHECKLIST.md` | ✅ Checklist từng bước |
| `setup-cms.sh` | ✅ Quick setup script |
| `README-GITHUB.md` | ✅ Updated với CMS info |

## 🔧 Configuration:

### Current Config:
```javascript
backend: {
  name: 'github',
  repo: 'datntpro/unified-portfolio',
  branch: 'main'
}
```

### Blog Posts Location:
```
src/content/blog/
├── 2024-11-22-welcome-to-my-blog.md  ← Existing post
└── [new posts will be here]
```

### Images Location:
```
public/images/uploads/
└── [uploaded images]
```

## 🎊 Benefits:

### Cho bạn:
- ✅ Viết blog từ bất kỳ đâu (browser)
- ✅ Không cần code editor
- ✅ Upload images dễ dàng
- ✅ Preview trước khi publish
- ✅ Mobile-friendly

### Cho workflow:
- ✅ Git-based (version control)
- ✅ Auto commit messages
- ✅ Trigger CI/CD tự động
- ✅ Rollback dễ dàng (Git history)
- ✅ Collaborate với team

### Chi phí:
- ✅ GitHub: Free
- ✅ Netlify Identity: Free (1000 users)
- ✅ Git Gateway: Free
- ✅ **Total: $0/month** 🎉

## 🚨 Important Notes:

### Local Development:
- GitHub OAuth chỉ hoạt động sau khi setup Netlify
- Local dev sẽ redirect đến GitHub để authorize
- Sau khi authorize, redirect về local

### Production:
- Update OAuth App Homepage URL thành production URL
- Callback URL giữ nguyên: `https://api.netlify.com/auth/done`
- CMS sẽ hoạt động tại: `https://your-site.com/admin/`

### Security:
- Chỉ bạn (GitHub account owner) có thể login
- Mọi thay đổi đều qua Git (audit trail)
- Netlify Identity có thể invite thêm users

## 📖 Quick Reference:

### URLs:
- **GitHub OAuth Apps**: https://github.com/settings/developers
- **Netlify Dashboard**: https://app.netlify.com/
- **Local CMS**: http://localhost:4321/admin/
- **Production CMS**: https://your-site.com/admin/

### Commands:
```bash
# Run setup script
./setup-cms.sh

# Start dev server
npm run dev

# Build
npm run build

# Deploy
npm run deploy
```

## ✅ Ready!

Mọi thứ đã sẵn sàng! Chỉ cần:

1. ✅ Push code lên GitHub
2. ✅ Setup GitHub OAuth App (5 phút)
3. ✅ Setup Netlify (5 phút)
4. ✅ Login và viết blog! 🚀

**Chi tiết:** Xem [GITHUB-OAUTH-SETUP.md](./GITHUB-OAUTH-SETUP.md)

**Checklist:** Xem [CMS-GITHUB-CHECKLIST.md](./CMS-GITHUB-CHECKLIST.md)

---

**Questions?** Email: hi@datnt.work
