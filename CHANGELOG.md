## 0.7.3 (2022-04-05)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/0.7.3)



## latest (2022-04-05)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/latest)

*  [FEATURE] Update rendertron to 3.3.2 *(Mr. Lewis)*
*  [BUGFIX] Update the rendertron image to 3.4.0 *(Lewis Voncken)*


## 0.7.2 (2022-02-24)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/0.7.2)

*  [FEATURE][PWAI-353] Change seosnap dashboard reference *(stefan.vanechtelt)*


## 0.7.1 (2021-12-23)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/0.7.1)

*  [FEATURE] Added docker-cleanup.sh in the examples + updated crontab.txt and made the .sh files executable *(Lewis Voncken)*


## 0.7.0 (2021-11-22)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/0.7.0)

*  [FEATURE][PWAI-353] Updated experiusnl/rendertron to 3.3.0 *(Lewis Voncken)*


## 0.6.1 (2021-11-18)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/0.6.1)

*  [BUGFIX] Updated experius/rendertron to 3.2.1 to reduce timeout and allow emptybreadcrumb *(Lewis Voncken)*


## 0.6.0 (2021-11-18)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/0.6.0)

*  [FEATURE] Updated nginx.conf example with mobile switch and new param encoding + varnish example and additional user agents + Accept-Encoding *(Lewis Voncken)*
*  [BUGFIX] Updated CACHEWARMER_CACHE_SERVER_URL config to the rendertron url *(Lewis Voncken)*
*  [FEATURE] Updated rendertron-config.json + added examples for crontab + fix Makefile *(Lewis Voncken)*
*  [FEATURE] Updated the seosnap-cachewarmer & seosnap-dashboard gitsubmodules *(Lewis Voncken)*
*  [FEATURE] Use stable 3.2.0 release of experiusnl/rendertron *(Lewis Voncken)*


## 0.5.1 (2021-07-26)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/0.5.1)

*  [FEATURE] Updated Makefile with split for cachewarmer_full and cachewarmer_queue *(Lewis Voncken)*
*  [FEATURE] Map mariadb with mysql volume for db *(Lewis Voncken)*
*  [FEATURE] updated docker-compose.yml for release with experiusnl/rendertron + 3000 as render/cache url *(Lewis Voncken)*


## 0.5.0 (2021-07-26)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/0.5.0)

*  Proof of concept rendertron cache *(Egor Dmitriev)*
*  Removed cacheserver from docker-compose and as submodule *(Egor Dmitriev)*
*  Added rendertron config. Updated .env file *(Egor Dmitriev)*
*  Added close browser rendertron config to fix some issues regarding the browser cache/file storage *(Egor Dmitriev)*
*  [FEATURE] Updated config.json - compatible with https://github.com/experius/rendertron/commit/bcc356345d6e662289a5c2c9e8b8f81136fd2b35 *(Lewis Voncken)*
*  [FEATURE] Use experiusnl/rendertron docker image *(Lewis Voncken)*
*  [CI] Fixed automatic release script *(Egor Dmitriev)*
*  [CI] Fixed rendetron config paths in release config *(Egor Dmitriev)*
*  [FEATURE] updated rendertron config + README + docker-composer.yml *(Lewis Voncken)*


## 0.4.1 (2021-04-05)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/0.4.1)

*  Fixed docker image path *(Egor Dmitriev)*
*  Fixed unsupported encoding when caching mobile pages *(Egor Dmitriev)*
*  Updated dependency submodules *(Egor Dmitriev)*


## 0.4.0 (2021-02-23)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/0.4.0)

*  [FEATURE][N-1] Added minor fix regarding tag env var *(Egor Dmitriev)*
*  Create release.yml *(Egor Dmitriev)*
*  Update release.yml *(Egor Dmitriev)*
*  [FEATURE][N-1] Trigger github action *(Egor Dmitriev)*
*  [FEATURE][N-1] Trigger github action *(Egor Dmitriev)*
*  [FEATURE][N-1] Updated release script *(Egor Dmitriev)*
*  [FEATURE][N-1] Updated release script *(Egor Dmitriev)*
*  [FEATURE][N-1] Updated release script *(Egor Dmitriev)*
*  Update release.yml *(Egor Dmitriev)*
*  [FEATURE][N-1] Updated release script *(Egor Dmitriev)*
*  Update release.yml *(Egor Dmitriev)*
*  [FEATURE] Added email settings to .env example *(Egor Dmitriev)*
*  [OTHER] Update submodules *(Egor Dmitriev)*
*  [TASK] Updated readme and dependencies *(Egor Dmitriev)*


