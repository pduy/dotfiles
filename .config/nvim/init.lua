vim.cmd([[
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath=&runtimepath
  source ~/.vimrc
]])
if vim.g.vscode then
  ---- VSCode extension
else
  ---- ordinary Neovim
end

local function reload_theme()
    local mode_fh = io.open(vim.fn.expand("~/.config/theme_mode"), "r")
    if mode_fh then
        local mode = mode_fh:read("*all"):gsub("%s+", "")
        mode_fh:close()
        if mode == "dark" or mode == "light" then
            vim.o.background = mode
        end
    end

    local cs_fh = io.open(vim.fn.expand("~/.config/nvim_colorscheme"), "r")
    if cs_fh then
        local cs = cs_fh:read("*all"):gsub("%s+", "")
        cs_fh:close()
        if cs ~= "" then
            local ok = pcall(vim.cmd.colorscheme, cs)
            if not ok then
                vim.notify("Colorscheme not installed: " .. cs, vim.log.levels.WARN)
            end
        end
    end
end

vim.api.nvim_create_user_command("ReloadTheme", reload_theme, {})

local _sigusr1 = vim.uv.new_signal()
vim.uv.signal_start(_sigusr1, "sigusr1", function()
    vim.schedule(reload_theme)
end)

reload_theme()
