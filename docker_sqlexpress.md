Setting up a SQL Server and configuring a .NET application on Manjaro Linux involves a few distinct steps. Manjaro, being an Arch-based distribution, has its own package management and system configuration practices. Here’s a step-by-step guide to get you started:

### 1. **Install SQL Server on Manjaro**

SQL Server is officially supported on Windows and Linux distributions such as Ubuntu. Installing it on Manjaro can be challenging because it's not officially supported. However, you can use Docker to run SQL Server on Manjaro.

#### **Using Docker**

1. **Install Docker:**

   Open a terminal and install Docker using `pacman`:
   ```bash
   sudo pacman -S docker
   ```

2. **Start and Enable Docker:**

   Enable and start the Docker service:
   ```bash
   sudo systemctl start docker
   sudo systemctl enable docker
   ```

3. **Pull the SQL Server Docker Image:**

   Download the SQL Server Docker image from Microsoft:
   ```bash
   sudo docker pull mcr.microsoft.com/mssql/server:2019-latest
   ```

4. **Run the SQL Server Container:**

   Run the container with SQL Server:
   ```bash
   sudo docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=YourPassword123' -p 1433:1433 --name sql_server_container -d mcr.microsoft.com/mssql/server:2019-latest
   ```

   Replace `YourPassword123` with a strong password for the `sa` user.

5. **Verify the Container is Running:**

   Check if the container is running:
   ```bash
   sudo docker ps
   ```

### 2. **Install .NET SDK on Manjaro**

1. **Install .NET SDK:**

   You can install the .NET SDK from the Arch User Repository (AUR) or use the official Microsoft package. To use `yay` (an AUR helper) to install:
   ```bash
   sudo pacman -S yay
   yay -S dotnet-sdk-bin
   ```

2. **Verify Installation:**

   Check the installed version:
   ```bash
   dotnet --version
   ```

### 3. **Set Up Your .NET Application**

1. **Create a New .NET Project:**

   Navigate to the directory where you want to create your project and use the .NET CLI:
   ```bash
   dotnet new mvc -n MyApp
   cd MyApp
   ```

2. **Modify the Connection String:**

   Open `appsettings.json` in a text editor and update the connection string to point to your SQL Server Docker container:

   ```json
   "ConnectionStrings": {
     "DefaultConnection": "Server=localhost,1433;Database=WHMS-LTE-v820240330;User Id=sa;Password=YourPassword123;TrustServerCertificate=True;MultipleActiveResultSets=true"
   }
   ```

   Ensure `YourPassword123` matches the password you used for the SQL Server container.

3. **Run the Application:**

   Build and run your .NET application:
   ```bash
   dotnet build
   dotnet run
   ```

   The application should now be running, and you should be able to access it in your browser at `http://localhost:5000` (or whichever port is specified).

### 4. **Access SQL Server**

You can use tools like SQL Server Management Studio (SSMS) on Windows or Azure Data Studio on Linux to connect to your SQL Server instance. 

#### **Using Azure Data Studio**

1. **Install Azure Data Studio:**

   You can download the `.tar.gz` package from the [official site](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio) and extract it.

   ```bash
   tar -xvf azure-data-studio-linux-x64-*.tar.gz
   sudo mv azuredatastudio-linux-x64 /opt/azuredatastudio
   sudo ln -s /opt/azuredatastudio/bin/code /usr/local/bin/azuredatastudio
   ```

2. **Launch Azure Data Studio:**

   You can now start Azure Data Studio by typing `azuredatastudio` in your terminal.

3. **Connect to SQL Server:**

   Open Azure Data Studio, click on the connection icon, and connect using:
   - **Server**: `localhost`
   - **Port**: `1433`
   - **Authentication Type**: `SQL Login`
   - **User Name**: `sa`
   - **Password**: `YourPassword123`

With these steps, you should have SQL Server running in a Docker container and a .NET application configured to connect to it on Manjaro Linux.