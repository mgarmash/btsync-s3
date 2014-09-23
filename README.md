# btsync-s3

## Description

A Dockerfile for [BitTorrent Sync](http://www.bittorrent.com/sync/). The default login is `admin` and the default password is `password`. These can be changed in `/data/btsync.conf`. Creates an instance with ability to store data on Amazon S3 (using s3fs)

Based on http://stackoverflow.com/questions/24966347/is-s3fs-not-able-to-mount-inside-docker-container and https://github.com/aostanin/dockerfiles

## Example

```
docker run -d -p 8888:8888 -p 3369:3369 -e AWSACCESSKEYID=aws_key -e AWSSECRETACCESSKEY=aws_secret -e AWSBUCKET=s3_bucket --privileged -v /opt/btsync:/data mgarmash/btsync-s3
```

## Volumes

### `/data`

Configuration files and state for BitTorrent Sync.

## Ports

### 3369/udp

Sync protocol UDP port.

### 8888

WebUI port.
