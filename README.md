# Bash Scripts to automate tasks:

# 1) backup.sh:

This Bash script automates the backup of a specified directory by creating a compressed archive (.tar.gz). It ensures the script runs with root privileges, verifies the existence of the backup directory, and logs the process. The backup file is timestamped for versioning and stored in the designated backup directory. If successful, it logs a confirmation; otherwise, it logs a failure and exits with an error.

# 2) disk_monitor.sh:

This Bash script monitors disk usage and sends an alert if usage exceeds a defined threshold (default: 80%). It ensures the script runs with root privileges, logs disk usage checks, and extracts the current disk usage percentage. If the usage surpasses the threshold, it logs a warning and sends an email alert to the administrator. Otherwise, it logs that disk usage is within normal limits.

# 3) install_software.sh:

This Bash script automates the installation of essential software packages (curl, wget, git, vim, and htop) on a Debian-based system. It ensures the script runs with root privileges, logs installation progress, and iterates through the list of packages, installing each one using apt. The installation process and any issues encountered are logged for reference.

# 4) memory_monitor.sh:

This Bash script monitors system memory usage and sends an alert if it exceeds a defined threshold (default: 80%). It ensures the script runs with root privileges, logs the memory check, and calculates memory usage as a percentage. If usage surpasses the threshold, it logs a warning and sends an email alert to the administrator. Otherwise, it logs that memory usage is within normal limits.

# 5) monitor_service.sh:

This Bash script monitors the status of the nginx service and restarts it if it is not running. It ensures execution with root privileges, logs the service check, and uses systemctl to determine if the service is active. If the service is down, it attempts to restart it and logs whether the restart was successful or not.

# 6) network_check.sh:

This Bash script checks network connectivity by pinging the local hostname. It ensures execution with root privileges, logs the network check, and attempts to ping the system’s own hostname three times. If the ping is successful, it logs that the network is online; otherwise, it logs that the network is down.

# 7) update_system.sh:

This Bash script automates system updates on a Debian-based system. It ensures execution with root privileges, logs the update process, and runs package updates using apt update and apt upgrade -y. It also removes unnecessary packages with apt autoremove -y and clears the package cache with apt clean. Finally, it logs the successful completion of the update.
