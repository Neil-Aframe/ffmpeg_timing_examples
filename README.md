# Some ffmpeg timing oddities 

I am sharing these as part of a bug report. I am faced with odd timing issues when transcoding
videos for a web site using ffmpeg, to h264, aac, mp4. 

Typically output videos have a change to duration (all durations were confirmed with ffprobe - other tools may give
more details, including duration per stream, offsets in container etc), which increases by around a half frame
(e.g. 0.02s for a 25fps input). Also when played back in HTML5 player, the videos will seek inaccurately,
usually lagging behind expected display by one frame. It
is the second issue which is more serious to the work I am attempting, but the duration glitch might be a clue as to
what is going on.

It has been hard to reduce this fault to a single issue. These examples capture some of the variation I have seen, and I hope 
they will be useful in tracing a cause.

## Contents

### .sh files

These shell scripts are the commands used to create the video files, and check duration.

### html files

Each file is a small test harness for one of the playable output videos, with a summary of results and a player window with
javascript that attempts to seek to specific frames. The javascript and HTML is identical in each file for the seek code, but
not factored out to shared code at this time.

## ffmpeg version

This version was used to create samples in the repository. I have confirmed similar faults in earlier versions 2.7.2 and 2.1.3

```
ffmpeg version 3.2 Copyright (c) 2000-2016 the FFmpeg developers
  built with Apple LLVM version 7.0.2 (clang-700.1.81)
  configuration: --prefix=/usr/local/Cellar/ffmpeg/3.2 --enable-shared --enable-pthreads --enable-gpl --enable-version3 --enable-hardcoded-tables --enable-avresample --cc=clang --host-cflags= --host-ldflags= --enable-ffplay --enable-libass --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265 --enable-libxvid --enable-opencl --disable-lzma --enable-nonfree --enable-vda
  libavutil      55. 34.100 / 55. 34.100
  libavcodec     57. 64.100 / 57. 64.100
  libavformat    57. 56.100 / 57. 56.100
  libavdevice    57.  1.100 / 57.  1.100
  libavfilter     6. 65.100 /  6. 65.100
  libavresample   3.  1.  0 /  3.  1.  0
  libswscale      4.  2.100 /  4.  2.100
  libswresample   2.  3.100 /  2.  3.100
  libpostproc    54.  1.100 / 54.  1.100
```

## ffmbc version

This version was used to create samples in the repository.

```
FFmbc version 0.7.2
Copyright (c) 2008-2014 Baptiste Coudurier and the FFmpeg developers
```

## LICENSE

(c) Neil Slater, for Excession Technologies Limited

All code may be used under MIT license.

Images and audio used to create test clips are public domain: https://creativecommons.org/publicdomain/zero/1.0/
