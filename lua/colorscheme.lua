local colorscheme = "onedark"
-- tokyonight
-- zephyr
-- nord
-- onedark
-- edge
-- kanagawa
-- catppuccin
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
  return
end
