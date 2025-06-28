# 🐳 FerroOS – Developer Guide

This guide walks you through running and testing FerroOS locally using Docker. It simulates the OS's boot sequence and frontend logic so you can develop without reflashing hardware.

---

## 🧪 Step-by-Step: Simulate FerroOS in Docker

---

### 1. Prepare the Development Environment

Ensure you have Docker installed and you're inside the FerroOS project root.

Recommended structure:

```
ferroos/
├── Dockerfile
├── init.sh
├── frontend/init.sh
├── roms/
├── run.sh
```

---

### 2. Build the Docker Image

Run this command to create the image used to simulate FerroOS:

```bash
docker build -t ferroos-dev .
```

---

### 3. Run the OS in a Container

You can run the container manually:

```bash
docker run -it --rm \
  -v $PWD/frontend:/opt/frontend \
  -v $PWD/roms:/mnt/roms \
  ferroos-dev
```

Or use the `run.sh` script:

```bash
./run.sh
```

---

### 4. Simulate the Boot Process

When the container starts, it will:

- Execute `init.sh` at the root
- Create system paths like `/mnt/roms` and `/opt/frontend`
- Launch `/opt/frontend/init.sh` if it exists

Expected output:

```
🔧 Booting FerroOS...
🕹  Launching Frontend...
🎮 FerroOS v0.1 Frontend
Scanning ROMs...
hello.nes
```

---

### 5. Test and Develop Frontend Logic

Modify `frontend/init.sh` to simulate menu logic, ROM scanning, or UI interactions.

Ensure it’s executable:

```bash
chmod +x frontend/init.sh
```

---

### 6. What's Happening Behind the Scenes

| Host Path       | Container Path    | Purpose                |
|------------------|-------------------|-------------------------|
| `./frontend/`    | `/opt/frontend/`  | Entry point for frontend logic |
| `./roms/`        | `/mnt/roms/`      | Folder where ROM files are scanned |

---

### 7. Clean Up and Rebuild (Optional)

To rebuild the image after changes:

```bash
docker build -t ferroos-dev .
```

To stop and remove the container:

```bash
CTRL+C
```

---

## 📝 Notes

- You can iterate on `init.sh` and `frontend/init.sh` as if they were running on an actual device
- No flashing or SD card required for basic flow testing
- This is a simulation of the boot and UI experience only (no GPU or framebuffer yet)
