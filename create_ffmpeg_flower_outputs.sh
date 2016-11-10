OUTPUT_CLIP="outputs/ffmpeg_flower_h264_aac.mp4"
echo "Creating $OUTPUT_CLIP"
ffmpeg -y -i inputs/flower.mxf -f mp4 -c:v libx264 -pix_fmt yuv420p -vb 1M -c:a aac $OUTPUT_CLIP >/dev/null 2>&1

echo "$OUTPUT_CLIP duration (expected 0.53s)"
ffprobe $OUTPUT_CLIP 2>&1 | grep "Duration:"

echo ""

OUTPUT_CLIP="outputs/ffmpeg_flower_vp8_vorbis.webm"
echo "Creating $OUTPUT_CLIP"
ffmpeg -y  -i inputs/flower.mxf -f webm -c:v vp8 -pix_fmt yuv420p -vb 1M -c:a libvorbis $OUTPUT_CLIP >/dev/null 2>&1

echo "$OUTPUT_CLIP duration (expected 0.53s)"
ffprobe $OUTPUT_CLIP 2>&1 | grep "Duration:"

echo ""
