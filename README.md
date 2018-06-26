# bashrc_env
My Bashrc environment at Xil.

record screen:
sudo apt install simplescreenrecorder

sudo add-apt-repository ppa:kirillshkrogalev/ffmpeg-next &&
&& sudo apt-get update &&
sudo apt-get install youtube-dl ffmpeg lame

ffmpeg -f x11grab -s 1920X1080 -i :0.0 out.mkv
