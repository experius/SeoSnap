![logo](https://github.com/experius/SeoSnap/raw/master/assets/logo.png)

Setup for the whole seosnap stack including dashboard, cache server and cache warmer used for prerendering and full
 page caching PWA's.
 
# Installation
## For usage
* Download and Extract release.zip from
  * [Releases](https://github.com/experius/SeoSnap/releases)
  * [Development Build](https://github.com/experius/SeoSnap/releases/tag/latest)
* Run `./install.sh` or create a .env file manually
* Start the Seosnap stack with `docker-compose up`

## For development
```
# Clone
git clone --recursive git@github.com:experius/SeoSnap.git
# Configure
make install
# Start server
make up
```

# Usage
* Dashboard: http://127.0.0.1:8080/ (default login: snaptron/Sn@ptron1337)
* API Docs: http://127.0.0.1:8080/docs
* Rendertron Server: http://127.0.0.1:3000/render/\<your url\>

Logs directory ./logs

Cache directory ./cache

## Run cache warmer
Make sure you have created a website via dashboard http://127.0.0.1:8080/seosnap/website/add/
```
make cachewarmer 
make warm A="cache <website id>"
```

## Nginx

Check the nginx.conf in the example folder


# How it works

![diagram](https://github.com/experius/SeoSnap/raw/master/assets/diagram.png)

### [Dashboard](https://github.com/experius/SeoSnap-Dashboard)
In the dashboard you add the website url along with the website sitemap that you want to make 'SeoSnaps' off.

### [Crawler / Cache Warmer](https://github.com/experius/SeoSnap-Cache-Warmer)
When the crawler is started it connects with the dashboard api. It uses scrapy to crawl the sitemap. The scrapy results are send to the administration/dashboard. Scrapy requests are send to the cache server. In a similar way that you would do a request to rendertron. 

### DEPRECATED - [Cache Server](https://github.com/experius/SeoSnap-Cache-Server)
The cache server is a simple file caching server. If a file exist with the content of the page it serves the html from the file. If not, it renders the requested url with rendertron and saves the html output in a file. To refresh the cache the cache-warmer uses PUT requests instead of GET. This will force update from the cache file.

### [Rendertron Server](https://github.com/experius/rendertron/tree/docker)
Rendertron + Cache is added and will replace the SeoSnap Cache Server

Example config file for rendertron:

```json
{
  "restrictedUrlPattern": "((.*(\\.png|\\.jpg|\\.jpeg|\\.gif|\\.webp|\\.mp4)($|\\?))|googleapis\\.com|gstatic\\.com|bat\\.bing\\.com|klarnacdn\\.net|www\\.google\\.com|datatricks\\.com|googletagmanager\\.com)",
  "closeBrowser": false,
  "cache": "filesystem",
  "timeout": 60000,
  "cacheConfig": {
    "cacheDurationMinutes": 10080,
    "cacheMaxEntries": -1,
    "snapshotDir": "/app/cache"
  },
  "width": 1280,
  "height": 1200,
  "widthMobile": 375,
  "widthMobile": 375,
  "puppeteerArgs": [
    "--user-data-dir=/app/cache/myUserDataDir",
    "--autoplay-policy=user-gesture-required",
    "--disable-background-networking",
    "--disable-breakpad",
    "--disable-component-update",
    "--disable-default-apps",
    "--disable-domain-reliability",
    "--disable-notifications",
    "--disable-offer-store-unmasked-wallet-cards",
    "--disable-prompt-on-repost",
    "--disable-renderer-backgrounding",
    "--metrics-recording-only",
    "--mute-audio",
    "--no-default-browser-check",
    "--no-first-run",
    "--no-pings",
    "--no-sandbox",
    "--no-zygote",
    "--password-store=basic",
    "--use-gl=swiftshader",
    "--use-mock-keychain",
    "--disable-dev-shm-usage"
  ]
}
```

# Built with
![diagram](https://github.com/experius/SeoSnap/raw/master/assets/software.png)