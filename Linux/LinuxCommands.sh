#!/bin/bash

# =============================================
# BASIC COMMANDS
# =============================================
echo "Hello"                            # Print text to terminal
echo "Hello, World!"                    # Print message to terminal
clear                                   # Clear terminal screen
exit                                    # Exit terminal session
logout                                  # Alternative exit method
pwd                                     # Print current directory path

# =============================================
# FILE/DIRECTORY OPERATIONS
# =============================================
ls                                      # List directory contents
ls -l                                   # Detailed list view
ls -a                                   # Show hidden files
cd Documents                            # Change to Documents directory
cd                                      # Return to home directory
cd ..                                   # Move to parent directory
cat example.txt                         # Display file contents
mkdir myfolder                          # Create new directory
mkdir -p parent/child                   # Create nested directories
rmdir myfolder                          # Remove empty directory
rmdir -p parent/child                   # Remove empty nested directories
rm -rf myfolder                         # Force delete directory+contents
nano file.sh                            # Edit file with nano
vi file.sh                              # Edit file with vi
cp linux.sh file.txt                    # Copy file to new file
cp linux.sh file.txt dir                # Copy files to directory
mv dir dirRenamed                       # Rename directory
mv file.txt dir1                        # Move file to directory

# =============================================
# ARCHIVE/COMPRESSION
# =============================================
tar -cvf archive.tar file1 file2        # Create tar archive -c Create a new archive.

                                                            # -v  Verbose (shows progress).

                                                            # -f  Specify the filename of the archive.
tar -xvf archive.tar                    # Extract tar archive
                                                            # -x  Extract files.

                                                            # -v  Show progress.

                                                            # -f  Specify the archive file.
tar -czvf archive.tar.gz dir/           # Create compressed tar.gz
                                                            #-z  compresses using gzip files.
gzip file.txt                           # Compress to file.txt.gz
gunzip file.txt.gz                      # Decompress .gz file

# =============================================
# DISK MANAGEMENT
# =============================================
df -h                                   # Show disk space (human-readable)
du -sh dir/                             # Show directory size summary

# =============================================
# I/O REDIRECTION
# =============================================
ls -l > output.txt                    # Overwrite output to file
ls dir/file1 >> output.txt                   # Append output to file
command 2> error.log                    # Redirect errors to file
command &> all.log                      # Redirect stdout and stderr
ls | head -n 5                     # Pipe output between commands shows only the top 5 items from ls

# =============================================
# TEXT PROCESSING
# =============================================
diff file1 file2                        # Compare two files
grep 'pattern' file.txt                 # Search for pattern in file
cat file.txt | sort | uniq              # Sort and remove duplicates

# =============================================
# PROCESSES & ENVIRONMENT
# =============================================
ps aux                                  # List all running processes
kill -9 PID                             # Force kill process by ID
export VAR=value                        # Set environment variable
env                                     # List all environment variables

# =============================================
# CRON JOBS
# =============================================
crontab -e                              # Edit cron jobs
# * * * * * /path/to/command            # Cron schedule format:
# | | | | | 
# | | | | +----- Day of week (0-6)
# | | | +------- Month (1-12)
# | | +--------- Day of month (1-31)
# | +----------- Hour (0-23)
# +------------- Minute (0-59)

# =============================================
# PACKAGE MANAGEMENT (Debian/Ubuntu) -get and cache combined
# =============================================
sudo apt update                       # Refresh package lists
sudo apt upgrade                      # Upgrade all installed packages
sudo apt install nginx                # Install a package
sudo apt remove nginx                  # Remove a package
sudo apt purge nginx                   # Remove + delete config files
sudo apt autoremove                   # Remove unused dependencies
sudo apt search nginx                 # Search for packages
curl https://websitelink.com          #Used to search for packages over the network (internet)