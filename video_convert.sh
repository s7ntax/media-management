#!/bin/bash
# remux mpeg2-ts files to mp4
cd /mnt/2tb_hd/con/
for a in *.ts ; do
	f="${a[@]/%ts/mp4}"
	ffmpeg -i "$a" -acodec copy -vcodec copy "$f"
	sleep 20
done
