# Native server profile — Neovim 0.12.5

No plugin manager, startup downloads, compiler, Node.js, Python, Nerd Font, tmux
helper script, or external clipboard program is needed to open and edit files.
Language servers and Git are optional external tools, not Neovim plugins.

This profile keeps the repo's space leader, relative numbers, movement and paste
mappings, netrw, development languages, and common LSP mappings. It runs separately
from the desktop configuration.

## Install on each server

First check `nvim --version`; this profile was tested on **0.12.5**.
Clone the repository into any convenient directory and try the profile:

```sh
git clone --branch native-server-config https://github.com/Manicharan01/nvim.git "$HOME/nvim-config"
NVIM_APPNAME=nvim-server nvim -u "$HOME/nvim-config/server/init.lua"
```

After this branch is merged, omit `--branch native-server-config` when cloning.
To install the profile as its own configuration, run:

```sh
(
    config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/nvim-server"
    if [ -e "$config_dir" ]; then
        printf 'Already exists: %s\nChoose another app name or back it up first.\n' "$config_dir"
        exit 1
    fi
    mkdir -p "$config_dir"
    cp -R "$HOME/nvim-config/server/." "$config_dir/"
)
NVIM_APPNAME=nvim-server nvim
```

Use `NVIM_APPNAME=nvim-server nvim /path/to/file` or set a shell alias:

```sh
alias nvims='NVIM_APPNAME=nvim-server nvim'
```

This separates configuration, plugin, cache, undo, and history directories from
your desktop profile. For updates, review changes in the checkout, then copy the
`server/` contents again; installed copies do not update themselves.

## Native replacements

| Repo component | Server profile |
| --- | --- |
| Telescope + Plenary | `:find`, fuzzy command completion, `:vimgrep`, quickfix, `:help` |
| Blink completion | `vim.lsp.completion`, native buffer/path completion, `vim.snippet` |
| Harpoon | Global file marks (`mA`, `'A`, `mB`, `'B`), `:marks`, buffers |
| Fugitive | Git executable in a built-in terminal, `:diffsplit`, bundled `:DiffTool` |
| Mason | Optional language servers installed using their own/OS package manager |
| nvim-treesitter | `vim.treesitter.start` with existing parsers; native syntax fallback |
| Fidget | Native LSP progress, messages, `:checkhealth vim.lsp` |
| Downloaded themes and icons | Bundled `habamax`, plain statusline and diagnostic signs |
| Undo/diff plugins | Bundled `nvim.undotree` and `nvim.difftool` |
| tmux-sessionizer | Native terminal, splits, buffers and marks |

Native file marks require a named file. `<Space>a` stores mark A (replaces the
previous A); set B–Z manually for more bookmarks. This is simpler than Harpoon's
project lists. `<C-g>` now opens `:find`; it does not restrict results to Git files.

## Daily mappings

`<leader>` below is **Space**. Existing cursor/movement/paste mappings are retained.

| Key / command | Action |
| --- | --- |
| `<leader>pv` | Netrw file explorer |
| `<leader>pf`, `<C-g>` | `:find` prompt; type part of a filename, then Tab |
| `<leader>pg`, `:Grep text` | Search literal text recursively into quickfix |
| `<leader>pws`, `<leader>pWs` | Search current word / WORD as literal text |
| `<leader>j`, `<leader>k`, `<leader>q` | Next result, previous result, open quickfix |
| `<leader>b` | `:buffer` prompt; Tab completes buffer names |
| `<leader>a`, `<C-e>`, `'A` | Store mark A, list marks, jump to A |
| `<leader>vh` | Help prompt with Tab completion |
| `<leader>u`, `:Undotree` | Native interactive undo tree |
| `<leader>gs`, `<leader>gd`, `<leader>gl` | Git status, diff, recent log |
| `:Git ...` | Run Git arguments in a new terminal buffer |
| `<leader>gt`, `<Esc><Esc>` | Open terminal; leave terminal input mode |
| `:diffsplit other-file`, `:DiffTool left right` | Native file/directory comparison |
| `<C-n>` / `<C-p>` in Insert mode | Buffer word completion |
| `<C-x><C-f>` in Insert mode | Filename completion |
| `<C-x><C-o>` in Insert mode | LSP completion when attached |
| `<C-y>`, `<C-e>` in completion menu | Accept, cancel (Enter remains normal Enter) |
| Tab / Shift-Tab with active snippet | Next / previous native snippet placeholder |
| `<leader>ee` | Native Go `if err != nil` snippet |
| `gd`, `K`, `grn`, `gra`, `grr`, `gO` | LSP definition, hover, rename, actions, references, symbols |
| `<leader>vrn`, `<leader>vca`, `<leader>vrr` | Familiar aliases for rename/actions/references |
| `[d`, `]d`, `<leader>vd` | Previous/next diagnostic, diagnostic details |
| `<leader>f`, `:Format` | Explicit LSP formatting; selects one provider if several attach |
| `<leader>th` | Toggle LSP inlay hints |

