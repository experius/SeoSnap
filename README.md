![logo](https://github.com/experius/SeoSnap/raw/master/assets/logo.png)

Setup for the whole seosnap stack including dashboard, cache server and cache warmer used for prerendering and full
 page caching PWA's.
 
# Installation
* Pull the repo (*note: the pull is recursive*)
```
git clone --recursive git@github.com:experius/SeoSnap.git
```
* **IMPORTANT** Update .env file admin username and password. (These have a value default value)
* Start, build and stop the container
```
docker-compose up --build -d && docker-compose down
```

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
docker-compose run cachewarmer cache <website id>
```

## Usage cache warmer [See](https://github.com/experius/SeoSnap-Cache-Warmer/blob/master/README.md)
### Commands
#### Cache
Handles caching of pages associated to given website
```
Usage: crawl.py cache [OPTIONS] WEBSITE_IDS

Options:
  --follow_next BOOLEAN  Follows rel-next links if enabled
  --recache BOOLEAN      Recached all pages instead of not yet cached ones
  --use_queue BOOLEAN    Cache urls from the queue instead of the sitemap
  --load BOOLEAN         Whether already loaded urls should be scraped instead
  --help                 Show this message and exit.
```

#### Clean
Handles cleaning of the dashboard queue
```
Usage: crawl.py clean [OPTIONS] WEBSITE_IDS

Options:
  --help  Show this message and exit.
```

### Examples
```
# Cache the sitemap of website 1
docker-compose run cachewarmer cache 1

# Cache requests in queue for websites 1 and 2
 dc run cachewarmer cache 1,2 use_queue=true

# Clean the queue for websites 1 and 2
docker-compose run cachewarmer clean 1,2
```
