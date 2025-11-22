# 🔐 Setup GitHub OAuth for Decap CMS

## 📋 Overview

Để login vào Decap CMS bằng GitHub và commit posts trực tiếp lên repo, bạn cần tạo GitHub OAuth App.

## 🚀 Quick Setup

### Bước 1: Tạo GitHub OAuth App

1. **Vào GitHub Settings:**
   - https://github.com/settings/developers
   - Hoặc: GitHub → Settings → Developer settings → OAuth Apps

2. **Click "New OAuth App"**

3. **Điền thông tin:**

   **Application name:**
   ```
   Unified Portfolio CMS
   ```

   **Homepage URL:**
   ```
   http://localhost:4321
   ```
   ⚠️ **Lưu ý:** Đây là URL tạm để test local. Sau khi deploy lên Cloudflare Workers, bạn sẽ update thành:
   ```
   https://unified-portfolio.your-subdomain.workers.dev
   ```
   hoặc custom domain của bạn

   **Application description:**
   ```
   Decap CMS for managing blog posts
   ```

   **Authorization callback URL:**
   ```
   https://api.netlify.com/auth/done
   ```
   ⚠️ **Quan trọng:** Phải dùng Netlify callback URL này!

4. **Click "Register application"**

5. **Copy credentials:**
   - **Client ID**: Copy và lưu lại
   - **Client Secret**: Click "Generate a new client secret" → Copy và lưu lại

### Bước 2: Setup Netlify (Free tier)

Decap CMS cần Netlify để handle OAuth flow (miễn phí, không cần deploy site lên Netlify).

1. **Tạo Netlify account:**
   - https://app.netlify.com/signup
   - Sign up with GitHub

2. **Create new site:**
   - Dashboard → Add new site → Import an existing project
   - Connect to GitHub
   - Select repo: `datntpro/unified-portfolio`
   - **Build settings:**
     - Build command: `npm run build`
     - Publish directory: `dist`
   - Click "Deploy site"

3. **Enable Git Gateway:**
   - Site settings → Identity → Enable Identity
   - Settings → Identity → Services → Git Gateway
   - Click "Enable Git Gateway"

4. **Add GitHub OAuth:**
   - Settings → Identity → External providers
   - Click "Add provider" → GitHub
   - Paste **Client ID** và **Client Secret** từ bước 1
   - Save

### Bước 3: Deploy lên Cloudflare Workers

```bash
# Build và deploy
npm run deploy
```

Bạn sẽ nhận được URL như:
```
https://unified-portfolio.your-subdomain.workers.dev
```

### Bước 4: Update OAuth App với Production URL

**Quan trọng:** Sau khi deploy lên Cloudflare Workers:

1. Vào GitHub OAuth App settings: https://github.com/settings/developers
2. Click vào app "Unified Portfolio CMS"
3. Update **Homepage URL** thành Workers URL:
   ```
   https://unified-portfolio.your-subdomain.workers.dev
   ```
   hoặc custom domain:
   ```
   https://datngotien.dev
   ```

4. **Authorization callback URL** GIỮ NGUYÊN:
   ```
   https://api.netlify.com/auth/done
   ```
   ⚠️ Không đổi URL này dù deploy ở đâu!

5. Click "Update application"

### Bước 5: Test CMS trên Production

⚠️ **Lưu ý:** GitHub OAuth chỉ hoạt động đầy đủ trên production, không phải localhost!

1. **Truy cập CMS trên production:**
   ```
   https://unified-portfolio.your-subdomain.workers.dev/admin/
   ```

2. **Click "Login with GitHub"**

3. **Authorize app** trên GitHub

4. **Done!** Bạn sẽ thấy blog post hiện tại trong CMS

### Test Local (Optional)

Nếu muốn test local, cần thêm `http://localhost:4321` vào OAuth App:
- GitHub OAuth App → Update application
- Thêm `http://localhost:4321` vào Homepage URL (tạm thời)
- Sau khi test xong, đổi lại thành production URL

## 🎯 Alternative: Deploy trên Cloudflare Workers

Nếu bạn deploy trên Cloudflare Workers thay vì Netlify:

### Option 1: Vẫn dùng Netlify cho OAuth (Recommended)

- Deploy site lên Cloudflare Workers
- Dùng Netlify (free tier) chỉ để handle OAuth
- Update OAuth App Homepage URL thành Workers URL
- Callback URL vẫn là Netlify

### Option 2: Self-hosted OAuth server

Phức tạp hơn, cần deploy OAuth server riêng. Không khuyến nghị.

## 📝 Workflow sau khi setup

### Tạo blog post mới:

1. Vào `/admin/`
2. Login with GitHub
3. Click "New Blog Posts"
4. Viết content
5. Click "Publish"
6. CMS sẽ tự động:
   - Tạo file `.md` trong `src/content/blog/`
   - Commit lên GitHub
   - Trigger rebuild (nếu có CI/CD)

### Edit blog post:

1. Vào `/admin/`
2. Click vào post muốn edit
3. Chỉnh sửa
4. Click "Publish"
5. CMS commit changes lên GitHub

### Upload images:

1. Trong editor, click "+" → "Image"
2. Upload file
3. Image lưu vào `public/images/uploads/`
4. Auto commit lên GitHub

## 🔧 Troubleshooting

### "Error: Failed to load entries"

- Check GitHub repo name đúng chưa
- Check branch name (main/master)
- Verify OAuth credentials

### "Authentication failed"

- Re-generate Client Secret
- Update trong Netlify Identity settings
- Clear browser cache và thử lại

### "Cannot read repository"

- Check GitHub OAuth App có quyền access repo
- Verify repo là public hoặc OAuth app có quyền private repos

### Local development không login được

- Đây là bình thường với GitHub backend
- Cần deploy lên production để test OAuth flow
- Hoặc dùng test-repo backend cho local dev

## 🎊 Done!

Sau khi setup xong, bạn có thể:

✅ Login vào CMS bằng GitHub  
✅ Xem tất cả blog posts hiện tại  
✅ Tạo/Edit/Delete posts  
✅ Upload images  
✅ Mọi thay đổi tự động commit lên GitHub  
✅ Trigger auto-deploy (nếu có GitHub Actions)  

## 📚 Resources

- [Decap CMS GitHub Backend](https://decapcms.org/docs/github-backend/)
- [Netlify Identity](https://docs.netlify.com/visitor-access/identity/)
- [GitHub OAuth Apps](https://docs.github.com/en/developers/apps/building-oauth-apps)

---

**Questions?** Check documentation hoặc email: hi@datnt.work
