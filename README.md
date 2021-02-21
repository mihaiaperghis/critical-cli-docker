# critical-cli-docker
Docker wrapper for [Addy Osmani's Critical CSS generator](https://github.com/addyosmani/critical) in CLI mode.

Useful for quickly [extracting critical CSS](https://web.dev/extract-critical-css/) via command line for existing websites without installing node, Chrome/ium or anything else other than Docker.

# Install
[Get docker](https://docs.docker.com/get-docker/) for Linux, Mac, Windows or Windows w/ WSL.

Download image via:
```
docker pull mihaiaperghis/critical-cli
```

# Usage
The image should generally be used with the ```--rm``` flag, as there's no reason to persist containers. It runs ```critical``` by default, so simply use the [CLI parameters](https://github.com/addyosmani/critical/blob/master/cli.js#L21) available in the offical repository.

By default, the output is printed directly to the command line, but it can also be written to a file by appending something like ```> critical.css``` to the docker run command.

# Examples
Generate critical CSS and output it to a css file:
```
docker run --rm mihaiaperghis/critical-cli https://github.com -w 1280 -h 720 > critical.css
```

Generate critical CSS for responsive design pages by using multiple dimensions:
```
docker run --rm mihaiaperghis/critical-cli https://github.com --dimensions 1280x720 --dimensions 360x640 > critical.css
```

Generate critical CSS for responsive design pages while ignoring *@font-face* rules:
```
docker run --rm mihaiaperghis/critical-cli https://github.com --dimensions 1280x720 --dimensions 360x640 --ignore-atrule @font-face > critical.css
```
