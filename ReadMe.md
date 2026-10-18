### 1. Install compter-tui

Install the desired formula (for example, `compter-tui`):

```bash
choco install compter-tui
```

---
## Open Source Projects

This tap packages tools built on the following open-source projects:

* **[harisr92/compter-tui](https://github.com/harisr92/accounting-tui)**  
  A keyboard-driven Terminal UI (TUI) accounting application built with [Ratatui](https://ratatui.rs) in Rust. Designed for freelancers and small businesses to track projects, milestones, billable hours, generate GST-compliant invoices with PDF exports, record payments, and track tax reports directly from the terminal.

* **[harisr92/accounting-blue](https://github.com/harisr92/accounting-blue)**  
  The core double-entry bookkeeping and accounting engine in Rust powering `compter-tui`. Features transaction ledgers, balance tracking, GST and tax computation, invoice generation and PDF layout, bank reconciliation, and financial reporting.

---

## Maintenance & Upgrades

To update formulas in this tap:

```bash
brew update
brew upgrade compter-tui
```

To remove a formula and untap:

```bash
brew uninstall compter-tui
brew untap harisr92/tap
```

---

## Issues & Contributing

* If you encounter an issue with the Homebrew installation or packaging, please open an issue in this repository: [harisr92/homebrew-tap/issues](https://github.com/harisr92/homebrew-tap/issues).
* For bugs, feature requests, or contributions related to the applications themselves, please refer to their respective upstream repositories:
  * [harisr92/compter-tui Issues](https://github.com/harisr92/accounting-tui/issues)
  * [harisr92/accounting-blue Issues](https://github.com/harisr92/accounting-blue/issues)
