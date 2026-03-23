# ❄️ Celso NixOS Systems

Declarative multi-host NixOS configuration using flakes, focused on reproducibility, modularity, and self-hosted services.

---

## 🖥️ Hosts

| Host    | Description                                                         |
| ------- | ------------------------------------------------------------------- |
| `mllse` | Main machine (MINI PC CHINêS PAPAI) running core services (Asterisk, Home Assistant, MQTT) |
| `vm1`   | Virtual machine for testing and experimentation                     |

---

## 📦 Repository Structure

```
.
├── flake.nix
├── hosts/
│   ├── mllse/
│   └── vm1/
├── modules/
│   ├── hardware/
│   ├── services/
│   │   ├── asterisk/
│   │   ├── home-assistant/
│   │   └── ssh.nix
│   └── system/
├── users.nix
├── programs.nix
└── README.md
```

---

## ⚙️ Usage

### Build and switch system

```bash
sudo nixos-rebuild switch --flake .#mllse
```

```bash
sudo nixos-rebuild switch --flake .#vm1
```

---

## 🧩 Features

* ❄️ Flake-based configuration
* 🧱 Modular architecture (`modules/`)
* 📡 Asterisk PBX (PJSIP)
* 🏠 Home Assistant integration
* 📬 MQTT broker (Mosquitto)
* 🔐 Hardened SSH (no password login)
* 📦 Reproducible system packages
* 🧪 Multi-host support

---

## 📡 Services Overview

### Asterisk

* Configured via declarative Nix module
* PJSIP endpoints (`0001`, `0002`, etc.)
* Internal dialing via `extensions.conf`

### MQTT (Mosquitto)

* Local-only listener (`127.0.0.1:1883`)
* Persistence enabled

### Home Assistant

* Data directory: `/var/lib/hass`
* MQTT-ready (integration optional)

### Zigbee (optional)

* Uses Zigbee2MQTT
* Requires MQTT enabled

---

## 🔧 System Details

* Kernel: `linuxPackages_6_6`
* Custom driver: **YT6801 Ethernet module**
* Locale: `pt_BR.UTF-8`
* Timezone: `America/Sao_Paulo`
* Shell: `zsh`

---

## 🔐 Security Notes

* SSH password login disabled
* Root login disabled
* Firewall currently **disabled** (⚠️ needs improvement)
* Asterisk credentials currently **hardcoded**

---

## ⚠️ Secrets Management (TODO)

Sensitive data is currently stored in:

```
modules/services/asterisk/asterisk-conf/pjsip.conf
```

Planned improvements:

* Use `sops-nix`
* Runtime secret injection
* Remove plaintext passwords from repo

---

## 🚧 TODO

* [ ] Implement SOPS for secrets
* [ ] Enable and configure firewall properly
* [ ] Enable Zigbee stack
* [ ] Add monitoring (Prometheus/Grafana)
* [ ] Improve backup strategy
* [ ] Service health dashboard

---

## 🧠 Notes

* System is fully declarative via flakes
* Services are modular and reusable
* Designed for homelab / self-hosting environment
* Focus on simplicity first, complexity later

---

## 🧑‍💻 Author

**Celso Arthur**
