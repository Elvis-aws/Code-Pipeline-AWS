

*******
Command
*******

****************
Create/Run Image
****************
- docker build -t bottle-container .
- docker run --name bottle -dp 127.0.0.1:8080:8080 bottle-container:latest

**********************
View container details
**********************
- docker run [image name] ls
    - docker run busybox ls
    - docker run dockerelvis/flask-demo:latest ls
    - We get the below file contents in our container
        __init__.py
        application.py
        context.py
        createTable.py
        deleteTable.py
        docker.md
        dynamodb_commands.py
        record.log
        requirements.txt
        templates
        variables.env
***********************
Show running containers
***********************
- docker ps
- docker ps --all
****************************
Create and Start a container
****************************
- docker create: Creates the container
- docker start: Starts the created container
    - docker run = docker create + docker start
    ************************
    Docker Create/Start/Stop
    ************************
    - docker create busybox 5931928dea29beb1a79bf909147b3ef4af6357489f70037524dbadb045536eaa
    - docker start 5931928dea29beb1a79bf909147b3ef4af6357489f70037524dbadb045536eaa
    - docker stop 5931928dea29beb1a79bf909147b3ef4af6357489f70037524dbadb045536eaa
*************************
Remove stopped containers
*************************
- This will delete containers plus cache
- Will show you the total amount of disk reclaimed
- docker system prune
    WARNING! This will remove:
      - all stopped containers
      - all networks not used by at least one container
      - all dangling images
      - all dangling build cache

    Are you sure you want to continue? [y/N]
*******************
Stop/Kill container
********************
-Stop: Send SIGTERM message to processors telling them to shut down
       This gives the container a little bit of time to clean up
       - docker stop [container id]
-Kill: Send SIGKILL message to processors telling them to kill the container
       No additional clean-up needed
       - docker kill [container id]
*******************
Show container logs
********************
- Run container
    - docker run dockerelvis/flask-demo:latest
    - docker ps --all
- Show container logs
    - docker logs [container id]
**************************
Log into running container
**************************
# Redis cli
- Run redis container
    - docker run redis
- it allows us to provide input to the running container
    - docker exec -it container-id redis-cli
    - set name Elvis (Stores name)
    - get name (Gets name)
********************
Show container shell
********************
- Log into container in shell mode
- sh exposes shell
- Control d to exit shell
    - docker exec -it container-id sh (windows)
    - docker exec -it container-id bash (mac)
******
Volume
******
        - Make docker stateful by mounting a volume on the container
        - Container/Host machine folder reference
        - All data in the specific directory will be persisted on the host
        - Docker creates the volume on our local host by default
        - Windows location: C\Programdata\docker\volumes
        - Linux/Mac-os location: /var/lib/docker/volumes
        - on mac , docker creates a vm were all the volumes are stored
            - screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty
            - cd /var/lib/docker