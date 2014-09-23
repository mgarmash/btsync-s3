Docker file for btsync instance with ability to store data on Amazon S3 (using s3fs)

docker run -d -p 8888:8888 -p 3369:3369 -e AWSACCESSKEYID=aws_key -e AWSSECRETACCESSKEY=aws_secret -e AWSBUCKET=s3_bucket --privileged -v /opt/btsync:/data mgarmash/btsync-s3
