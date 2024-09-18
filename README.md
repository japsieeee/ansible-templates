### Instruction for ansible

Please make sure you have initial connection to the slave hosts so you can get in and out easily

# Chronological order of running the template
0. Make sure you can connect to the hosts you will be using (ssh root@ip) and make sure your fingerprint is save to the host.

1. init-provision.yml
2. nodejs-provision.yml
3. nginx-provision.yml (Optional if the server require nginx)
4. redis-provision.yml
5. pm2-provision.yml (Go to PM2 section)
6. msql-provision.yml
7. update-sql-file.yml (make sure you have main.sql and log.sql file inside mysql folder)

# PM2
if you want to run this create new file under pm2/ecosystem.config.js and paste this

please customize it however you like

```
module.exports = {
  apps: [
    {
      name: "main-server",
      script: "npm",
      args: "run build:serve-2",
      cwd: "./main-server/", // Set the current working directory
      instances: 1,
      exec_mode: "fork", // Use 'fork' mode for a single instance
      autorestart: true,
      watch: false,
      output: "/data/my-app_log/main-server.log", // Adjust the log file paths if necessary
      error: "/data/my-app_log/main-server-error.log", // Adjust the log file paths if necessary
    },
    {
      name: "main-server-67",
      script: "npm",
      args: "run build:serve-67",
      cwd: "./main-server-67/", // Set the current working directory
      instances: 1,
      exec_mode: "fork", // Use 'fork' mode for a single instance
      autorestart: true,
      watch: false,
      output: "/data/my-app_log/main-server-67.log", // Adjust the log file paths if necessary
      error: "/data/my-app_log/main-server-67-error.log", // Adjust the log file paths if necessary
    },
    {
      name: "minigame-server",
      script: "npm",
      args: "run serve-dev",
      cwd: "./mini-game/", // Set the current working directory
      instances: 1,
      exec_mode: "fork", // Use 'fork' mode for a single instance
      autorestart: true,
      watch: false,
      output: "/data/my-app_log/minigame-server.log", // Adjust the log file paths if necessary
      error: "/data/my-app_log/minigame-server-error.log", // Adjust the log file paths if necessary
    },
    {
      name: "minigame-receiver",
      script: "npm",
      args: "run serve-dev",
      cwd: "./minigame-receiver/", // Set the current working directory
      instances: 1,
      exec_mode: "fork", // Use 'fork' mode for a single instance
      autorestart: true,
      watch: false,
      output: "/data/my-app_log/minigame-receiver.log", // Adjust the log file paths if necessary
      error: "/data/my-app_log/minigame-receiver-error.log", // Adjust the log file paths if necessary
    },
    {
      name: "prematch-queue-server",
      script: "node app",
      //   args: "node app",
      cwd: "./rmq-prematch-queue-server/", // Set the current working directory
      instances: 1,
      exec_mode: "fork", // Use 'fork' mode for a single instance
      autorestart: true,
      watch: false,
      output: "/data/my-app_log/rmq-prematch-queue-server.log", // Adjust the log file paths if necessary
      error: "/data/my-app_log/rmq-prematch-queue-server-error.log", // Adjust the log file paths if necessary
    },
    {
      name: "inplay-queue-server",
      script: "node app",
      //   args: "node app",
      cwd: "./rmq-inplay-queue-server/", // Set the current working directory
      instances: 1,
      exec_mode: "fork", // Use 'fork' mode for a single instance
      autorestart: true,
      watch: false,
      output: "/data/my-app_log/rmq-inplay-queue-server.log", // Adjust the log file paths if necessary
      error: "/data/my-app_log/rmq-inplay-queue-server-error.log", // Adjust the log file paths if necessary
    },
    {
      name: "prematch-dividend-server",
      script: "npm",
      args: "run serve-dev",
      cwd: "./prematch-dividend-server/", // Set the current working directory
      instances: 1,
      exec_mode: "fork", // Use 'fork' mode for a single instance
      autorestart: true,
      watch: false,
      output: "/data/my-app_log/prematch-dividend-server.log", // Adjust the log file paths if necessary
      error: "/data/my-app_log/prematch-dividend-server-error.log", // Adjust the log file paths if necessary
    },
    {
      name: "inplay-dividend-server",
      script: "npm",
      args: "run serve-dev",
      cwd: "./inplay-dividend-server/", // Set the current working directory
      instances: 1,
      exec_mode: "fork", // Use 'fork' mode for a single instance
      autorestart: true,
      watch: false,
      output: "/data/my-app_log/inplay-dividend-server.log", // Adjust the log file paths if necessary
      error: "/data/my-app_log/inplay-dividend-server-error.log", // Adjust the log file paths if necessary
    },
    {
      name: "admin-server",
      script: "npm",
      args: "run serve-dev",
      cwd: "./admin-server/", // Set the current working directory
      instances: 1,
      exec_mode: "fork", // Use 'fork' mode for a single instance
      autorestart: true,
      watch: false,
      output: "/data/my-app_log/admin-server.log", // Adjust the log file paths if necessary
      error: "/data/my-app_log/admin-server-error.log", // Adjust the log file paths if necessary
    },
  ],
};

```