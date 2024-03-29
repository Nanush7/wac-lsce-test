# wac-lsce-test
WCA Lime Survey Community Edition Test repository.

## Run the container

First, you have to clone this repo and `cd` to it.

There are two options to run this container:
 - Docker.
 - Podman (recommended).

### Podman

Podman fully integrates with docker images, dockerfiles, etc. It is easier to install, runs rootless by default, and it doesn't require a daemon to work.

1. Install podman following the steps [here](https://podman.io/getting-started/installation#linux-distributions) (may need a system reboot). Installing [Podman Desktop](https://podman-desktop.io/) is optional.
2. `cd` to the repo.
3. **Optional:** Create a venv environment. `$ python3 -m venv venv` and `$ source venv/bin/activate`.
4. Install podman-compose: `$ pip3 install podman-compose`.
5. Run the composer: `$ podman-compose up`.

WARNING: The previous step generates a veeeeery verbose output. It is recommended to look at something else if you don't like to see a lot of random stuff flooding your terminal. The nerd reading this is advised to take this opportunity to go outside and breathe some fresh air.

6. After a few minutes, you should be able to access `http://localhost:8080` using a web browser. Read "First Run".
7. Once you are done, you can use `$ podman stop {container_id}`. The container ID can be listed executing `$ podman ps -a`.
8. Next time you want to run the container, you can use `$ podman start {container_id}`.

### Docker

1. Install Docker Desktop following the steps [here](https://docs.docker.com/desktop/) (may need a system reboot).
2. `cd` to the repo.
3. Run the composer: `$ docker compose up`.

WARNING: The previous step generates a veeeeery verbose output. It is recommended to look at something else if you don't like to see a lot of random stuff flooding your terminal. The nerd reading this is advised to take this opportunity to go outside and breathe some fresh air.

4. After a few minutes, you should be able to access `http://localhost:8080` using a web browser. Read "First Run".
5. Once you are done, you can use `$ docker stop {container_id}`. The container ID can be listed executing `$ docker ps -a`.
6. Next time you want to run the container, you can use `$ docker start {container_id}`.

## First Run

Once you have successfully connected to `localhost:8080`, you will be welcomed with the following screen:

![Captura de pantalla 2023-04-30 a la(s) 00 54 26](https://user-images.githubusercontent.com/59543882/235335104-7148dc9f-25e4-4055-9511-60b637803958.png)

Go ahead and start installation.

![Captura de pantalla 2023-04-30 a la(s) 00 56 05](https://user-images.githubusercontent.com/59543882/235335110-6c4fb5b0-20c2-4b6b-85ee-63cc501adb58.png)

![Captura de pantalla 2023-04-30 a la(s) 00 59 48](https://user-images.githubusercontent.com/59543882/235335113-840e07df-b198-4350-8d3a-2f9d12d8f7b3.png)
