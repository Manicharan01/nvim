local repo = vim.fn.getcwd()
local passed = 0
local function check(value, message)
    assert(value, message)
    passed = passed + 1
end
local function run()
    check(vim.version().major == 0 and vim.version().minor >= 12, "Requires Neovim 0.12+")
    check(vim.v.errmsg == "", "Startup error: " .. vim.v.errmsg)
    check(vim.g.mapleader == " ", "Space leader missing")
    check(vim.g.colors_name == "habamax", "Native theme missing")
    check(vim.fn.exists(":Explore") == 2 and vim.fn.exists(":Undotree") == 2
        and vim.fn.exists(":DiffTool") == 2, "Bundled commands missing")
    check(not package.loaded["blink.cmp"] and not package.loaded["telescope"], "Third-party plugin loaded")
    check(not package.loaded["vim._core.ui2"], "Private experimental UI loaded")
    for name, config in pairs(require("server.lsp")) do
        check(vim.lsp.is_enabled(name) == (vim.fn.executable(config.cmd[1]) == 1),
            "Incorrect optional enablement: " .. name)
        vim.lsp.enable(name, false)
    end

    local fixture = vim.fn.stdpath("state") .. "/fixture-" .. vim.uv.hrtime()
    vim.fn.mkdir(fixture, "p")
    local original = { "services:", "  web:   ", "    image: nginx:latest  " }
    local file = fixture .. "/compose with spaces.yaml"
    vim.fn.writefile(original, file)
    local needle = [[a/b\c | let g:server_injected=1 | [literal].*]]
    vim.fn.writefile({ needle }, fixture .. "/search file.txt")
    vim.cmd.cd(vim.fn.fnameescape(fixture))
    vim.cmd.find(vim.fn.fnameescape("compose with spaces.yaml"))
    check(vim.fs.basename(vim.api.nvim_buf_get_name(0)) == "compose with spaces.yaml", "Native :find failed")
    check(vim.bo.filetype == "yaml" and vim.bo.shiftwidth == 2, "YAML detection/indent failed")
    vim.cmd.write()
    check(vim.deep_equal(original, vim.fn.readfile(file)), "Saving rewrote configuration text")

    require("server.tools").grep(needle)
    local matches = vim.fn.getqflist()
    check(#matches == 1 and matches[1].text == needle, "Literal vimgrep failed")
    check(vim.g.server_injected == nil, "Search interpreted an Ex command")
    vim.cmd.cclose()
    require("server.tools").grep("does-not-exist-928476")
    check(#vim.fn.getqflist() == 0, "No-match search retained stale quickfix results")

    vim.cmd.enew()
    vim.snippet.expand("if err != nil {\n\t${1:return err}\n}\n$0")
    check(vim.snippet.active(), "Native snippet did not activate")
    vim.snippet.stop()
    vim.cmd.enew({ bang = true })
    vim.cmd.Undotree()
    check(vim.bo.filetype == "nvim-undotree", "Undo tree did not open")
    -- The bundled undo UI schedules its initial cursor placement.
    vim.wait(60, function() return false end)
    vim.cmd.close()

    -- Real client/server transport over stdio; includes the profile's LspAttach hook.
    vim.cmd.edit(vim.fn.fnameescape(file))
    local buf = vim.api.nvim_get_current_buf()
    local client_id = vim.lsp.start({
        name = "server_fixture",
        cmd = { vim.v.progpath, "--headless", "-u", "NONE", "-l", repo .. "/tests/server_lsp_fixture.lua" },
        root_dir = fixture,
    })
    check(client_id ~= nil, "Fixture LSP failed to start")
    check(vim.wait(10000, function()
        local c = vim.lsp.get_client_by_id(client_id)
        return c and c.initialized and vim.lsp.buf_is_attached(buf, client_id)
            and #vim.diagnostic.get(buf) > 0
    end, 20), "LSP initialization/diagnostics timed out")
    check(vim.fn.maparg("gd", "n", false, true).buffer == 1, "Definition mapping not attached")
    local response = vim.lsp.buf_request_sync(buf, "textDocument/completion", {
        textDocument = { uri = vim.uri_from_bufnr(buf) }, position = { line = 0, character = 0 },
    }, 2000)
    check(response and response[client_id].result[1].label == "server_fixture", "Native LSP completion failed")
    require("server.tools").format()
    check(vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] == "# formatted", "Explicit LSP formatting failed")
    vim.lsp.get_client_by_id(client_id):stop()
    vim.wait(2000, function() return vim.lsp.get_client_by_id(client_id) == nil end, 20)

    -- Missing Git is handled; available Git runs without a shell.
    if vim.fn.executable("git") == 1 then
        vim.cmd.cd(vim.fn.fnameescape(repo))
        require("server.tools").git({ "status", "--short" })
        check(vim.bo.buftype == "terminal", "Git did not open in a native terminal")
    end
    check(vim.v.errmsg == "", "Runtime error: " .. vim.v.errmsg)
end

local ok, err = xpcall(run, debug.traceback)
for _, client in ipairs(vim.lsp.get_clients()) do client:stop(true) end
if not ok then
    io.stderr:write(tostring(err) .. "\n")
    vim.cmd("cquit 1")
else
    print("PASS: " .. passed .. " server profile checks on " .. tostring(vim.version()))
    vim.cmd("qa!")
end
