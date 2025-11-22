#!/bin/bash

echo "🚀 Merging projects into unified-portfolio..."

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 1. Copy Layout
echo -e "${BLUE}📁 Copying Layout...${NC}"
cp ../portfolio-website/src/layouts/Layout.astro src/layouts/

# 2. Copy Homepage
echo -e "${BLUE}📁 Copying Homepage...${NC}"
cp ../portfolio-website/src/pages/index.astro src/pages/

# 3. Copy Contact
echo -e "${BLUE}📁 Copying Contact...${NC}"
cp ../portfolio-website/src/pages/contact.astro src/pages/

# 4. Copy Blog
echo -e "${BLUE}📁 Copying Blog...${NC}"
mkdir -p src/pages/blog
cp ../portfolio-website/src/pages/blog/index.astro src/pages/blog/
cp ../portfolio-website/src/pages/blog/\[...slug\].astro src/pages/blog/

# 5. Copy Blog Content
echo -e "${BLUE}📁 Copying Blog Content...${NC}"
mkdir -p src/content/blog
cp ../portfolio-website/src/content/config.ts src/content/ 2>/dev/null || true
cp -r ../portfolio-website/src/content/blog/* src/content/blog/ 2>/dev/null || true

# 6. Create Projects Listing
echo -e "${BLUE}📁 Creating Projects Listing...${NC}"
mkdir -p src/pages/projects

# 7. Copy Security Scanner Detail
echo -e "${BLUE}📁 Copying Security Scanner...${NC}"
mkdir -p src/pages/projects/security-scanner
cp ../scanner-tools-website/source-scanner-website/src/pages/index.astro \
   src/pages/projects/security-scanner/index.astro

# 8. Copy public assets
echo -e "${BLUE}📁 Copying Public Assets...${NC}"
cp -r ../portfolio-website/public/* public/ 2>/dev/null || true

echo -e "${GREEN}✅ Merge complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Update navigation links in src/layouts/Layout.astro"
echo "2. Create src/pages/projects/index.astro"
echo "3. Run: npm run build"
echo "4. Run: npm run dev to test"

