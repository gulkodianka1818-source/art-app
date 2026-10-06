# Diana Deikun — сайт художниці

Статичний сайт-портфоліо для [@art__diana_deikun](https://www.instagram.com/art__diana_deikun/) (мурали, портрети, картини).
Зроблено на [Astro](https://astro.build): компоненти як у React, але на виході чистий HTML — найкраще для індексації Google.

## Команди

```bash
npm install
npm run dev       # http://localhost:4321
npm run build     # збірка в dist/
npm run preview   # перегляд зібраної версії
```

## Що де лежить

| Файл | Що змінювати |
| --- | --- |
| `src/data/site.ts` | **посилання на Google Form** (`commissionFormUrl`), Instagram, локація, SEO-опис |
| `src/data/works.ts` | список робіт: назви, підписи, alt-тексти, категорії |
| `src/pages/index.astro` | тексти головної сторінки |
| `src/components/Faq.astro` | питання/відповіді (чернетка — варто перевірити з Діаною) |
| `public/media/` | готові WebP/MP4 файли |
| `raw-media/` | оригінали з Instagram (20 останніх постів) + `posts.json` з підписами |
| `scripts/process-media.sh` | конвертація `raw-media/` у `public/media/` |

## Деплой на GitHub Pages

1. Створити репозиторій на GitHub і запушити гілку `main`.
2. **Settings → Pages → Source: GitHub Actions**.
3. Workflow `.github/workflows/deploy.yml` сам збере і задеплоїть сайт на кожен push у `main`.
   Base-шлях (`/назва-репо/`) і домен підставляються автоматично; з власним доменом теж працює.

## Нові роботи

1. Покласти фото/відео в `raw-media/`.
2. Додати рядок `img …` або `vid …` у `scripts/process-media.sh`, запустити `npm run media`.
3. Додати запис у `src/data/works.ts`.
