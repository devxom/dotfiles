# Показать все установленные ключи GPG
rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n'

#Ambient radio
mpv http://pub7.di.fm/di_ambient_aac?1 -user-agent "AudioAddict-di/3.2.0.3240 Android/5.1"

# Convert img to mp4
cat *.jpg | ffmpeg -f image2pipe -r 1 -vcodec mjpeg -i - -vcodec libx264 out.mp4

#iptables for mac
-A INPUT -p tcp --dport 22 -m mac --mac-source 3E:D7:88:A6:66:8E -j ACCEPT
