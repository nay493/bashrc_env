# bashrc_env
My Bashrc environment at Xil.

record screen:
sudo apt install simplescreenrecorder

sudo add-apt-repository ppa:kirillshkrogalev/ffmpeg-next &&
&& sudo apt-get update &&
sudo apt-get install youtube-dl ffmpeg lame
Record screen:
  ffmpeg -f x11grab -s 1920X1080 -i :0.0 out.mkv

Record from webcam
  ffmpeg -i /dev/video0 out.mkv (-y overwrites) 

Record audio 
  ffmpeg -f x11grab -s 1920X1080  -f alsa -i default out.mkv
  
  https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA/playlists
  
  cat *.jpg | ffmpeg -framerate 0.25 -f image2pipe -i - output.mkv

Or, add a music track as well:

cat *.jpg | ffmpeg -framerate 0.25 -f image2pipe -i SONG.mp3 -acodec copy -output.mkv 

https://www.youtube.com/watch?v=j1I63wGcvU4

alias cores="grep -c ^processor /proc/cpuinfo"

command line - Whatsapp:
http://zillionthoughts.com/whatsapp-command-line-tool-linux-developer-version/

https://www.unixmen.com/list-10-funny-linux-commands/

https://fossbytes.com/a-z-list-linux-command-line-reference/

https://www.howtogeek.com/108890/how-to-get-help-with-a-command-from-the-linux-terminal-8-tricks-for-beginners-pros-alike/


https://www.ostechnix.com/automatically-wake-linux-system-sleep-hibernation-mode/
