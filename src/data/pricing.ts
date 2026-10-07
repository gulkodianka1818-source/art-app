// "From" prices in GBP, matching the size/complexity questions in the commission form.
// Benchmarked against UK mural rates (≈ £80–£220/m² by complexity, London & South East at the upper end).

export const complexities = [
  { key: 'simple', label: 'Simple', hint: 'Shapes, patterns, ornaments, lettering' },
  { key: 'medium', label: 'Illustrated 2D', hint: 'Characters, animals, trees, rainbows' },
  { key: 'complex', label: 'Detailed / 3D', hint: 'Realistic scenes, trompe-l’œil illusions' },
] as const;

export const sizes = [
  { label: 'Up to 1 m', prices: [200, 300, 400] },
  { label: '1 – 2 m', prices: [300, 400, 550] },
  { label: '2 – 3 m', prices: [400, 600, 800] },
  { label: '3 – 4 m', prices: [550, 800, 1100] },
  { label: '4 m + / whole wall', prices: [700, 1000, 1400] },
];

export const minPrice = sizes[0].prices[0];
export const gbp = (n: number) => `£${n.toLocaleString('en-GB')}`;
