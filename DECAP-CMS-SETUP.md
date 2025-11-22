# Decap CMS Setup Guide

## ✅ Đã tích hợp xong!

Decap CMS (Netlify CMS) đã được cài đặt để quản lý blog posts một cách trực quan.

## 📋 Các file đã tạo:

1. **`public/admin/config.yml`** - Cấu hình CMS
2. **`public/admin/index.html`** - Admin interface
3. **Layout.astro** - Đã thêm Netlify Identity widget

## 🚀 Cách setup sau khi deploy:

### Bước 1: Deploy lên Netlify/Cloudflare Pages

```bash
cd unified-portfolio
npm run build
```

Deploy folder `dist/` lên Netlify hoặc Cloudflare Pages.

### Bước 2: Enable Netlify Identity (nếu dùng Netlify)

1. Vào Netlify Dashboard → Site settings
2. Identity → Enable Identity
3. Registration preferences → Invite only (khuyến nghị)
4. Services → Git Gateway → Enable Git Gateway

### Bước 3: Invite yourself

1. Identity tab → Invite users
2. Nhập email: **hi@datnt.work**
3. Check email và accept invitation

### Bước 4: Truy cập CMS

Sau khi deploy, truy cập:
```
https://your-site.pages.dev/admin/
```

Hoặc local (sau khi setup Identity):
```
http://localhost:4323/admin/
```

## 📝 Sử dụng CMS:

1. **Login** tại `/admin/`
2. **Create new post**: Click "New Blog Posts"
3. **Edit**: 
   - Title
   - Description
   - Publish Date
   - Author (mặc định: Ngô Tiến Đạt)
   - Featured Image (upload ảnh)
   - Tags
   - Body (Markdown editor với preview)
4. **Save**: Click "Publish" → "Publish now"

## 🎯 Tính năng:

- ✅ Rich text editor với Markdown
- ✅ Image upload
- ✅ Live preview
- ✅ Draft/Publish workflow
- ✅ Git-based (mọi thay đổi được commit vào repo)
- ✅ Không cần database

## 🔐 Bảo mật:

- Chỉ user được invite mới login được
- Mọi thay đổi đều qua Git
- Có thể review changes trước khi merge

## 📱 Mobile-friendly:

CMS hoạt động tốt trên mobile, bạn có thể viết blog từ điện thoại!

## 🌐 Alternative: Cloudflare Pages

Nếu deploy trên Cloudflare Pages, bạn có thể:

1. **Option 1**: Dùng Netlify Identity (free tier)
   - Tạo Netlify site chỉ để dùng Identity
   - Point Git Gateway về Cloudflare Pages repo

2. **Option 2**: Dùng GitHub OAuth
   - Setup OAuth app trên GitHub
   - Config trong `config.yml`:
   ```yml
   backend:
     name: github
     repo: your-username/your-repo
     branch: main
   ```

## 📚 Thêm collections:

Muốn quản lý Projects qua CMS? Thêm vào `config.yml`:

```yml
  - name: "projects"
    label: "Projects"
    folder: "src/content/projects"
    create: true
    fields:
      - { label: "Title", name: "title", widget: "string" }
      - { label: "Description", name: "description", widget: "text" }
      - { label: "Image", name: "image", widget: "image" }
      - { label: "Tags", name: "tags", widget: "list" }
      - { label: "GitHub URL", name: "githubUrl", widget: "string" }
      - { label: "Body", name: "body", widget: "markdown" }
```

## 🎉 Ready to go global!

Bây giờ bạn có thể:
- Viết blog posts từ bất kỳ đâu
- Upload images trực tiếp
- Preview trước khi publish
- Quản lý content không cần code editor

Happy blogging! 🚀
