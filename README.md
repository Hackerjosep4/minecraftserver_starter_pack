# minecraftserver_starter_pack

Scripts and basic files to quickly set up a Minecraft server.

## Description
This repo contains a script (`start.sh`) and a config file (`server-info.json`) to easily configure and run your Minecraft server. It also includes `eula.txt` (which must contain Mojang’s EULA acceptance) and the license in `LICENSE.txt`.

## Requirements
- **Java** (version compatible with the Minecraft server you want to run)
- **jq** (to parse the JSON configuration file)

## Files

### `server-info.json`
Stores your server configuration:
```json
{
  "server_name": "My new server",
  "jar_name": "Vanilla-1.21.1.jar",
  "minimum_ram": "2G",
  "maximum_ram": "4G"
}
```
- **server_name**: Server name displayed in the console.
- **jar_name**: Name of the Minecraft server JAR file.
- **minimum_ram** / **maximum_ram**: Memory allocation (e.g., "2G", "512M").

### `start.sh`
Main script that:
1. Checks if `jq` is installed.
2. Reads configuration from `server-info.json`.
3. Verifies the JAR file exists.
4. Launches the server with the specified memory.

Usage example:
```bash
chmod +x start.sh
./start.sh
```
### `eula.txt`
Must contain `eula=true` to indicate that you have read and accepted the [Minecraft EULA](https://account.mojang.com/documents/minecraft_eula).

### `LICENSE.txt`
Contains the **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International** license for this project.

## Quick Start
1. Clone or download this repository.
2. Make sure `eula.txt` includes `eula=true`.
3. Adjust `server-info.json` to match your JAR filename and desired RAM.
4. Install `jq` if you don't have it.
5. Place your Minecraft server JAR in the same folder, matching the `jar_name` in `server-info.json`.
6. Run:
   ```bash
   chmod +x start.sh
   ./start.sh
    ```
## Contributing
Feel free to open a pull request or create an issue if you want to improve something.

## License
This project is licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). See `LICENSE.txt` for details.

