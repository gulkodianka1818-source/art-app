import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

// SITE_URL / BASE_PATH are injected by the GitHub Pages workflow
// (e.g. https://user.github.io + /repo-name). Locally the site runs from "/".
const site = process.env.SITE_URL || 'https://dianadeikun.github.io';
const base = process.env.BASE_PATH || '/';

export default defineConfig({
  site,
  base,
  trailingSlash: 'always',
  integrations: [sitemap({ filter: (page) => !page.includes('404') })],
  build: {
    inlineStylesheets: 'auto',
  },
});
