# 🎉 Decap CMS - Sẵn sàng Go Global!

## ✅ Đã tích hợp thành công!

Unified Portfolio giờ đã có **Decap CMS** (Netlify CMS) để quản lý blog posts một cách chuyên nghiệp.

## 📦 Files đã tạo:

```
unified-portfolio/
├── public/
│   └── admin/
│       ├── config.yml          # CMS configuration (backup)
│       └── index.html          # Admin interface (backup)
├── src/
│   ├── pages/
│   │   └── admin/
│   │       ├── index.astro     # ✅ Admin page
│   │       └── config.yml.ts   # ✅ Config endpoint
│   └── layouts/
│       └── Layout.astro        # ✅ Đã thêm Netlify Identity widget
└── DECAP-CMS-SETUP.md         # Hướng dẫn chi tiết
```

## 🚀 Build Results:

```
✓ 6 pages generated
✓ Admin interface: /admin/
✓ CMS config: /admin/config.yml
✓ Build time: 1.40s
✓ Ready to deploy!
```

## 🎯 Tính năng CMS:

### 1. **Rich Text Editor**
- Markdown editor với live preview
- Syntax highlighting
- Formatting toolbar

### 2. **Media Management**
- Upload images trực tiếp
- Image preview
- Automatic optimization

### 3. **Content Fields**
- Title
- Description
- Publish Date (datetime picker)
- Author (default: Ngô Tiến Đạt)
- Featured Image
- Tags (list)
- Body (Markdown)

### 4. **Workflow**
- Draft → Review → Publish
- Git-based (mọi thay đổi = Git commit)
- Version control tự động

### 5. **Mobile-Friendly**
- Responsive design
- Viết blog từ điện thoại
- Touch-optimized

## 📱 Truy cập CMS:

### Local (sau khi setup Identity):
```
http://localhost:4323/admin/
```

### Production:
```
https://your-site.pages.dev/admin/
```

## 🔐 Setup Authentication:

### Option 1: Netlify Identity (Khuyến nghị)

1. **Deploy lên Netlify hoặc Cloudflare Pages**
2. **Enable Netlify Identity:**
   - Vào Netlify Dashboard
   - Site settings → Identity
   - Enable Identity
   - Registration: "Invite only"
3. **Enable Git Gateway:**
   - Services → Git Gateway
   - Enable Git Gateway
4. **Invite yourself:**
   - Identity tab → Invite users
   - Email: **hi@datnt.work**
5. **Accept invitation** qua email
6. **Login** tại `/admin/`

### Option 2: GitHub OAuth

Update `public/admin/config.yml`:

```yml
backend:
  name: github
  repo: your-username/unified-portfolio
  branch: main
```

Setup GitHub OAuth App:
1. GitHub Settings → Developer settings → OAuth Apps
2. New OAuth App
3. Homepage URL: `https://your-site.pages.dev`
4. Callback URL: `https://api.netlify.com/auth/done`

## 📝 Sử dụng CMS:

### Tạo blog post mới:

1. Login tại `/admin/`
2. Click **"New Blog Posts"**
3. Điền thông tin:
   - **Title**: Tiêu đề bài viết
   - **Description**: Mô tả ngắn (SEO)
   - **Publish Date**: Chọn ngày giờ
   - **Author**: Ngô Tiến Đạt (auto-fill)
   - **Featured Image**: Upload ảnh đại diện
   - **Tags**: Thêm tags (security, devsecops, etc.)
   - **Body**: Viết nội dung (Markdown)
4. **Preview** để xem trước
5. Click **"Publish"** → **"Publish now"**

### Edit blog post:

1. Login tại `/admin/`
2. Click vào post muốn edit
3. Chỉnh sửa
4. **Save** → **Publish**

### Upload images:

1. Trong editor, click **"+"** → **"Image"**
2. Upload file hoặc kéo thả
3. Image tự động lưu vào `public/images/uploads/`
4. Link tự động insert vào content

