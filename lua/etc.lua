-- An easy-to-change reminder - exercise from The Pragmatic Programmer
--
local etc = {}
local api = vim.api
local notify = require("notify")
local writeBufCnt = 0

notify.setup({
  timeout=500,
  render='compact',
})

local function notify_after_save()
    writeBufCnt = writeBufCnt + 1
    if writeBufCnt % 10 == 0 then
        notify("Easy to change!")
    end
end

function etc.setup()
    api.nvim_create_autocmd(
        "BufWritePost", {
        callback = function() notify_after_save() end,
    })
end

return etc
