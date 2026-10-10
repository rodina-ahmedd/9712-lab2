# 9712-lab2
Overview: the project is Simple Antivirus Daemon using shell Scripting

antivirusd.sh: Monitors a specified directory for changes, scans files for suspicious extensions and keywords, and moves detected files to quarantine by copying them and deleting the originals.

restore.sh: Allows the user to review quarantined files and choose to restore a file, permanently delete it, or leave it unchanged.

Makefile: Provides targets to run the antivirus daemon and restore tool, and ensures the quarantine directory is created before execution.

Prerequisites: 
git
sudo apt update
sudo apt install -y git make nano

Runing: 
make run: Runs the antivirus script to monitor the specified directory and detect malicious files 
make restore: Runs the restore script, allowing the user to review quarantined files and choose to restore or permanently delete them

Flagged lists:
The file extensions and suspicious keywords are defined inside the is_malicious function in antivirusd.sh.
Flagged extensions: .exe, .bat, .vbs, .scr, .ps1
Suspicious keywords: virus, trojan, malware, worm, ransomware

Bouns:
Prerequisites: The antivirus-cron.sh script must exist in the project directory, and the cron service must be running
Setup:** Run `crontab -e`, choose nano if prompted, and add the required cron entry. Save the file, then run `crontab -l` to verify the entry
Expression:** `31 0 15-21 * 5` schedules the job at 12:31 AM on Friday between the 15th and 21st, which is always the third Friday of the month.