## 🌐 Deploy Instructions:

### Cloudflare Pages:

```bash
cd unified-portfolio
npm run build
wrangler pages deploy ./dist --project-name=unified-portfolio
```

### Netlify:

```bash
cd unified-portfolio
npm run build
netlify deploy --prod --dir=dist
```

## 🎨 Customize CMS:

### Thêm Projects collection:

Edit `public/admin/config.yml`:

```yml
collections:
  - name: "blog"
    # ... existing config
  
  - name: "projects"
    label: "Projects"
    folder: "src/content/projects"
    create: true
    slug: "{{slug}}"
    fields:
      - { label: "Title", name: "title", widget: "string" }
      - { label: "Description", name: "description", widget: "text" }
      - { label: "Image", name: "image", widget: "image" }
      - { label: "Tags", name: "tags", widget: "list" }
      - { label: "GitHub URL", name: "githubUrl", widget: "string" }
      - { label: "Demo URL", name: "demoUrl", widget: "string", required: false }
      - { label: "Stats", name: "stats", widget: "object", fields: [
          { label: "Tools", name: "tools", widget: "string" },
          { label: "Scan Types", name: "scanTypes", widget: "string" },
          { label: "Findings", name: "findings", widget: "string" }
        ]}
      - { label: "Features", name: "features", widget: "list" }
      - { label: "Body", name: "body", widget: "markdown" }
```

### Thêm custom widgets:

```yml
# Color picker
- { label: "Theme Color", name: "color", widget: "color" }

# Select dropdown
- { label: "Category", name: "category", widget: "select", options: ["Security", "DevOps", "Web"] }

# Boolean
- { label: "Featured", name: "featured", widget: "boolean", default: false }

# Relation (link to other content)
- { label: "Related Posts", name: "related", widget: "relation", collection: "blog", search_fields: ["title"], value_field: "title" }
```

## 🔥 Pro Tips:

### 1. **Editorial Workflow**

Enable draft/review/publish workflow:

```yml
# config.yml
publish_mode: editorial_workflow
```

### 2. **Media Library**

Customize upload folder per collection:

```yml
collections:
  - name: "blog"
    media_folder: "public/images/blog"
    public_folder: "/images/blog"
```

### 3. **Preview Templates**

Tạo custom preview trong CMS (advanced):

```js
// public/admin/preview.js
CMS.registerPreviewTemplate("blog", BlogPreview);
```

### 4. **Localization**

Support multiple languages:

```yml
# config.yml
i18n:
  structure: multiple_files
  locales: [vi, en]
  default_locale: vi
```

## 📊 Content Structure:

### Blog Post Example:

```markdown
---
title: "Hướng dẫn Security Scanning với Semgrep"
description: "Tìm hiểu cách sử dụng Semgrep để scan lỗ hổng bảo mật"
pubDate: 2024-11-22T19:30:00.000Z
author: "Ngô Tiến Đạt"
image: "/images/uploads/semgrep-guide.jpg"
tags:
  - security
  - semgrep
  - sast
---

# Giới thiệu

Semgrep là công cụ SAST mạnh mẽ...

## Cài đặt

\`\`\`bash
pip install semgrep
\`\`\`

...
```

## 🎉 Kết quả:

Bây giờ bạn có:

✅ **Portfolio website** chuyên nghiệp  
✅ **Blog** với CMS quản lý dễ dàng  
✅ **Projects showcase** đầy đủ  
✅ **Contact page** với thông tin chính xác  
✅ **Mobile-responsive** design  
✅ **SEO-optimized** content  
✅ **Git-based** workflow  
✅ **No database** required  
✅ **Fast** Cloudflare Pages hosting  

## 🚀 Ready to Go Global!

Deploy ngay và bắt đầu viết blog để chia sẻ kiến thức security với cộng đồng! 🌍

---

**Email**: hi@datnt.work  
**GitHub**: @datntpro  
**LinkedIn**: linkedin.com/in/datngotien  
**X**: @datngotien
