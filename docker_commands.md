Here's a concise summary of essential Docker commands that you'll frequently use for managing Docker containers, images, volumes, and networks:

### **Container Commands**

- **List Running Containers:**

  ```bash
  docker ps
  ```
- **List All Containers (Including Stopped):**

  ```bash
  docker ps -a
  ```
- **Start a Container:**

  ```bash
  docker start <container_id_or_name>
  ```
- **Stop a Running Container:**

  ```bash
  docker stop <container_id_or_name>
  ```
- **Restart a Container:**

  ```bash
  docker restart <container_id_or_name>
  ```
- **Remove a Stopped Container:**

  ```bash
  docker rm <container_id_or_name>
  ```
- **Remove All Stopped Containers:**

  ```bash
  docker container prune
  ```
- **View Container Logs:**

  ```bash
  docker logs <container_id_or_name>
  ```
- **Execute a Command Inside a Running Container:**

  ```bash
  docker exec -it <container_id_or_name> <command>
  ```

  Example for a bash shell:

  ```bash
  docker exec -it <container_id_or_name> /bin/bash
  ```

### **Image Commands**

- **List Docker Images:**

  ```bash
  docker images
  ```
- **Pull an Image from Docker Hub:**

  ```bash
  docker pull <image_name>
  ```
- **Build an Image from a Dockerfile:**

  ```bash
  docker build -t <image_name> <path_to_dockerfile>
  ```
- **Remove an Image:**

  ```bash
  docker rmi <image_id_or_name>
  ```
- **Remove Unused Images:**

  ```bash
  docker image prune
  ```

### **Volume Commands**

- **List Docker Volumes:**

  ```bash
  docker volume ls
  ```
- **Create a New Volume:**

  ```bash
  docker volume create <volume_name>
  ```
- **Remove a Volume:**

  ```bash
  docker volume rm <volume_name>
  ```
- **Remove All Unused Volumes:**

  ```bash
  docker volume prune
  ```

### **Network Commands**

- **List Docker Networks:**

  ```bash
  docker network ls
  ```
- **Create a New Network:**

  ```bash
  docker network create <network_name>
  ```
- **Remove a Network:**

  ```bash
  docker network rm <network_name>
  ```

### **General Commands**

- **View Docker System Information:**

  ```bash
  docker info
  ```
- **Show Docker Version:**

  ```bash
  docker --version
  ```
- **Search for Images on Docker Hub:**

  ```bash
  docker search <keyword>
  ```

### **Examples**

- **Run a Container (e.g., MongoDB):**

  ```bash
  docker run --name my_mongo -d -p 27017:27017 mongo
  ```
- **Start a Container from an Image (e.g., Nginx):**

  ```bash
  docker run --name my_nginx -d -p 80:80 nginx
  ```

These commands should cover most of your Docker needs, from managing containers and images to working with volumes and networks.