## v0.3.1b (2021-01-29)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/v0.3.1b)

*  [FEATURE] Added mobile agent checking using regex *(Egor Dmitriev)*
*  [FEATURE][N-1] Added minimal release script *(Egor Dmitriev)*


## 0.3.0 (2020-11-29)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/0.3.0)

*  [FEATURE] Makefile configuration. Added merged docker-compose. Added install script instead of a preconfigured env file *(Egor Dmitriev)*
*  [BUGFIX] Updated cache server to decode incoming urls such that both encoded and decoded urls get the same path in the filesystem. *(Egor Dmitriev)*
*  Updated rendertron to support restricton of image requests *(Egor Dmitriev)*
*  Added a way to restrict image requests *(Egor Dmitriev)*
*  [FEATURE] Changed default .env dashboard port. Updated dependencies *(Egor Dmitriev)*
*  [FEATURE] Added daemon run mode to the makefile *(Egor Dmitriev)*
*  [FEATURE] Prepared submodules for 0.3.0 release *(Egor Dmitriev)*


## 0.2.0 (2020-02-25)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/0.2.0)

*  [FEATURE] Updated seosnap dependencies *(Egor Dmitriev)*
*  [TASK] Updated firewall example to unblock docker. [TASK] Added pull command to update script *(Egor Dmitriev)*
*  [TASK] Split admin and model modules [BUGFIX] Fixed use of root domain for link generation *(Egor Dmitriev)*
*  [FEATURE] Added queue creation and the view / update api *(Egor Dmitriev)*
*  [FEATURE] Added queue admin interface *(Egor Dmitriev)*
*  [FEATURE] Added queue cleaning *(Egor Dmitriev)*
*  [FEATURE] Added click cli. Added site loading. *(Egor Dmitriev)*
*  [FEATURE] Updated dependencies and the readme for release 0.2.0 *(Egor Dmitriev)*


## 0.1.0 (2020-01-31)

[View Release](git@github.com:experius/SeoSnap.git/commits/tag/0.1.0)

*  Initial commit *(Egor Dmitriev)*
*  Added readme *(Egor Dmitriev)*
*  Added dotenv *(Egor Dmitriev)*
*  README: Default login *(Egor Dmitriev)*
*  [TASK] Updated env. Update deps *(Egor Dmitriev)*
*  [TASK] Updated website based permissions to apply in the overview and api. Added default extra field filling at website creation *(Egor Dmitriev)*
*  [TASK] Removed secret from example .env. Updated submodule paths *(Egor Dmitriev)*
*  [DOCS] Updated readme and added a logo *(Egor Dmitriev)*
*  [BUGFIX] Parameter and env parameter typing *(Egor Dmitriev)*
*  [TASK] Added license *(dheesbeen)*
*  Added license *(Derrick Heesbeen)*
*  Delete LICENSE.txt *(Derrick Heesbeen)*
*  Rename LICENSE to LICENSE.txt *(Derrick Heesbeen)*
*  [TASK] Added nginx.conf example *(dheesbeen)*
*  [DOCS] Added example firewall config *(Egor Dmitriev)*
*  [FEATURE] Added linking to the original page [FEATURE] Added per website cached at status [FEATURE] Added page filters *(Egor Dmitriev)*
*  Updated submodules to their latest commit. *(Egor Dmitriev)*
*  [DOCS] Updated readme with diagram *(dheesbeen)*
*  [DOCS] Updated readme added software logos *(dheesbeen)*
*  [DOCS] Updated readme added software logos *(dheesbeen)*
*  [TASK] Removed phpmyadmin *(Egor Dmitriev)*


