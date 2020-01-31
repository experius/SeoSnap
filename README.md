![logo](https://github.com/experius/SeoSnap/raw/master/assets/logo.png)

#SeoSnap Beta

Setup for the whole seosnap stack including dashboard, cache server and cache warmer used for prerendering and full
 page caching PWA's.
 
# Installation
* Pull the repo
```
git clone --recursive git@github.com:experius/SeoSnap.git
```
* **IMPORTANT** Update .env file admin username and password. (These have a value default value)
* Start, build and stop the container
```
docker-compose up --build -d && docker-compose down
```
Wait 5 seconds and then build again 
```
docker-compose up --build
```

Everything should run now

# Usage
* Dashboard: http://127.0.0.1:8080/ (default login: snaptron/Sn@ptron1337)
* API Docs: http://127.0.0.1:8080/docs
* PHPMyAdmin: http://127.0.0.1:8081/
* Cache Server: http://127.0.0.1:5000/render/\<your url\>

Logs directory ./logs

Cache directory ./cache

## Run cache warmer
Make sure you have created a website via dashboard http://127.0.0.1:8080/seosnap/website/add/
```
docker-compose run cachewarmer <website id>
```

## Nginx

Check the nginx.conf in the example folder


# How it works

![diagram](https://github.com/experius/SeoSnap/raw/master/assets/diagram.png)

### Dashboard
In the dashboard you add the website url along with the website sitemap that you want to make 'SeoSnaps' off.

### Crawler
When the crawler is started it connects with the dashboard api. It uses scrapy to crawl the sitemap. The scrapy results are send to the administration/dashboard. Scrapy requests are send to the cache server. In a similar way that you would do a request to rendertron. 

### Cache Server
The cache server is a simple file caching server. If a file exist with the content of the page it serves the html from the file. If not, it renders the requested url with rendertron and saves the html output in a file. To refresh the cache the cache-warmer uses PUT requests instead of GET. This will force update from the cache file.

# Build with
![diagram](https://github.com/experius/SeoSnap/raw/master/assets/software.png)