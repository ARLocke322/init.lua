# AGENTS.md

Personal Neovim configuration (Kickstart-derived, single-user). Not an app: there are no build, test, or deploy commands. The "product" is the editor itself.

## Layout and load order

- `init.lua` only requires the four core modules, in order: `globals` -> `options` -> `keymaps` -> `autocmds`.
- `lua/` holds the core config. `globals.lua` sets the leader key (space) and `vim.g.have_nerd_font`, which other plugins read, so it must load first.
- `plugin/` holds one file per plugin. Every file in `plugin/` is sourced automatically by Neovim at startup, alphabetically, after `init.lua`. There is no other loader or orchestration; adding a plugin = creating a new file here.

## Plugin management

- Uses **vim.pack** (Neovim's built-in package manager, requires Neovim 0.12+). There is no lazy.nvim/packer. Each `plugin/*.lua` file starts with `vim.pack.add({ ... })` and then configures the plugin.
- Lockfile is `nvim-pack-lock.json` (managed by vim.pack; do not hand-edit).
- Post-install build steps live in `lua/autocmds.lua` via the `PackChanged` event, e.g. `telescope-fzf-native.nvim` is compiled with `make` on install/update. If a new plugin needs a build step, add a case to that autocmd, not a plugin-manager hook.

## LSP / tooling (plugin/nvim-lspconfig.lua)

- Servers are declared in the `servers` table, then installed via `mason-tool-installer` and configured via the **new mason-lspconfig v2 API**: `vim.lsp.config(server_name, cfg)` per server plus `mason-lspconfig.setup { automatic_enable = true }`. Do not use the old `handlers`/`setup_handlers` pattern.
- Capabilities come from `blink.cmp` and are force-merged into every server config.
- **Ruby tooling runs through mise, not Mason binaries**: `ruby_lsp` uses `mise exec -- ruby-lsp` and `rubocop` uses `mise exec -- bundle exec rubocop --lsp` so the project `.ruby-version`/Gemfile is respected. Keep this pattern for any server whose version must match the project.
- `client_supports_method` wrapper exists to bridge the 0.10/0.11 API difference; reuse it when gating on LSP methods.

## Formatting and linting

- Formatting: `conform.nvim` with `format_on_save` (500ms timeout, `lsp_format = 'fallback'`); Lua uses `stylua` (installed by Mason). C/C++ are excluded from format-on-save. Manual format: `<leader>f`.
- Linting: `nvim-lint`, runs on `BufEnter`/`BufWritePost`/`InsertLeave`, guarded by `vim.bo.modifiable`.
- Editing Lua here: stylua formats with tabs (indent_type = "Tabs") and prefers double quotes (quote_style = "AutoPreferDouble"). Files were bulk-reformatted to this style; keep new edits consistent with it.

## Conventions

- Leader is `<Space>` (set in `lua/globals.lua`); both `mapleader` and `maplocalleader`.
- Keymap descriptions use Kickstart's `[X] [Y]` mnemonic style (e.g. `[S]earch [F]iles`), which feeds which-key. Keep it when adding mappings.
- LSP keymaps are defined in two places: global ones in `lua/keymaps.lua` (`gd`, `gr`, `K`, `<leader>ca`, `<leader>rn`) and buffer-local ones in the `LspAttach` autocmd in `plugin/nvim-lspconfig.lua` (`grn`, `gra`, `grr`, ...). Check both before changing.
- Default indent is 2 spaces (`options.lua`); `guess-indent.nvim` adapts per-buffer.
- `lua/autocmds.lua` uses `vim.hl.hl_op()` (Neovim 0.12 API, not the older `vim.highlight.on_yank`) for yank highlighting.

## Gotchas

- Files use tabs for indentation and double quotes (stylua-managed; see "Formatting and linting").
- Three colorschemes are installed (rose-pine, tokyonight, gruvbox-material). The active scheme is persisted: `plugin/colourschemes.lua` reads the saved name from `stdpath("data") .. "/colorscheme.txt"` at startup (default `tokyonight-moon`) and a `ColorScheme` autocmd writes `vim.g.colors_name` back on every switch. `CursorLineNr` is overridden with a rose-pine palette color (`#e0def4`) regardless of the active theme; the `LineNrAbove`/`LineNrBelow` overrides are commented out.
- `hardtime.nvim` and the arrow-key/`jk`-only training keymaps in `lua/keymaps.lua` deliberately block arrow keys and `<Esc>` in insert mode. Don't "fix" them.
- Harpoon uses the `harpoon2` branch, pinned via `{ src = ..., version = 'harpoon2' }` in `vim.pack.add`.

## Verifying changes

Open Neovim with a specific config file to smoke-test, e.g.:

```sh
nvim --headless '+lua print("ok")' +qa   # config loads without errors
```

Check `:checkhealth`, `:Mason` for tool status, and `:LspInfo` (or `:checkhealth vim.lsp`) for server attachment. There is no automated test suite; a clean headless startup plus the affected feature working is the bar.
