# ⚡ Identity Setup - Quick Guide

## 🎯 3 bước chính

### 1️⃣ Enable Identity (1 phút)

```
Netlify Dashboard
  ↓
Site settings
  ↓
Identity (sidebar)
  ↓
Click "Enable Identity"
  ↓
Registration: "Invite only"
  ↓
Done! ✅
```

---

### 2️⃣ Enable Git Gateway (30 giây)

```
Vẫn ở Identity settings
  ↓
Scroll xuống → Services
  ↓
Git Gateway
  ↓
Click "Enable Git Gateway"
  ↓
Confirm
  ↓
Done! ✅
```

---

### 3️⃣ Add GitHub OAuth (1 phút)

```
Vẫn ở Identity settings
  ↓
Scroll xuống → External providers
  ↓
Click "Add provider"
  ↓
Select "GitHub"
  ↓
Paste Client ID (từ GitHub OAuth App)
Paste Client Secret (từ GitHub OAuth App)
  ↓
Click "Install provider"
  ↓
Done! ✅
```

---

## ✅ Verify

**Vào Identity settings, check:**

```
✅ Identity: Enabled
✅ Registration: Invite only  
✅ Git Gateway: Enabled
✅ External providers: GitHub
```

**Tất cả có ✅ → Success!** 🎉

---

## 🧪 Test

1. Visit: `https://your-site.workers.dev/admin/`
2. Click "Login with GitHub"
3. Authorize
4. See blog posts! ✅

---

## 📚 Chi tiết

Xem: [NETLIFY-IDENTITY-SETUP.md](./NETLIFY-IDENTITY-SETUP.md)

---

**Total time: ~3 phút** ⚡
