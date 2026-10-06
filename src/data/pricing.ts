// "From" prices in GBP, matching the size/complexity questions in the commission form.
// Benchmarked against UK mural rates (≈ £80–£220/m² by complexity, London & South East at the upper end).

export const complexities = [
  { key: 'simple', label: 'Simple', hint: 'Shapes, patterns, ornaments, lettering' },
  { key: 'medium', label: 'Illustrated 2D', hint: 'Characters, animals, trees, rainbows' },
  { key: 'complex', label: 'Detailed / 3D', hint: 'Realistic scenes, trompe-l’œil illusions' },
] as const;

export const sizes = [
  { label: 'Up to 1 m', prices: [250, 350, 450] },
  { label: '1 – 2 m', prices: [350, 500, 700] },
  { label: '2 – 3 m', prices: [500, 750, 1000] },
  { label: '3 – 4 m', prices: [700, 1000, 1400] },
  { label: '4 m + / whole wall', prices: [900, 1300, 1800] },
];

export const minPrice = sizes[0].prices[0];
export const gbp = (n: number) => `£${n.toLocaleString('en-GB')}`;
