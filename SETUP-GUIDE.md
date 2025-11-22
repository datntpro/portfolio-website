# 🚀 Unified Portfolio Setup Guide

## 📋 Concept

Tất cả websites chạy trên **một Cloudflare Worker** với routing:

```
/                              → Portfolio Homepage
/blog                          → Blog listing
/blog/[slug]                   → Blog post detail
/contact                       → Contact page
/projects                      → Projects listing
/projects/security-scanner     → Security Scanner detail page
```

## 📁 Cấu trúc Thư Mục

```
unified-portfolio/
├── src/
│   ├── layouts/
│   │   └── Layout.astro                    # Main layout
│   ├── pages/
│   │   ├── index.astro                     # Homepage (from portfolio-website)
│   │   ├── contact.astro                   # Contact (from portfolio-website)
│   │   ├── blog/
│   │   │   ├── index.astro                 # Blog listing
│   │   │   └── [...slug].astro             # Blog detail
│   │   └── projects/
│   │       ├── index.astro                 # Projects listing
│   │       └── security-scanner/
│   │           └── index.astro             # Scanner detail (from scanner-tools-website)
│   └── content/
│       ├── config.ts                       # Content collections
│       └── blog/                           # Blog posts
├── public/                                 # Static assets
├── astro.config.mjs
├── wrangler.toml
└── package.json
```

## 🔧 Setup Steps

### Bước 1: Copy Files

#### 1.1 Copy Layout từ portfolio-website

```bash
cp ../portfolio-website/src/layouts/Layout.astro src/layouts/
```

#### 1.2 Copy Homepage

```bash
cp ../portfolio-website/src/pages/index.astro src/pages/
```

#### 1.3 Copy Contact

```bash
cp ../portfolio-website/src/pages/contact.astro src/pages/
```

#### 1.4 Copy Blog

```bash
cp ../portfolio-website/src/pages/blog/index.astro src/pages/blog/
cp ../portfolio-website/src/pages/blog/[...slug].astro src/pages/blog/
cp -r ../portfolio-website/src/content/* src/content/
```

#### 1.5 Copy Projects Listing

```bash
# Tạo projects listing page mới hoặc copy
cp ../portfolio-website/src/pages/projects.astro src/pages/projects/index.astro
```

#### 1.6 Copy Security Scanner Detail

```bash
# Copy toàn bộ scanner website vào projects/security-scanner
cp ../scanner-tools-website/source-scanner-website/src/pages/index.astro \
   src/pages/projects/security-scanner/index.astro
```

### Bước 2: Update Links

#### 2.1 Update Navigation trong Layout.astro

```astro
<a href="/">Trang chủ</a>
<a href="/projects">Dự án</a>
<a href="/blog">Blog</a>
<a href="/contact">Liên hệ</a>
```

#### 2.2 Update Projects Listing

Trong `src/pages/projects/index.astro`:

```astro
<a href="/projects/security-scanner">
  Security Scanning Stack
</a>
```

### Bước 3: Build & Test

```bash
# Install dependencies
npm install

# Build
npm run build

# Test local
npm run dev
```

## 🎯 Routing Logic

### Portfolio Section
- `/` - Homepage với giới thiệu
- `/contact` - Contact form
- `/blog` - Blog listing
- `/blog/welcome` - Blog post

### Projects Section
- `/projects` - Tất cả projects
- `/projects/security-scanner` - Chi tiết Security Scanner
- `/projects/[future-tool]` - Future tools

## 📦 Single Deployment

```bash
# Build tất cả
npm run build

# Deploy lên một Cloudflare Worker
wrangler pages deploy ./dist
```

## ✅ Benefits

1. **Single Worker** - Chỉ một deployment
2. **Unified Navigation** - Seamless navigation
3. **Shared Layout** - Consistent design
4. **Easy Maintenance** - Một codebase
5. **Better SEO** - Một domain

## 🔄 Migration Path

### Từ 3 projects riêng:

1. ✅ `portfolio-website` → `/`, `/blog`, `/contact`
2. ✅ `scanner-tools-website` → `/projects/security-scanner`
3. ✅ `tools-hub` → `/projects` (listing)

### Thành 1 project unified:

```
unified-portfolio/ (single deployment)
```

## 📝 Next Steps

1. Copy files theo hướng dẫn trên
2. Update all internal links
3. Test routing locally
4. Build và verify
5. Deploy lên Cloudflare

---

**Note**: Vì complexity của việc merge, tôi khuyến nghị làm từng bước và test kỹ.

