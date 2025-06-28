# 🧠 FerroOS – Engineering Architecture

This document outlines the core architecture and technical strategy for FerroOS. It will evolve over time as the project grows from simulation to hardware deployment.

---

## 🔧 High-Level Structure

FerroOS is organized around the following system layers:

```
[Boot] → [Init] → [Frontend] → [Emulator Stack]
   ↓         ↓         ↓              ↓
 SD Card   init.sh   init.sh    RetroArch cores
           (root)    (frontend)
```

---

## 🏗 Components

### 1. Boot System
- **Role**: Will eventually be replaced by U-Boot on real hardware.
- **Current**: Simulated via Docker entrypoint.
- **Future**: Image loader, device tree, pre-kernel setup.

### 2. Init System
- **Location**: `/init.sh`
- **Responsibility**:
  - Setup filesystem paths
  - Delegate control to frontend
  - Simulate kernel/bootloader transition

### 3. Frontend Layer
- **Location**: `frontend/init.sh`
- **Design Goal**:
  - Text-based first, later SDL2 or framebuffer-based UI
  - Select ROMs, change settings
  - Mount paths for emulators

### 4. ROM Handling
- **Location**: `/mnt/roms`
- **Behavior**: Mounted from host for now, will later auto-scan FAT32 SD partition

### 5. Emulator Runtime
- **Initial**: RetroArch CLI (auto-start)
- **Later**: Custom binary manager (per-core handling, per-game config)

---

## 📁 Folder Roles

| Folder         | Purpose                               |
|----------------|----------------------------------------|
| `/`            | Base layer, includes `init.sh`         |
| `frontend/`    | UI/UX logic, input scanning            |
| `roms/`        | ROM mounting & auto-discovery          |
| `system/`      | Placeholder for config/system dirs     |

---

## 🔄 Planned Transitions

| From            | To                   | Notes                       |
|------------------|----------------------|-----------------------------|
| Docker only      | Buildroot-based img  | Real hardware flash target |
| Shell frontend   | SDL2 or framebuffer  | UI evolution path          |
| Static RetroArch | Modular emulator bin | User config flexibility    |

---

## 🔮 Future Topics

- Device tree integration (for TrimUI Smart Pro)
- U-Boot and kernel layering
- Filesystem overlays and squashfs
- Save state management
- RTC & battery support
- Cross-compilation tooling

---

## 👤 Maintainer

This document is maintained by `@ialopezg`.  
Updates will follow milestone planning and implementation feedback.
