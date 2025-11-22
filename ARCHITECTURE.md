# 🏗️ Architecture Overview

## 🎯 Kiến trúc hệ thống

### Tổng quan:

```
┌─────────────────────────────────────────────────────────────┐
│                         USERS                                │
│                           ↓                                   │
│              https://datngotien.dev                          │
│                           ↓                                   │
│              ┌────────────────────────┐                      │
│              │  CLOUDFLARE WORKERS    │ ← Website chính      │
│              │  (Host website)        │                      │
│              │                        │                      │
│              │  • Homepage            │                      │
│              │  • Blog                │                      │
│              │  • Projects            │                      │
│              │  • /admin/ (CMS UI)    │                      │
│              └────────────────────────┘                      │
│                           ↓                                   │
│              User clicks "Login with GitHub"                 │
│                           ↓                                   │
│              ┌────────────────────────┐                      │
│              │  NETLIFY IDENTITY      │ ← OAuth handler      │
│              │  (Handle OAuth only)   │                      │
│              │                        │                      │
│              │  • GitHub OAuth        │                      │
│              │  • Git Gateway         │                      │
│              │  • User sessions       │                      │
│              └────────────────────────┘                      │
│                           ↓                                   │
│              ┌────────────────────────┐                      │
│              │  GITHUB                │ ← Source code        │
│              │  (Store content)       │                      │
│              │                        │                      │
│              │  • Blog posts (.md)    │                      │
│              │  • Images              │                      │
│              │  • Source code         │                      │
│              └────────────────────────┘                      │
│                           ↓                                   │
│              ┌────────────────────────┐                      │
│              │  GITHUB ACTIONS        │ ← Auto deploy        │
│              │  (CI/CD)               │                      │
│              │                        │                      │
│              │  • Build on commit     │                      │
│              │  • Deploy to Workers   │                      │
│              └────────────────────────┘                      │
└─────────────────────────────────────────────────────────────┘
```

## 🔍 Chi tiết từng component:

### 1. Cloudflare Workers (Website hosting)

**Vai trò:** Host toàn bộ website

**URL:** 
- Production: `https://unified-portfolio.xxx.workers.dev`
- Custom domain: `https://datngotien.dev`

**Chứa:**
- ✅ HTML/CSS/JS của website
- ✅ Blog pages
- ✅ Projects pages
- ✅ CMS admin UI (`/admin/`)
- ✅ API routes

**Không chứa:**
- ❌ OAuth logic (do Netlify xử lý)
- ❌ User database (do Netlify xử lý)

**Chi phí:** Free tier (100k requests/day)

---

### 2. Netlify Identity + Git Gateway (OAuth backend)

**Vai trò:** Xử lý authentication cho CMS

**URL:** 
- Dashboard: `https://app.netlify.com/`
- Site URL: `https://xxx.netlify.app` (không dùng, chỉ để config)

**Chức năng:**
- ✅ Handle GitHub OAuth flow
- ✅ Manage user sessions
- ✅ Git Gateway (commit to GitHub)
- ✅ User permissions

**Không làm:**
- ❌ Host website
- ❌ Serve content
- ❌ Handle traffic

**Chi phí:** Free tier (1000 users)

**Tại sao cần:**
- Decap CMS cần authentication backend
- Netlify cung cấp sẵn (free)
- Alternative: Self-host OAuth server (phức tạp)

---

### 3. GitHub (Content storage)

**Vai trò:** Lưu trữ source code và content

**URL:** `https://github.com/datntpro/unified-portfolio`

**Chứa:**
- ✅ Source code
- ✅ Blog posts (`.md` files)
- ✅ Images (`public/images/`)
- ✅ Configuration files

**Workflow:**
- User edit post trong CMS
- CMS commit to GitHub
- GitHub Actions trigger
- Auto deploy to Cloudflare Workers

**Chi phí:** Free (public repo)

---

### 4. GitHub Actions (CI/CD)

**Vai trò:** Auto-deploy khi có commit mới

**Workflow:**
```yaml
Push to main
  ↓
GitHub Actions trigger
  ↓
npm run build
  ↓
wrangler deploy
  ↓
Live on Cloudflare Workers
```

**Chi phí:** Free (2000 minutes/month)

---

## 🔄 User Flows

### Flow 1: Visitor xem website

```
User → https://datngotien.dev
  ↓
Cloudflare Workers serve HTML
  ↓
User sees website
```

**Không qua Netlify!**

---

### Flow 2: Admin login vào CMS

```
Admin → https://datngotien.dev/admin/
  ↓
Cloudflare Workers serve CMS UI
  ↓
Click "Login with GitHub"
  ↓
Redirect to GitHub OAuth
  ↓
GitHub asks: "Authorize app?"
  ↓
User clicks "Authorize"
  ↓
GitHub redirects to Netlify callback
  ↓
Netlify Identity creates session
  ↓
Redirect back to CMS on Cloudflare Workers
  ↓
Admin logged in, can edit posts
```

**Netlify chỉ xử lý OAuth, không serve website!**

---

### Flow 3: Admin tạo blog post

```
Admin logged in CMS
  ↓
Click "New Blog Posts"
  ↓
Write content
  ↓
Click "Publish"
  ↓
CMS calls Netlify Git Gateway
  ↓
Git Gateway commits to GitHub
  ↓
GitHub Actions trigger
  ↓
Build & deploy to Cloudflare Workers
  ↓
New post live!
```

---

## 📊 So sánh

| Feature | Cloudflare Workers | Netlify |
|---------|-------------------|---------|
| **Host website** | ✅ YES | ❌ NO |
| **Serve traffic** | ✅ YES | ❌ NO |
| **CMS UI** | ✅ YES | ❌ NO |
| **OAuth handling** | ❌ NO | ✅ YES |
| **Git commits** | ❌ NO | ✅ YES |
| **User sessions** | ❌ NO | ✅ YES |
| **Visitors see** | ✅ YES | ❌ NO |

---

## 🎯 Kết luận

### Website của bạn:
- **Host trên:** Cloudflare Workers ✅
- **URL:** https://unified-portfolio.xxx.workers.dev
- **Visitors truy cập:** Cloudflare Workers
- **CMS admin:** Cloudflare Workers (`/admin/`)

### Netlify:
- **Chỉ dùng cho:** OAuth + Git Gateway
- **Không host website**
- **Invisible cho users**
- **Chỉ admin thấy khi login**

### Analogy:

```
Cloudflare Workers = Nhà hàng (nơi khách đến ăn)
Netlify = Hệ thống thanh toán (xử lý payment ở background)
GitHub = Kho nguyên liệu (lưu trữ content)
```

Khách hàng (visitors) chỉ thấy nhà hàng (Cloudflare Workers), không thấy hệ thống thanh toán (Netlify)!

---

## 🚀 Setup Summary

1. **Deploy to Cloudflare Workers** ← Website chính
   ```bash
   npm run deploy
   ```

2. **Setup Netlify** ← Chỉ cho OAuth
   - Import repo
   - Enable Identity + Git Gateway
   - Ignore Netlify site URL

3. **Done!**
   - Website: Cloudflare Workers
   - CMS: Cloudflare Workers
   - OAuth: Netlify (background)

---

**Questions?** Email: hi@datnt.work
