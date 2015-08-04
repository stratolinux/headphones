# docker sabnzbd
This is a Dockerfile to set up "Headphones" 
Build from docker file
```
git clone git@github.com:tssgery/strato-headphones.git
cd strato-hedphones
docker build -t headphones .
```
docker run -d -v /*your_config_location*:/config -v /*your_music_location*:/music -p 8181:8181 headphones
