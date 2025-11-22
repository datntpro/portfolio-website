#!/bin/bash

# 🚀 Quick Deploy Script for Cloudflare Workers
# Usage: ./deploy.sh

set -e

echo "🎯 Unified Portfolio - Deploy to Cloudflare Workers"
echo ""

# Check if wrangler is installed
if ! command -v wrangler &> /dev/null; then
    echo "❌ Wrangler not found. Installing..."
    npm install -D wrangler
fi

# Check if logged in
echo "🔐 Checking Cloudflare authentication..."
if ! npx wrangler whoami &> /dev/null; then
    echo "❌ Not logged in to Cloudflare"
    echo "📝 Please run: npx wrangler login"
    exit 1
fi

echo "✅ Authenticated"
echo ""

# Build
echo "🏗️  Building project..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Build failed"
    exit 1
fi

echo "✅ Build successful"
echo ""

# Deploy
echo "🚀 Deploying to Cloudflare Workers..."
npx wrangler deploy

if [ $? -ne 0 ]; then
    echo "❌ Deploy failed"
    exit 1
fi

echo ""
echo "✅ Deploy successful!"
echo ""
echo "🎉 Your portfolio is now live!"
echo ""
echo "📝 Next steps:"
echo "  1. Visit your Workers URL to verify"
echo "  2. Setup Decap CMS authentication"
echo "  3. Configure custom domain (optional)"
echo ""
echo "📚 Documentation:"
echo "  - WORKERS-DEPLOY.md - Deployment guide"
echo "  - DECAP-CMS-SETUP.md - CMS setup"
echo ""
