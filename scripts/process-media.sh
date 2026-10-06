#!/usr/bin/env bash
# Converts the raw Instagram downloads in raw-media/ into web-ready files in public/media/.
# Images -> WebP, videos -> muted H.264 MP4 with WebP posters.
# Requires ffmpeg with libx264 + libwebp. Re-run any time raw-media/ changes.
set -euo pipefail

cd "$(dirname "$0")/.."
RAW=raw-media
OUT=public/media
mkdir -p "$OUT/img" "$OUT/video"

ff() { ffmpeg -loglevel error -y "$@"; }

# img <source.jpg> <name> [extra-filter]
img() {
  local filter="scale='min(1400,iw)':-2"
  [[ -n "${3:-}" ]] && filter="$3,$filter"
  ff -i "$RAW/$1" -vf "$filter" -c:v libwebp -quality 80 "$OUT/img/$2.webp"
  echo "img   $2"
}

# frame <source.mp4> <seconds> <name> [extra-filter]
frame() {
  local filter="scale='min(1080,iw)':-2"
  [[ -n "${4:-}" ]] && filter="$4,$filter"
  ff -ss "$2" -i "$RAW/$1" -frames:v 1 -vf "$filter" -c:v libwebp -quality 80 "$OUT/img/$3.webp"
  echo "frame $3"
}

# vid <source.mp4> <name> <start> <duration> [speed] [width]
vid() {
  local speed="${5:-1}" width="${6:-540}"
  ff -ss "$3" -t "$4" -i "$RAW/$1" \
    -vf "setpts=PTS/$speed,scale=$width:-2,fps=30" \
    -c:v libx264 -preset slow -crf 28 -profile:v high -pix_fmt yuv420p \
    -movflags +faststart -an "$OUT/video/$2.mp4"
  # poster = first frame of the clip
  ff -i "$OUT/video/$2.mp4" -frames:v 1 -c:v libwebp -quality 75 "$OUT/video/$2.webp"
  echo "video $2 ($(du -h "$OUT/video/$2.mp4" | cut -f1))"
}

# ---------- Images ----------
img DeFJ_MRM90T_0.jpg savanna-trees-mural
img DeDBVOzstTn_0.jpg portrait-painting
img DdrT6DtMhH9_0.jpg flower-painting-for-sale
img DdHTl3VHLi4_0.jpg hulk-fist-mural
img DT7TeCADJhE_0.jpg fundraiser-exhibition
img Ddmq8TTs8mN_0.jpg alice-window-art
img Dde9NQLMJZJ_0.jpg mother-and-baby-drawing
img DeENuVIsx7c_0.jpg reading-tree-mural "crop=iw:ih*0.5:0:ih*0.5"
img DeH82ubusNP_0.jpg family-tree-mural "crop=iw:ih*0.75:0:ih*0.25"
img Dc_Gnoaskdu_0.jpg rainbow-arch-mural
img Dc4axMdMUE0_0.jpg diana-portrait

# ---------- Stills pulled from videos ----------
frame Dc4f-vhs2h8_0.mp4 36   elephant-nursery-mural
frame Dc4f-vhs2h8_0.mp4 18   elephant-nursery-detail
frame Dc4ZyYEs9BX_0.mp4 0.8  diana-at-work
frame Dc4axMdMUE0_0.mp4 1    diana-with-palette
frame DdkCne0OLC4_0.mp4 7.3  elephant-painting-detail
frame Dc9XkZNuUqx_0.mp4 140  hulk-mural-progress
frame Dc68EE_sDlf_0.mp4 6    wall-preparation

# ---------- Videos (muted) ----------
vid Dc9XkZNuUqx_0.mp4 hero-hulk-timelapse 22 126 5 540
vid Dc4f-vhs2h8_0.mp4 princess-room-reveal 0 40
vid Dc4axMdMUE0_0.mp4 room-transformation 0 60
vid Dc4ZyYEs9BX_0.mp4 elephant-mural-process 0 41
vid Dc68EE_sDlf_0.mp4 wall-preparation 0 48
vid Dc_Gnoaskdu_0.mp4 rainbow-arch-process 0 38
vid DdALvSxMVRu_0.mp4 hulk-bedroom-mural 0 53
vid DdHTl3VHLi4_1.mp4 hulk-fist-loop 0 6
vid DdkCne0OLC4_0.mp4 handmade-takes-time 0 8.1
vid Ddmq8TTs8mN_0.mp4 alice-window-process 0 8.3
vid Dde9NQLMJZJ_0.mp4 graphite-drawing 0 7.5
vid DdihfHdMgvk_0.mp4 portrait-commission 0 16.3
vid DT7TeCADJhE_0.mp4 fundraiser-exhibition 0 20

du -sh "$OUT"
