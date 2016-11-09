OUTPUT_CLIP="outputs/ffmpeg_h264_aac_from_ffmbc_h264_aac_v1.mp4"
echo "Creating $OUTPUT_CLIP"
ffmpeg -y -i outputs/ffmbc_h264_aac.mp4 -f mp4 -c:v copy -c:a copy $OUTPUT_CLIP >/dev/null 2>&1

echo "$OUTPUT_CLIP duration (expected 2.40s)"
ffprobe $OUTPUT_CLIP 2>&1 | grep "Duration:"

echo ""

OUTPUT_CLIP="outputs/ffmpeg_h264_aac_from_ffmbc_h264_aac_v2.mp4"
echo "Creating $OUTPUT_CLIP"
ffmpeg -y -i outputs/ffmbc_h264_aac.mp4 -f mp4 -c:v h264 -c:a aac -vb 500k $OUTPUT_CLIP >/dev/null 2>&1

echo "$OUTPUT_CLIP duration (expected 2.40s)"
ffprobe $OUTPUT_CLIP 2>&1 | grep "Duration:"

echo ""


OUTPUT_CLIP="outputs/ffmpeg_h264_aac_from_ffmbc_mov.mp4"
echo "Creating $OUTPUT_CLIP"
ffmpeg -y -i outputs/ffmbc_mpeg4_aac.mov -f mp4 -c:v h264 -flags +cgop -bf 2 -c:a aac -vb 500k $OUTPUT_CLIP >/dev/null 2>&1

echo "$OUTPUT_CLIP duration (expected 2.40s)"
ffprobe $OUTPUT_CLIP 2>&1 | grep "Duration:"

echo ""
