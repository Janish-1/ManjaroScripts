To run MongoDB in a Docker container on Manjaro Linux, you'll follow a process similar to setting up any other Docker container. Here’s a step-by-step guide to get MongoDB up and running:

### 1. **Install Docker**

If you haven’t installed Docker yet, follow these steps:

1. **Update Your System:**
   Open a terminal and update your package list:

   ```bash
   sudo pacman -Syu
   ```
2. **Install Docker:**
   Install Docker using `pacman`:

   ```bash
   sudo pacman -S docker
   ```
3. **Start and Enable Docker:**
   Enable and start the Docker service:

   ```bash
   sudo systemctl start docker
   sudo systemctl enable docker
   ```
4. **Verify Docker Installation:**
   Check if Docker is running correctly:

   ```bash
   sudo systemctl status docker
   ```
5. **Add Your User to the Docker Group:**

   ```bash
   sudo usermod -aG docker $USER
   ```

   Log out and log back in, or apply changes immediately with:

   ```bash
   newgrp docker
   ```

### 2. **Pull the MongoDB Docker Image**

1. **Pull the MongoDB Image:**
   Use Docker to pull the latest MongoDB image from Docker Hub:
   ```bash
   docker pull mongo
   ```

### 3. **Run a MongoDB Container**

1. **Start MongoDB Container:**
   Run MongoDB in a Docker container with the following command:

   ```bash
   docker run --name mongodb -d -p 27017:27017 mongo
   ```

   - `--name mongodb` assigns a name to the container.
   - `-d` runs the container in detached mode.
   - `-p 27017:27017` maps the container’s MongoDB port (27017) to the host’s port (27017).
2. **Verify the Container is Running:**
   Check the status of the MongoDB container:

   ```bash
   docker ps
   ```

   You should see the MongoDB container listed with its status as "Up."

### 4. **Connect to MongoDB**

You can connect to MongoDB using the `mongo` shell or a MongoDB client.

#### **Using the MongoDB Shell:**

1. **Install MongoDB Shell:**
   You can install the MongoDB shell on your host machine:

   ```bash
   sudo pacman -S mongodb-tools
   ```
2. **Connect to MongoDB:**
   Connect to your MongoDB container using the `mongo` shell:

   ```bash
   mongo --host localhost --port 27017
   ```

   This connects to the MongoDB instance running on your localhost.

#### **Using a GUI Client:**

You can use a GUI client like MongoDB Compass or any other MongoDB client that supports connections to remote MongoDB instances. Configure the client with:

- **Hostname**: `localhost`
- **Port**: `27017`

### 5. **Persist Data**

By default, data stored in the container will be lost if the container is removed. To persist data, use Docker volumes.

1. **Run MongoDB with a Volume:**
   Create a named volume and mount it to the MongoDB container:

   ```bash
   docker volume create mongodb_data
   docker run --name mongodb -d -p 27017:27017 -v mongodb_data:/data/db mongo
   ```

   This command creates a volume called `mongodb_data` and mounts it to MongoDB’s data directory.

### 6. **Manage MongoDB Container**

Here are some useful Docker commands for managing the MongoDB container:

- **Stop the MongoDB Container:**

  ```bash
  docker stop mongodb
  ```
- **Start the MongoDB Container:**

  ```bash
  docker start mongodb
  ```
- **Remove the MongoDB Container:**

  ```bash
  docker rm mongodb
  ```
- **View Container Logs:**

  ```bash
  docker logs mongodb
  ```

### 7. **Configure MongoDB (Optional)**

You might want to configure MongoDB further, such as setting up authentication. MongoDB’s documentation provides detailed information on configuration options and security practices.

With these steps, you should have MongoDB running in a Docker container on Manjaro Linux, and you can start using it for your development or production needs.
