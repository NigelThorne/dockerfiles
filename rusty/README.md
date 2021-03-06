Rusty
===

*A reverse proxy you can configure with curl*

Mostly an educational exercise on how to use lua to __bend__ requests on nginx.

```
sudo docker build -t chanux/rusty .

sudo docker run --name rusty -d chanux/rusty
```

To configure the reverse proxy do the following:

Let api.rusty.dev point to proxy container's IP.
Also you need to set other domain/subdomains in the hosts file

```
$ docker inspect --format '{{ .NetworkSettings.IPAddress }}' proxy
172.17.0.10
$ cat /etc/hosts
127.0.0.127 localhost

172.17.0.10 rusty.dev api.rusty.dev unicorns.rusty.dev
```

To configure unicorns.rusty.dev, pass the appropriate backend's IP as follows

`curl api.rusty.dev/set/unicorns.rusty.dev/172.17.0.3`

You can set the reverse proxy records for other domains the same way.

`curl api.rusty.dev/set/lua.rusty.dev/www.lua.org`

Rusty can store this data on redis. You just have to connect a redis container as 'redis'
when you run Rusty.

`sudo docker run --link redis:redis --name rusty -d chanux/rusty`

To troubleshoot, you can get a terminal to proxy container and check the nginx logs

```
$ docker exec -it proxy bash
$ tail -f /var/log/nginx/error.log
```
