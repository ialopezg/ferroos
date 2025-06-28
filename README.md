# 🎮 FerroOS

**FerroOS** – A modular retro gaming OS designed for flexible deployment across handhelds and custom hardware platforms.
Built for extensibility and long-term use in our own embedded infrastructure.
Built to evolve from a simulated dev environment (via Docker) into a full Buildroot-based OS with custom frontend and
hardware integration.

---

## 🧭 Project Philosophy

- 🔩 Minimalist, hardware-aware design
- 🕹 RetroArch core with custom UI (text-based or graphical)
- 🔧 Dev-first approach with Dockerized simulation
- 🧱 Clean directory structure with Go-style naming
- 🛠 Future support for Buildroot, device trees, and flashing

---

## 📂 Documentation

- [`docs/developer-guide.md`](docs/developer-guide.md) – How to build and run FerroOS locally using Docker
- Future docs will cover frontend UI logic, config handling, and hardware flashing

---

## 🗂 Directory Structure

```text
ferroos/
├── Dockerfile          # Dev container definition (Debian Bookworm + RetroArch)
├── init.sh             # Simulated /init boot logic
├── frontend/
│   └── init.sh         # Entry point for UI/frontend logic
├── roms/               # Mounted ROM directory
├── system/
│   ├── etc/            # Future: simulated system config
│   └── opt/            # Future: optional packages
├── run.sh              # Local runner script (build + launch)
├── .gitignore
└── README.md
```

---

## 🧱 Naming Conventions

- Use clear, single-responsibility names like `init.sh`, `boot.sh`, or `scan.sh`
- Avoid repetitive paths
- Favor structure that communicates intent through folder context, not repeated file names
- Keep naming consistent across all services, scripts, and modules for easier maintainability

## 🛣 Roadmap

### 🏗 Phase 1: Local Simulation

- [x] Docker-based OS mock
- [x] Init sequence logic
- [x] Frontend entrypoint
- [ ] TUI framework (dialog or SDL2)
- [ ] Config boot splash

### 🔋 Phase 2: Buildroot Integration

- [ ] Custom image generation
- [ ] Cross-compile RetroArch + tools
- [ ] Integrate ROM auto-mount + FAT32 support
- [ ] Test on TrimUI hardware (Allwinner A133)

### 🧬 Phase 3: Hardware Expansion

- [ ] Bootloader customization (U-Boot)
- [ ] Device tree overlays
- [ ] Custom PCB (Elegoo-based casing)
- [ ] ArkadOS or ZynchOS fork variants

---

## 👤 Author

Maintained by **@ialopezg**  
Ideas, contributions, and forks welcome.

---

## 📄 License

FerroOS is licensed under the [Apache License 2.0](LICENSE).
