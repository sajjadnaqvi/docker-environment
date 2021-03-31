## OpenDock Template

The empty structure contains necessary folder and files to start building site based on project [opendocks/o-dock](https://github.com/opendocks/o-dock).

### How to use for project
* Clone this repository using command based on [opendocks/o-template](https://github.com/opendocks/o-template)
```bash
git clone git@github.com:larabeans/o-template.git
```

* Go to code directory using command
```bash
cd code
```

- Clone [larabeans/larabeans](https://github.com/larabeans/larabeans) project within `code` directory using command
```bash
git clone git@github.com:larabeans/larabeans.git
```

* Rename `larabeans` directory resulted from above command to `api` using below command
```bash
mv larabeans api
```

* Create directory `mysql` within data directory

* Run host.bat file to add entries to windows host file

* It is assumes you already setup proxy server, if not go to [opendocks/o-proxy](https://github.com/opendocks/o-proxy), and check setup process.

* run `docker-compose up`, it will build images and will take time on first run 

### Useful Commands

Docker compose useful commands
   
To build/start all services
```bash
docker-compose up
```
  
To build/start first time
```bash
docker-compose up apache php-fpm mysql
```

To build/rebuild explicitly
```bash
docker-compose up --build apache 
```

Close all running Containers
```bash
docker-compose stop
```

To stop single container do:
```bash
docker-compose stop {container-name}
```

To stop and remove all containers:
```bash
docker-compose down
```

To stop and remove single containers:
```bash
docker-compose down {container-name}
```

To enter container terminal window
```bash
docker exec -it {container-name} bash
```


### Workspace Commands
To Update all NPM packages in package.jon, (if npm-check-update is installed)
```bash
ncu -u
```
