local M = {}

-- Native vimgrep: literal query, no shell interpretation, results in quickfix.
function M.grep(query)
    if not query or query == "" then
        return
    end
    if query:find("[\r\n]") then
        vim.notify("Search one line of literal text at a time", vim.log.levels.WARN)
        return
    end
    local pattern = "\\V" .. vim.fn.escape(query, "\\/")
    local ok, err = pcall(vim.cmd, "vimgrep /" .. pattern .. "/gj **/*")
    if not ok and not tostring(err):find("E480", 1, true) then
        vim.notify(tostring(err), vim.log.levels.ERROR)
        return
    end
    if #vim.fn.getqflist() > 0 then
        vim.cmd.copen()
    else
        vim.notify("No matches for: " .. query)
    end
end

-- Git uses its own executable and Neovim's terminal, with an argument list.
-- This command accepts Git arguments, not shell pipelines or expansions.
function M.git(args)
    if vim.fn.executable("git") ~= 1 then
        vim.notify("Git is not installed", vim.log.levels.WARN)
        return
    end
    vim.cmd("botright 12new")
    local argv = { "git", "--no-pager" }
    vim.list_extend(argv, #args > 0 and args or { "status", "--short", "--branch" })
    vim.fn.jobstart(argv, { term = true })
end

function M.format()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr, method = "textDocument/formatting" })
    if #clients == 0 then
        vim.notify("No attached language server supports formatting", vim.log.levels.INFO)
        return
    end
    -- Choose one provider instead of applying several formatters to the same file.
    local function run(client)
        if client and vim.api.nvim_buf_is_valid(bufnr) then
            vim.lsp.buf.format({ bufnr = bufnr, id = client.id, async = false, timeout_ms = 2000 })
        end
    end
    if #clients == 1 then
        run(clients[1])
    else
        vim.ui.select(clients, { prompt = "Formatter", format_item = function(c) return c.name end }, run)
    end
end

vim.api.nvim_create_user_command("Grep", function(opts)
    if opts.args ~= "" then
        M.grep(opts.args)
    else
        vim.ui.input({ prompt = "Search literal text: " }, M.grep)
    end
end, { nargs = "?", desc = "Search current directory recursively using native vimgrep" })
vim.api.nvim_create_user_command("Git", function(opts)
    M.git(opts.fargs)
end, { nargs = "*", desc = "Run Git in a terminal; arguments are passed without a shell" })
vim.api.nvim_create_user_command("Format", M.format, { desc = "Format explicitly with an attached LSP" })
return M
