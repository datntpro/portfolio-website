// @ts-check
import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';
import cloudflare from '@astrojs/cloudflare';
import mdx from '@astrojs/mdx';

// https://astro.build/config
export default defineConfig({
  site: 'https://datngotien.dev',
  output: 'server', // Changed from 'static' to 'server' for Workers
  adapter: cloudflare({
    mode: 'directory', // Use directory mode for Workers
    functionPerRoute: false // Single worker function
  }),
  vite: {
    plugins: [tailwindcss()]
  },
  integrations: [mdx()]
});
