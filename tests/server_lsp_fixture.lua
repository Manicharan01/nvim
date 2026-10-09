-- Minimal stdio LSP server for integration checks. No third-party test dependencies.
local input = vim.uv.new_pipe(false)
local output = vim.uv.new_pipe(false)
input:open(0)
output:open(1)
local pending = ""

local function send(message)
    local body = vim.json.encode(message)
    output:write("Content-Length: " .. #body .. "\r\n\r\n" .. body)
end
local function handle(message)
    local result = vim.NIL
    if message.method == "initialize" then
        result = { capabilities = {
            textDocumentSync = 1,
            completionProvider = { triggerCharacters = { "." } },
            documentFormattingProvider = true,
            definitionProvider = true,
        } }
    elseif message.method == "textDocument/completion" then
        result = { { label = "server_fixture", insertText = "server_${1:fixture}", insertTextFormat = 2 } }
    elseif message.method == "textDocument/formatting" then
        result = { {
            range = { start = { line = 0, character = 0 }, ["end"] = { line = 0, character = 0 } },
            newText = "# formatted\n",
        } }
    elseif message.method == "textDocument/definition" then
        result = { uri = message.params.textDocument.uri,
            range = { start = { line = 0, character = 0 }, ["end"] = { line = 0, character = 1 } } }
    elseif message.method == "textDocument/didOpen" then
        send({ jsonrpc = "2.0", method = "textDocument/publishDiagnostics", params = {
            uri = message.params.textDocument.uri,
            diagnostics = { { message = "fixture diagnostic", severity = 2,
                range = { start = { line = 0, character = 0 }, ["end"] = { line = 0, character = 1 } } } },
        } })
    elseif message.method == "exit" then
        input:read_stop()
        input:close()
        output:close()
        vim.schedule(function() vim.cmd.qa() end)
    end
    if message.id ~= nil then
        send({ jsonrpc = "2.0", id = message.id, result = result })
    end
end

input:read_start(function(err, data)
    assert(not err, err)
    if not data then return end
    pending = pending .. data
    while true do
        local header_end = pending:find("\r\n\r\n", 1, true)
        if not header_end then return end
        local length = assert(tonumber(pending:sub(1, header_end):match("Content%-Length: (%d+)")))
        local body_start = header_end + 4
        if #pending < body_start + length - 1 then return end
        local body = pending:sub(body_start, body_start + length - 1)
        pending = pending:sub(body_start + length)
        handle(vim.json.decode(body))
    end
end)
vim.wait(30000, function() return input:is_closing() end, 10)
