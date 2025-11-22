export async function GET() {
  const config = `backend:
  name: test-repo
  # For production, change to:
  # name: git-gateway
  # branch: main

media_folder: "public/images/uploads"
public_folder: "/images/uploads"

collections:
  - name: "blog"
    label: "Blog Posts"
    folder: "src/content/blog"
    create: true
    slug: "{{year}}-{{month}}-{{day}}-{{slug}}"
    fields:
      - { label: "Title", name: "title", widget: "string" }
      - { label: "Description", name: "description", widget: "text" }
      - { label: "Publish Date", name: "pubDate", widget: "datetime" }
      - { label: "Author", name: "author", widget: "string", default: "Ngô Tiến Đạt" }
      - { label: "Featured Image", name: "image", widget: "image", required: false }
      - { label: "Tags", name: "tags", widget: "list", default: ["blog"] }
      - { label: "Body", name: "body", widget: "markdown" }
`;

  return new Response(config, {
    status: 200,
    headers: {
      'Content-Type': 'text/yaml; charset=utf-8',
    },
  });
}
