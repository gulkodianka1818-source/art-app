export const site = {
  name: 'Diana Deikun',
  role: 'Mural Artist',
  title: 'Diana Deikun — Hand-Painted Murals in London & Kent',
  description:
    'Bespoke hand-painted murals for children’s rooms, nurseries, homes and businesses across London and Kent, plus commissioned portraits and original artwork by Diana Deikun.',
  location: 'London & Kent, UK',
  areas: ['London', 'Kent'],
  instagram: 'https://www.instagram.com/art__diana_deikun/',
  instagramHandle: '@art__diana_deikun',

  // TODO: replace with the real Google Form link once it is created.
  commissionFormUrl: 'https://forms.gle/REPLACE_WITH_GOOGLE_FORM_ID',
};

/** Prefix a public/ path with the configured base (needed for GitHub Pages project sites). */
export function asset(path: string): string {
  const base = import.meta.env.BASE_URL.replace(/\/$/, '');
  return `${base}/${path.replace(/^\//, '')}`;
}
