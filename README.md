# docker sabnzbd
This is a Dockerfile to set up "Headphones"
Build from docker file
```
git clone git@github.com:stratolinux/headphones.git
cd headphones
docker build -t headphones .
```
docker run -v /*your_config_location*:/config -v /*your_comics_location*:/music -v /*your_downloads_location*:/downloads -p 8181:8181 headphones
