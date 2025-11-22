# ⚠️ Netlify Clarification

## ❓ Câu hỏi thường gặp

### "Website của tôi sẽ chạy trên Netlify hay Cloudflare?"

**Trả lời:** Website chạy trên **CLOUDFLARE WORKERS** ✅

Netlify **KHÔNG** host website của bạn!

---

## 🎯 Vai trò của từng service:

### Cloudflare Workers (Website hosting)

**Làm gì:**
- ✅ Host toàn bộ website
- ✅ Serve HTML/CSS/JS cho visitors
- ✅ Handle tất cả traffic
- ✅ CMS admin UI tại `/admin/`

**URL visitors truy cập:**
```
https://unified-portfolio.xxx.workers.dev
```

**Đây là website chính của bạn!**

---

### Netlify (OAuth backend only)

**Làm gì:**
- ✅ Handle GitHub OAuth login
- ✅ Manage CMS user sessions
- ✅ Git Gateway (commit to GitHub)

**KHÔNG làm:**
- ❌ Host website
- ❌ Serve content cho visitors
- ❌ Handle website traffic

**URL Netlify:**
```
https://xxx.netlify.app
```

**Visitors KHÔNG truy cập URL này!**

---

## 📊 So sánh trực quan:

```
┌─────────────────────────────────────────────┐
│           CLOUDFLARE WORKERS                │
│                                             │
│  • Website của bạn                          │
│  • Visitors truy cập đây                    │
│  • URL: unified-portfolio.xxx.workers.dev   │
│  • CMS UI: /admin/                          │
│                                             │
│  ┌───────────────────────────────────────┐ │
│  │  Khi admin click "Login with GitHub"  │ │
│  │              ↓                         │ │
│  │     Redirect to Netlify OAuth         │ │
│  │              ↓                         │ │
│  │  ┌─────────────────────────────────┐  │ │
│  │  │      NETLIFY (Background)       │  │ │
│  │  │                                 │  │ │
│  │  │  • Handle OAuth                 │  │ │
│  │  │  • Create session               │  │ │
│  │  │  • Redirect back to CMS         │  │ │
│  │  └─────────────────────────────────┘  │ │
│  │              ↓                         │ │
│  │  Back to Cloudflare Workers CMS       │ │
│  └───────────────────────────────────────┘ │
└─────────────────────────────────────────────┘
```

---

## 🔄 User Journey:

### Visitor xem website:

```
User types: datngotien.dev
    ↓
Cloudflare Workers serve website
    ↓
User sees your portfolio
```

**Netlify không tham gia!**

---

### Admin login CMS:

```
Admin visits: datngotien.dev/admin/
    ↓
Cloudflare Workers serve CMS UI
    ↓
Click "Login with GitHub"
    ↓
Redirect to GitHub OAuth
    ↓
GitHub redirects to Netlify (background)
    ↓
Netlify creates session
    ↓
Redirect back to Cloudflare Workers CMS
    ↓
Admin can edit posts
```

**Netlify chỉ xử lý OAuth, không serve website!**

---

## 💡 Analogy:

### Cloudflare Workers = Cửa hàng của bạn
- Khách hàng đến đây
- Mua sắm ở đây
- Thấy sản phẩm ở đây

### Netlify = Hệ thống thanh toán
- Xử lý payment ở background
- Khách không thấy
- Chỉ khi checkout mới dùng

### GitHub = Kho hàng
- Lưu trữ sản phẩm
- Cập nhật inventory
- Không phải nơi bán hàng

---

## ✅ Kết luận:

### Website của bạn:
- **Host:** Cloudflare Workers ✅
- **URL:** https://unified-portfolio.xxx.workers.dev
- **Visitors truy cập:** Cloudflare Workers
- **CMS:** Cloudflare Workers (`/admin/`)

### Netlify:
- **Vai trò:** OAuth handler (background)
- **Không host website**
- **Không có traffic từ visitors**
- **Free tier đủ dùng**

### Tại sao cần Netlify?

Decap CMS cần một authentication backend. Có 2 options:

1. **Netlify Identity + Git Gateway** (Free, dễ) ← Chọn cái này
2. Self-hosted OAuth server (Phức tạp, tốn tiền)

Netlify cung cấp service này miễn phí, nên mình dùng!

---

## 🎯 Setup đúng:

```bash
# 1. Deploy website lên Cloudflare Workers
npm run deploy
# → https://unified-portfolio.xxx.workers.dev ← Website chính!

# 2. Setup Netlify (chỉ cho OAuth)
# - Import repo vào Netlify
# - Enable Identity + Git Gateway
# - Ignore Netlify site URL (không dùng)

# 3. Done!
# - Website: Cloudflare Workers
# - CMS: Cloudflare Workers
# - OAuth: Netlify (background)
```

---

## 📝 Checklist:

- [ ] Website deploy trên Cloudflare Workers
- [ ] Visitors truy cập Cloudflare Workers URL
- [ ] Netlify chỉ dùng cho OAuth
- [ ] Netlify site URL không dùng
- [ ] CMS admin tại Cloudflare Workers `/admin/`

---

**Hiểu rồi chứ?** 😊

Website = Cloudflare Workers  
OAuth = Netlify (background)  
Content = GitHub

---

**Questions?** Email: hi@datnt.work
