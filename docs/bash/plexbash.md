---
layout: default
title: Plex Bash Explanation
parent: Plex Media Server Bash Script
nav_order: 2
---

# Plex Media Server Installation Script

This guide explains how to use the provided Bash script to install and configure **Plex Media Server** on an Ubuntu/Debian system.

---

## Overview

The script automates the following tasks:

1. Adds the official Plex repository.
2. Imports the Plex GPG signing key.
3. Updates package lists.
4. Installs Plex Media Server.
5. Enables and starts the Plex service.
6. Opens the default Plex port (`32400`) in UFW.
7. Installs optional network tools (`net-tools`).
8. Updates and upgrades system packages.

---

## Requirements

- Ubuntu or Debian-based system
- Sudo privileges
- Internet connection

---

## Instructions

### 1. Download the script

Save the script as `install_plex.sh`:

```bash
nano install_plex.sh
```

### 2. Make the script executable

```bash
chmod +x install_plex.sh
```      

### 3. Run the script

```bash
./install_plex.sh
```

#### What the Script Does

+ Adds Plex repository:

```bash
deb https://downloads.plex.tv/repo/deb public main
```

+Adds the Plex signing key for package verification.

+Updates package lists and installs plexmediaserver.

+Enables Plex to start automatically on system boot.

+Opens the Plex default port (32400) in the firewall.

+Installs net-tools for network commands like ifconfig.

+Updates and upgrades all system packages.