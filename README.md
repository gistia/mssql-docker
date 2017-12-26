## Configure

- Configure your Docker on Mac to use at least 4GB of Memory:

![](https://cl.ly/2B2Z3O3i2f3O/download/Image%202017-12-26%20at%2012.05.48%20PM.png)

- Edit `docker-compose.yml` and set the `SA_PASSWORD` field to a password that will be used on SQL Server.

## Run

```
docker-compose run -d --rm --service-ports mssql
```
