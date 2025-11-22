#!/bin/bash

# 🎯 Quick CMS Setup Script
# This script helps you setup GitHub OAuth for Decap CMS

set -e

echo "🎯 Decap CMS - GitHub OAuth Setup"
echo ""
echo "📋 Prerequisites:"
echo "  1. GitHub account"
echo "  2. Netlify account (free tier)"
echo "  3. Repository pushed to GitHub"
echo ""

# Check if repo exists on GitHub
echo "🔍 Checking GitHub repository..."
REPO_URL="https://github.com/datntpro/unified-portfolio"

if curl -s --head "$REPO_URL" | head -n 1 | grep "HTTP/[12].[01] 200" > /dev/null; then
    echo "✅ Repository found: $REPO_URL"
else
    echo "❌ Repository not found: $REPO_URL"
    echo ""
    echo "📝 Please push your code to GitHub first:"
    echo "   git remote add origin https://github.com/datntpro/unified-portfolio.git"
    echo "   git push -u origin main"
    echo ""
    exit 1
fi

echo ""
echo "📝 Next steps:"
echo ""
echo "1️⃣  Create GitHub OAuth App:"
echo "   → https://github.com/settings/developers"
echo "   → New OAuth App"
echo "   → Application name: Unified Portfolio CMS"
echo "   → Homepage URL: http://localhost:4321"
echo "   → Callback URL: https://api.netlify.com/auth/done"
echo ""
echo "2️⃣  Create Netlify site:"
echo "   → https://app.netlify.com/start"
echo "   → Import from GitHub: datntpro/unified-portfolio"
echo "   → Build command: npm run build"
echo "   → Publish directory: dist"
echo ""
echo "3️⃣  Enable Git Gateway:"
echo "   → Site settings → Identity → Enable Identity"
echo "   → Services → Git Gateway → Enable"
echo ""
echo "4️⃣  Add GitHub OAuth to Netlify:"
echo "   → Identity → External providers → GitHub"
echo "   → Paste Client ID and Client Secret"
echo ""
echo "5️⃣  Test CMS:"
echo "   → Visit: http://localhost:4321/admin/"
echo "   → Login with GitHub"
echo "   → Manage your blog posts!"
echo ""
echo "📚 Detailed guide: GITHUB-OAUTH-SETUP.md"
echo ""
