# 🔐 Netlify Identity + Git Gateway Setup

## 📋 Hướng dẫn chi tiết từng bước

### Prerequisites:
- ✅ Code đã push lên GitHub: `datntpro/unified-portfolio`
- ✅ GitHub OAuth App đã tạo (Client ID & Secret)
- ✅ Netlify account (free)

---

## 🚀 Bước 1: Import Repo vào Netlify

### 1.1. Đăng nhập Netlify

Vào: https://app.netlify.com/

- Click "Sign up" hoặc "Log in"
- Chọn "Sign up with GitHub" (khuyến nghị)
- Authorize Netlify trên GitHub

### 1.2. Import Project

1. **Click "Add new site"** (hoặc "Import an existing project")

2. **Connect to Git provider:**
   - Click "Import from Git"
   - Chọn "GitHub"
   - Authorize Netlify (nếu chưa)

3. **Select repository:**
   - Tìm và chọn: `datntpro/unified-portfolio`
   - Click vào repo

4. **Configure build settings:**
   ```
   Branch to deploy: main
   Build command: npm run build
   Publish directory: dist
   ```

5. **Click "Deploy site"**

   Netlify sẽ:
   - Clone repo
   - Install dependencies
   - Build project
   - Deploy (ignore URL này!)

6. **Đợi deploy xong** (~2-3 phút)
   - Bạn sẽ thấy: "Site is live" ✅
   - URL: `https://random-name-123.netlify.app`
   - **IGNORE URL này!** Không dùng cho production

---

## 🔐 Bước 2: Enable Identity

### 2.1. Vào Site Settings

1. **Click vào site name** (ở dashboard)
2. **Click "Site settings"** (top menu)

### 2.2. Enable Identity

1. **Sidebar → Identity**
2. **Click "Enable Identity"** (big button)
3. **Confirm** → Identity enabled! ✅

### 2.3. Configure Registration

1. **Vẫn ở Identity settings**
2. **Registration preferences:**
   - Click "Edit settings"
   - Chọn: **"Invite only"** (khuyến nghị)
   - Save

   **Lý do:** Chỉ bạn có thể login, không ai khác

---

## 🔗 Bước 3: Enable Git Gateway

### 3.1. Vào Services

1. **Vẫn ở Identity settings**
2. **Scroll xuống → "Services"**
3. **Tìm "Git Gateway"**

### 3.2. Enable Git Gateway

1. **Click "Enable Git Gateway"**
2. **Popup hiện ra:**
   - "Git Gateway allows Netlify Identity users to manage content..."
3. **Click "Enable Git Gateway"** (confirm)
4. **Done!** Git Gateway enabled ✅

**Giải thích:**
- Git Gateway cho phép CMS commit trực tiếp lên GitHub
- Không cần GitHub personal access token
- Tự động handle authentication

---

## 🔑 Bước 4: Add GitHub OAuth Provider

### 4.1. Vào External Providers

1. **Vẫn ở Identity settings**
2. **Scroll xuống → "External providers"**
3. **Click "Add provider"**

### 4.2. Select GitHub

1. **Popup hiện ra với list providers**
2. **Click "GitHub"**

### 4.3. Enter OAuth Credentials

**Form sẽ có 2 fields:**

