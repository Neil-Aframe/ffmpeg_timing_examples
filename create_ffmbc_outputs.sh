OUTPUT_CLIP="outputs/ffmbc_h264_aac.mp4"
echo "Creating $OUTPUT_CLIP"
ffmbc -y -framerate 25 -i images/frame_%04d.jpg -i sounds/cc0_24s.wav -f mp4 -vcodec libx264 -pix_fmt yuv420p -vb 1M -acodec libfaac -t 2.40 $OUTPUT_CLIP  >/dev/null 2>&1

echo "$OUTPUT_CLIP duration (expected 2.40s)"
ffprobe $OUTPUT_CLIP 2>&1 | grep "Duration:"

echo ""

OUTPUT_CLIP="outputs/ffmbc_mpeg4_aac.mov"
echo "Creating $OUTPUT_CLIP"
ffmbc -y -framerate 25 -i images/frame_%04d.jpg -i sounds/cc0_24s.wav -f mov -vcodec mpeg4 -pix_fmt yuv420p -vb 5M -acodec libfaac -t 2.40 $OUTPUT_CLIP  >/dev/null 2>&1

echo "$OUTPUT_CLIP duration (expected 2.40s)"
ffprobe $OUTPUT_CLIP 2>&1 | grep "Duration:"

echo ""

# This requires that ffmpeg_flower_h264_aac.mp4 has already been created . . .
OUTPUT_CLIP="outputs/ffmbc_from_ffmpeg.mp4"
echo "Creating $OUTPUT_CLIP"
ffmbc -y -i outputs/ffmpeg_flower_h264_aac.mp4 -f mp4 -vcodec libx264 -pix_fmt yuv420p -vb 1M -acodec libfaac $OUTPUT_CLIP  >/dev/null 2>&1

echo "$OUTPUT_CLIP duration (expected 0.53s)"
ffprobe $OUTPUT_CLIP 2>&1 | grep "Duration:"

echo ""