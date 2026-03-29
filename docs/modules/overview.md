# Modules Overview

This collection provides three focused modules that work together to provision Hetzner Cloud infrastructure.

## Architecture

```
ssh-keys  ──┐
             ├──► server
firewall  ──┘
```

The `server` module looks up SSH keys and firewalls by name, so the other two modules must be applied first.

## Modules

| Module | Source | Purpose |
|--------|--------|---------|
| [firewall](./firewall.md) | `AutomationDojo/infrastructure/hcloud//modules/firewall` | Manage firewalls and inbound/outbound rules |
| [server](./server.md) | `AutomationDojo/infrastructure/hcloud//modules/server` | Provision servers with delete/rebuild protection |
| [ssh-keys](./ssh-keys.md) | `AutomationDojo/infrastructure/hcloud//modules/ssh-keys` | Generate or import SSH key pairs |