1. **Client ID:**
   ```
   Paste Client ID từ GitHub OAuth App
   ```
   (Từ: https://github.com/settings/developers)

2. **Client Secret:**
   ```
   Paste Client Secret từ GitHub OAuth App
   ```

3. **Click "Install provider"**

4. **Done!** GitHub OAuth configured ✅

---

## ✅ Bước 5: Verify Setup

### 5.1. Check Identity Dashboard

1. **Vào Identity tab** (top menu)
2. **Bạn sẽ thấy:**
   - "0 users" (chưa có ai login)
   - "Invite users" button
   - External providers: GitHub ✅

### 5.2. Check Settings Summary

**Vào Site settings → Identity:**

```
✅ Identity: Enabled
✅ Registration: Invite only
✅ Git Gateway: Enabled
✅ External providers: GitHub
```

**Nếu tất cả có ✅ → Setup thành công!**

---

## 🎯 Bước 6: Test CMS Login

### 6.1. Truy cập CMS

**Quan trọng:** Test trên **Cloudflare Workers URL**, không phải Netlify!

```
https://unified-portfolio.xxx.workers.dev/admin/
```

(Hoặc localhost nếu đang dev)

### 6.2. Login Flow

1. **Click "Login with GitHub"**

2. **GitHub popup hiện ra:**
   - "Authorize [App Name]"
   - Permissions: Read/Write repo
   - Click "Authorize"

3. **Redirect về CMS**
   - Logged in! ✅
   - Thấy "Collections: Blog Posts"
   - Thấy existing blog post

### 6.3. Test Create Post

1. **Click "New Blog Posts"**
2. **Fill in:**
   - Title: "Test Post"
   - Description: "Testing CMS"
   - Content: "Hello world"
3. **Click "Publish"**
4. **Check GitHub:**
   - Vào repo: `datntpro/unified-portfolio`
   - Commits → Thấy commit mới từ CMS! ✅

**Nếu commit xuất hiện → Setup hoàn tất!** 🎉

---

## 🐛 Troubleshooting

### Lỗi: "Failed to load entries"

**Nguyên nhân:**
- GitHub OAuth chưa config đúng
- Repo name sai trong CMS config

**Fix:**
1. Check `src/pages/admin/index.astro`:
   ```javascript
   repo: 'datntpro/unified-portfolio'  // Đúng chưa?
   branch: 'main'  // Đúng chưa?
   ```
2. Verify GitHub OAuth credentials trong Netlify
3. Clear browser cache và thử lại

---

### Lỗi: "Authentication failed"

**Nguyên nhân:**
- Client ID hoặc Secret sai
- OAuth App chưa authorize

**Fix:**
1. Vào GitHub OAuth App settings
2. Re-generate Client Secret
3. Update trong Netlify Identity
4. Thử login lại

---

### Lỗi: "Cannot commit to repository"

**Nguyên nhân:**
- Git Gateway chưa enable
- Repo permissions không đủ

**Fix:**
1. Check Git Gateway enabled trong Netlify
2. Verify GitHub OAuth App có quyền "repo"
3. Re-authorize OAuth App

---

### CMS không thấy blog posts

**Nguyên nhân:**
- Folder path sai
- Branch sai

**Fix:**
1. Check config:
   ```javascript
   folder: 'src/content/blog'  // Đúng chưa?
   ```
2. Verify file tồn tại:
   ```
   src/content/blog/2024-11-22-welcome-to-my-blog.md
   ```
3. Check branch: `main` (không phải `master`)

---

## 📝 Checklist

### Identity Setup:
- [ ] Netlify site deployed
- [ ] Identity enabled
- [ ] Registration: Invite only
- [ ] Git Gateway enabled
- [ ] GitHub OAuth provider added
- [ ] Client ID correct
- [ ] Client Secret correct

### Testing:
- [ ] Can access CMS at `/admin/`
- [ ] Can click "Login with GitHub"
- [ ] GitHub authorization works
- [ ] Can see existing blog posts
- [ ] Can create new post
- [ ] New post commits to GitHub
- [ ] GitHub Actions triggers (if setup)

### Verification:
- [ ] Check Netlify Identity dashboard
- [ ] Check GitHub commits
- [ ] Check website updates

---

## 🎊 Done!

Nếu tất cả checklist đều ✅, bạn đã setup thành công!

### Bây giờ bạn có thể:

✅ Login vào CMS bằng GitHub  
✅ Xem tất cả blog posts  
✅ Tạo posts mới  
✅ Edit posts hiện tại  
✅ Upload images  
✅ Mọi thay đổi tự động commit lên GitHub  
✅ Auto-deploy (nếu có GitHub Actions)  

---

## 📚 Next Steps

1. **Viết blog post đầu tiên:**
   - Vào `/admin/`
   - New Blog Posts
   - Write & Publish!

2. **Setup custom domain** (optional):
   - Cloudflare Workers → Custom domains
   - Update GitHub OAuth App Homepage URL

3. **Invite collaborators** (optional):
   - Netlify Identity → Invite users
   - Share CMS access

---

## 🔗 Quick Links

- **Netlify Dashboard:** https://app.netlify.com/
- **Identity Settings:** Site settings → Identity
- **GitHub OAuth Apps:** https://github.com/settings/developers
- **CMS Admin:** https://your-site.workers.dev/admin/

---

**Questions?** Email: hi@datnt.work
