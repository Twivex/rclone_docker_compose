# Setup

1. Install rclone locally
2. If on macOS, install [FUSE for macOS](https://osxfuse.github.io/)
3. Setup `.env` file
4. Create desired config file(s): `rclone config`

    For detailed instructions, see [rclone docs](https://rclone.org/docs/)

    **How to setup own client ID?**

     https://rclone.org/drive/#making-your-own-client-id

5. Copy config file(s) to `mnt/config/`

    **Note:** The config file(s) must be named `{drive_name}.conf`. This is also the name of the directory in `/data` (respectively in `$EXTERNAL_VOLUMES_PATH/cloud`) where the files will be stored.

6. Start service: `docker-compose up -d`