# FOS-Streaming-v1
# Features: 
- Streaming and restreaming (authentication, m3u8)
- Manage users (overview, add, edit, delete, enable, disable)
- Manage categories (overview, add, edit, delete)
- Manage streams(overview, add, edit, delete,start,stop)
- Manage settings(configuration)
- Autorestart(cron.php need to set manual)
- Transcode
- Last ip connected
- h264_mp4toannexb
- play stream
- Playlist import
- Multiple streams on one channel
- Limiet streams on users
- IP Block
- User Agent block
- predefined transcode profiles


### Install software
- wget https://raw.githubusercontent.com/antonioribeiro/iptvpanel/master/install.sh
- sudo bash install.sh

### Install database
- mysql -u root -p
- create database fos_streaming;
- quit;
- cp /usr/src/iptvpanel/.env.example /usr/local/nginx/html/.env
- vi /usr/local/nginx/html/.env ### and configure your data:
- # define all variables
    - DB_NAME="fos_streaming"
    - DB_USER="root"
    - DB_PASSWORD="<root-password>"
    - ADMIN_USERNAME="admin"
    - ADMIN_PASSWORD="<your-password>"
- # open a browser tab with http://ip-of-your-server:8000/install.php?install=fresh

### How can I use it?
- open a browser tab with http://ip-of-your-server:8000
- username: <.env ADMIN_USERNAME>
- password: <.env ADMIN_PASSWORD>
- Add category
- Add user
- Add stream and use defined transcode profile 1 called default 1
- You can use it also in proxy mode, but that depends on how you want to use it.
- The most stable way is using transcode profile: default 1 without proxy mode ticket

### 4. Open stream on user side

### Updater
- Login via SSH on your server
- sudo bash /usr/src/iptvpanel/update.sh

#### Bugs
- Are there bugs?
- You can report it here or on official website

- Bug List:
- Stream (activity, limit connection)
- Stream kill active stream, switch

- Problems with database?
- dpkg-reconfigure mysql-server-5.5# FOS-Streaming

#### Commercial rights
------------------------------------
- You may charge for installation, support and modification.
- You may Any significant modifications must be sent back to the author (me), under Open Source agreement.
- You may not Rename the plugin.
- You may not sell this plugin to anyone.

#### Contribution
------------------------------------
Contribution are always **welcome and recommended**! Here is how:

- Fork the repository ([here is the guide](https://help.github.com/articles/fork-a-repo/)).
- Clone to your machine ```git clone https://github.com/YOUR_USERNAME/FOS-Streaming.git```
- Make your changes
- Create a pull request

##### Contribution Requirements:

- When you contribute, you agree to give a non-exclusive license to Tyfix to use that contribution in any context as we (Tyfix) see appropriate.
- If you use content provided by another party, it must be appropriately licensed using an [open source](http://opensource.org/licenses) license.
- Contributions are only accepted through Github pull requests.

