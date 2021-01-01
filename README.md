# Puppeteer Docker
---

## Build
  `make build`

## Test
  `make test`
  
## Debug
   run: 

   ```
   docker run -it \
      --shm-size=2gb \
      --net=host \
      --cap-add SYS_ADMIN \
      puppeteer:dev \
      chromium-browser \
         --incognito \
         --start-in-incognito \
         --user-data-dir='/tmp/user1' \
         --/prefetch:5 \
         --headless \
         --disable-gpu \
         --disable-dev-shm-usage \
         --disable-gpu-vsync \
         --window-size=1600,1200 \
         --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36" \
         --disable-extensions \
         --disable-remote-fonts \
         --disable-remote-playback-api \
         --disable-sync \
         --disable-bundled-ppapi-flash \
         --disable-breakpad \
         --disable-audio-output \
         --disable-features=DnsHttpssvc \
         --no-first-run \
         --no-default-browser-check \
         --start-maximized \
         --start-fullscreen \
         --remote-debugging-address=0.0.0.0 \
         --remote-debugging-port=9222
   ```

  visit: `http://127.0.0.1:9222/json/version`


## Troubleshooting
 + Error writing DevTools active port to file
    - [issues-2576](https://github.com/puppeteer/puppeteer/issues/2576)

# Chrome
---

## get version & details
  `chrome://version`

## runtimes arguments
  `https://peter.sh/experiments/chromium-command-line-switches/`