Search and file finding are relative to the current directory. Use `:pwd` and
`:cd /path/to/project` first. Native recursive search is synchronous and can be
slow on large directories; work in a focused directory, especially on servers.
`:Grep` is a literal search; for regular expressions use `:vimgrep /pattern/gj **/*`.
Native wildcard search is not Git-ignore-aware. `wildignore` excludes common build
and dependency paths; extend it for your server. No automatic directory changes.

`:Git` passes arguments directly without shell expansion or pipelines. For complex
Git commands use `<leader>gt` and your shell. No keybinding pushes automatically.

## Optional language servers

The configuration uses `vim.lsp.config` and `vim.lsp.enable` directly. Only tools
already executable on `PATH` are enabled; missing tools are silent. Restart Neovim
after installing a server. Standalone files can attach even outside a project.

| Files | Optional executable / arguments |
| --- | --- |
| Shell | `bash-language-server start` |
| YAML / Compose YAML | `yaml-language-server --stdio` |
| Dockerfiles | `docker-langserver --stdio` |
| Lua | `lua-language-server` |
| Zig | `zls` |
| C/C++ | `clangd` |
| Go | `gopls` |
| Python | `pyrefly lsp` |
| TOML | `tombi lsp` |
| Rust | `rust-analyzer` |

Install only the tools you need, using the server OS package manager or upstream
installation instructions. Some language servers have their own Node/Python/toolchain
requirements. Match ZLS to your Zig version. C/C++ projects may need
`compile_commands.json`. The original incomplete `tsgo` entry is omitted.

YAML schema-store downloads are disabled; configure known schemas in
`lua/server/lsp.lua` if needed. Tree-sitter uses only already-installed parsers.
Neovim's bundled parser set varies by distribution; YAML/Docker highlighting falls
back to regular syntax if no parser is available. This config installs no parsers.

Useful checks: `:checkhealth server`, `:checkhealth vim.lsp`, `:lsp restart`,
`:messages`, and `:set filetype?`.

## Editing and SSH behavior

Saving does not automatically format or trim whitespace. YAML/Lua/shell/JSON/TOML
use two-space indentation, Go and Make use tabs, and the remaining files default
to four spaces. The bundled EditorConfig support can override these settings.
No private `vim._core` APIs are used.

Mouse capture is off so terminal selection works. Clipboard mappings use your
configured provider; they do not assume a graphical clipboard exists on the server.
Neovim can use its built-in OSC 52 provider when supported by your terminal and
SSH/tmux setup. If autodetection does not work, explicitly opt in by adding this
to the installed `init.lua` (terminal paste/read support varies):

```lua
vim.g.clipboard = "osc52"
```

Persistent undo is stored under `stdpath('state')/undo` in a private Unix directory.
It retains previous file contents. Set `vim.opt.undofile = false` in `init.lua` if
you do not want that retention, or set it buffer-locally for sensitive files.
Under root/sudo, persistent undo and ShaDa writes are disabled. Swap and backup
files are disabled, as in the source configuration.

## Verification

From the repository root, using a fresh app name:

```sh
NVIM_APPNAME=nvim-server-test nvim --headless -u server/init.lua \
    -c "lua dofile('tests/server_smoke.lua')"
```

The smoke test verifies startup, optional LSP enablement, bundled commands, native
file finding and literal search, saving without text rewrites, snippets, undo,
and a real native LSP connection to a small test server. It uses a fixture directory
under the test app's state directory and exits nonzero on failure.
