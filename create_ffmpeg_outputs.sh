OUTPUT_CLIP="outputs/ffmpeg_h264_nosound.mp4"
echo "Creating $OUTPUT_CLIP"
ffmpeg -y -framerate 25 -start_number 0 -i images/frame_%04d.jpg -f mp4 -c:v libx264 -pix_fmt yuv420p -vb 1M -t 2.40 $OUTPUT_CLIP >/dev/null 2>&1

echo "$OUTPUT_CLIP duration (expected 2.40s)"
ffprobe $OUTPUT_CLIP 2>&1 | grep "Duration:"

echo ""

OUTPUT_CLIP="outputs/ffmpeg_h264_aac.mp4"
echo "Creating $OUTPUT_CLIP"
ffmpeg -y -framerate 25 -start_number 0 -i images/frame_%04d.jpg -i sounds/cc0_24s.wav -f mp4 -c:v libx264 -pix_fmt yuv420p -vb 1M -c:a aac -t 2.40 $OUTPUT_CLIP >/dev/null 2>&1

echo "$OUTPUT_CLIP duration (expected 2.40s)"
ffprobe $OUTPUT_CLIP 2>&1 | grep "Duration:"

echo ""

OUTPUT_CLIP="outputs/ffmpeg_vp8_vorbis.webm"
echo "Creating $OUTPUT_CLIP"
ffmpeg -y -framerate 25 -start_number 0 -i images/frame_%04d.jpg -i sounds/cc0_24s.wav -f webm -c:v vp8 -pix_fmt yuv420p -vb 1M -c:a libvorbis -t 2.40 $OUTPUT_CLIP >/dev/null 2>&1

echo "$OUTPUT_CLIP duration (expected 2.40s)"
ffprobe $OUTPUT_CLIP 2>&1 | grep "Duration:"

echo ""
