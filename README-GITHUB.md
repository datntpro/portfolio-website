# 🎯 Unified Portfolio

> Portfolio website của Ngô Tiến Đạt - Security Engineer & Full-stack Developer

[![Deploy to Cloudflare Workers](https://github.com/datntpro/unified-portfolio/actions/workflows/deploy.yml/badge.svg)](https://github.com/datntpro/unified-portfolio/actions/workflows/deploy.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 🌟 Features

- ✅ **Modern Portfolio** - Responsive design với Astro + Tailwind CSS
- ✅ **Blog System** - Markdown-based blog với Decap CMS
- ✅ **Projects Showcase** - Chi tiết các dự án bảo mật
- ✅ **Content Management** - Decap CMS để quản lý blog posts
- ✅ **Cloudflare Workers** - Deploy trên edge network toàn cầu
- ✅ **SEO Optimized** - Meta tags, Open Graph, Twitter Cards
- ✅ **Mobile-First** - Fully responsive design
- ✅ **Fast & Secure** - Cloudflare CDN + HTTPS

## 🚀 Quick Start

### Prerequisites

- Node.js 20+
- npm hoặc pnpm
- Cloudflare account

### Installation

```bash
# Clone repo
git clone https://github.com/datntpro/unified-portfolio.git
cd unified-portfolio

# Install dependencies
npm install

# Start dev server
npm run dev
```

Open http://localhost:4321

### Build

```bash
npm run build
```

### Deploy

```bash
# Deploy to Cloudflare Workers
npm run deploy
```

See [WORKERS-DEPLOY.md](./WORKERS-DEPLOY.md) for detailed instructions.

## 📁 Project Structure

```
unified-portfolio/
├── src/
│   ├── pages/              # Routes
│   │   ├── index.astro     # Homepage
│   │   ├── blog/           # Blog pages
│   │   ├── projects/       # Projects pages
│   │   ├── contact.astro   # Contact page
│   │   └── admin/          # CMS admin
│   ├── content/            # Markdown content
│   │   └── blog/           # Blog posts
│   ├── layouts/            # Page layouts
│   └── styles/             # Global styles
├── public/                 # Static assets
├── dist/                   # Build output
└── wrangler.toml          # Cloudflare Workers config
```

## 🎨 Tech Stack

- **Framework**: [Astro](https://astro.build/) 5.x
- **Styling**: [Tailwind CSS](https://tailwindcss.com/) 4.x
- **CMS**: [Decap CMS](https://decapcms.org/)
- **Deployment**: [Cloudflare Workers](https://workers.cloudflare.com/)
- **CI/CD**: GitHub Actions

## 📝 Content Management

### Blog Posts

Quản lý blog posts qua Decap CMS tại `/admin/`:

**Setup (One-time):**
1. Create GitHub OAuth App
2. Setup Netlify (free tier) for OAuth handling
3. Enable Git Gateway

See [GITHUB-OAUTH-SETUP.md](./GITHUB-OAUTH-SETUP.md) for detailed instructions.

**Usage:**
1. Visit `/admin/`
2. Login with GitHub
3. Create/Edit blog posts
4. Upload images
5. Publish → Auto commit to GitHub!

### Manual Editing

Blog posts are in `src/content/blog/` as Markdown files:

```markdown
---
title: "Post Title"
description: "Post description"
pubDate: 2024-11-22T00:00:00.000Z
author: "Ngô Tiến Đạt"
tags: ["security", "devsecops"]
---

Content here...
```

## 🌐 Deployment

### Cloudflare Workers

```bash
# First time setup
npx wrangler login

# Deploy
npm run deploy
```

### GitHub Actions

Auto-deploy on push to `main`:

1. Add secrets to GitHub:
   - `CLOUDFLARE_API_TOKEN`
   - `CLOUDFLARE_ACCOUNT_ID`
2. Push to main branch
3. GitHub Actions will build and deploy

See [WORKERS-DEPLOY.md](./WORKERS-DEPLOY.md) for details.

## 🔧 Configuration

### Site URL

Edit `astro.config.mjs`:

```js
export default defineConfig({
  site: 'https://datngotien.dev',
  // ...
});
```

### Custom Domain

Edit `wrangler.toml`:

```toml
routes = [
  { pattern = "datngotien.dev/*", zone_name = "datngotien.dev" }
]
```

## 📊 Performance

- **Build time**: ~1.5s
- **Bundle size**: ~250KB (gzipped: ~70KB)
- **Lighthouse score**: 95+
- **First Contentful Paint**: <1.5s

## 🔐 Security

- HTTPS by default (Cloudflare)
- CMS authentication required
- No sensitive data in frontend
- Git-based content (audit trail)

## 📚 Documentation

- [Setup Guide](./SETUP-GUIDE.md) - Development setup
- [Workers Deploy](./WORKERS-DEPLOY.md) - Deployment guide
- [Decap CMS Setup](./DECAP-CMS-SETUP.md) - CMS configuration
- [CMS Ready](./CMS-READY.md) - CMS features
- [Checklist](./CHECKLIST.md) - Pre-deploy checklist

## 🤝 Contributing

Contributions welcome! Please:

1. Fork the repo
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📄 License

MIT License - see [LICENSE](./LICENSE) file

## 👤 Author

**Ngô Tiến Đạt**

- Website: [datngotien.dev](https://datngotien.dev)
- Email: hi@datnt.work
- GitHub: [@datntpro](https://github.com/datntpro)
- LinkedIn: [datngotien](https://linkedin.com/in/datngotien)
- X: [@datngotien](https://x.com/datngotien)

## 🙏 Acknowledgments

- [Astro](https://astro.build/) - Amazing web framework
- [Cloudflare](https://cloudflare.com/) - Edge computing platform
- [Decap CMS](https://decapcms.org/) - Git-based CMS
- [Tailwind CSS](https://tailwindcss.com/) - Utility-first CSS

## 📈 Roadmap

- [ ] Multi-language support (EN/VI)
- [ ] Newsletter subscription
- [ ] Comments system (Giscus)
- [ ] Analytics (Plausible)
- [ ] RSS feed
- [ ] Search functionality
- [ ] Dark/Light theme toggle

## ⭐ Show your support

Give a ⭐️ if this project helped you!

---

Made with ❤️ by [Ngô Tiến Đạt](https://github.com/datntpro)
