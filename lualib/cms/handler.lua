local skynet = require "skynet"
local json = require "cjson.safe"

local M = {
    root = "cms/api",
    api = {
        ['/cms/user/login'] = {args = {account = "STR", password = "STR"}, auth = false},
        ['/cms/view/menu'] = {auth = true},
    },
}

function M.pack(data)
    return json.encode(data)
end

function M.unpack(data)
    return json.decode(data)
end

function M:auth(authorization)
    return skynet.call("cms", "lua", "get_account", authorization)
end

return M