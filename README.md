# 🎯 Portfolio

Tất cả websites trong một Cloudflare Worker duy nhất.

## ✅ Đã Hoàn Thành

Files đã được merge từ 3 projects:
- ✅ Portfolio homepage, blog, contact
- ✅ Security Scanner detail page
- ✅ Blog content
- ✅ Projects listing page
- ✅ **Decap CMS** - Quản lý blog posts trực quan

## 📁 Cấu trúc

```
/                              → Homepage
/blog                          → Blog
/contact                       → Contact
/projects                      → Projects listing (CẦN TẠO)
/projects/security-scanner     → Security Scanner detail
```

## 📝 Content Management

### Decap CMS (Netlify CMS)

Quản lý blog posts qua giao diện trực quan tại `/admin/`

**Features:**
- ✅ Rich text editor với Markdown
- ✅ Image upload
- ✅ Live preview
- ✅ Git-based (không cần database)
- ✅ Mobile-friendly

**Setup:** Xem [DECAP-CMS-SETUP.md](./DECAP-CMS-SETUP.md)

## 🚀 Build & Test

```bash
# Install
npm install

# Build
npm run build

# Test local
npm run dev
```

## 📦 Deploy

```bash
wrangler pages deploy ./dist --project-name=unified-portfolio
```

## 🎯 Result

Một website duy nhất với tất cả content, chạy trên một Cloudflare Worker!

