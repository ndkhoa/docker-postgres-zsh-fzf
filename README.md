Persistent postgres data
----------------------
```
mkdir -p ~/docker/postgres115/data
```

Persistent zsh history
----------------------
```
touch $HOME/.zsh_history_postgres115
```

Create a container
---------------

```
docker run -p 54321:5432 -it -d --name=postgres115 \
           -e POSTGRES_PASSWORD='postgres' \
           -e HISTFILE=/root/.zsh_history \
           -v ~/docker/postgres115/data:/var/lib/postgresql/data \
           -v $HOME/.zsh_history_postgres115:/root/.zsh_history \
           -v $(pwd):/root/postgres115 \
           -w /root/postgres115 postgres:11.5
```

Create a new Bash session
-------------------------
```
docker exec -it postgres115 bash
```

Installation
------------

```
curl -sSL https://raw.githubusercontent.com/ndkhoa/docker-postgres-zsh-fzf/master/zsh-fzf.sh | sh
```

Usage
-----
```
docker exec -it postgres115 zsh

psql postgres postgres
```

Remove a container

```
docker rm postgres115 -f
```
