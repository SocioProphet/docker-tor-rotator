# Rotating Tor Proxy

This project provides an array of Tor daemons that are load balanced
through an HAProxy server. By default, it sets up 20 Tor daemons. It
is forked from an upstream project and updated to more recent versions
of Ubuntu and Tor.

## Build

```
$ git clone https://github.com/teamhg-memex/docker-tor-rotator.git
$ cd docker-tor-rotator
$ docker build -t tor-rotator .
```

## Run

Here's an example of running the container:

```
docker run -d --rm --name TorRotator -p 9100:9100 -p 2090:2090 tor-rotator
```

Test the system by running a few curl commands:

```
$ curl --socks5 127.0.0.1:9100 wtfismyip.com/text
178.17.171.197
$ curl --socks5 127.0.0.1:9100 wtfismyip.com/text
104.244.72.115
$ curl --socks5 127.0.0.1:9100 wtfismyip.com/text
199.249.230.72
```

You can also view the HAProxy status page by going to `http://localhost:2090`.

<a href="https://www.hyperiongray.com/?pk_campaign=github&pk_kwd=docker-tor-rotator"><img alt="define hyperion gray" width="500px" src="https://hyperiongray.s3.amazonaws.com/define-hg.svg"></a>
