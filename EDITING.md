# Як Діані змінювати сайт і анкету самій

Нічого встановлювати не треба — усе редагується в браузері. Після збереження сайт оновлюється сам за 1–2 хвилини.

## Анкета (Google Form)

Відкрий **редактор** форми (не саму форму!), будучи залогіненою в gulkodianka1818@gmail.com:
https://docs.google.com/forms/d/1IzZApSpAJB3VppDuF85I5tIGq6Rvx-lx42NGi7tYKoY/edit

Клікни на питання — і міняй текст, варіанти, ціни. Зберігається автоматично.

## Сайт (GitHub)

1. Зайди на github.com під акаунтом `gulkodianka1818-source`.
2. Відкрий потрібне посилання нижче — одразу відкриється редактор файлу.
3. Зміни текст/цифри, натисни зелену кнопку **Commit changes…** → ще раз **Commit changes**.
4. Через 1–2 хвилини зміни будуть на https://gulkodianka1818-source.github.io/art-app/

| Що змінити | Посилання |
| --- | --- |
| **Ціни** (таблиця на сайті) | https://github.com/gulkodianka1818-source/art-app/edit/main/src/data/pricing.ts |
| Питання й відповіді (FAQ) | https://github.com/gulkodianka1818-source/art-app/edit/main/src/components/Faq.astro |
| Тексти головної сторінки | https://github.com/gulkodianka1818-source/art-app/edit/main/src/pages/index.astro |
| Назви й підписи робіт | https://github.com/gulkodianka1818-source/art-app/edit/main/src/data/works.ts |
| Instagram, посилання на анкету | https://github.com/gulkodianka1818-source/art-app/edit/main/src/data/site.ts |

### Як міняти ціни

У `pricing.ts` кожен рядок — це розмір, а три числа — ціна «від» для Simple / Illustrated 2D / Detailed-3D:

```ts
{ label: '1 – 2 m', prices: [300, 400, 550] },
//                           Simple 2D   3D
```

Міняй тільки числа (без знака £ і без пробілів).

**Важливо:** якщо змінюєш ціни на сайті — зміни їх і в анкеті (питання про розмір, варіанти «from £…»), щоб клієнти бачили однакові цифри.

### Якщо щось зламалось

Не страшно: на вкладці **Actions** у репозиторії буде червоний хрестик, а сайт лишиться в попередній робочій версії. Можна відкрити файл і повернути як було, або написати Олегу.
