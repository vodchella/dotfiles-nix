local f = require("functions")

vim.api.nvim_create_user_command("LspBufInfo", function()
  f.show_lsp_for_buffer()
end, {})

vim.api.nvim_create_user_command("Linter", function()
  if vim.bo.filetype == "java" then
    local ok, checkstyle = pcall(require, 'checkstyle')
    if not ok then
        vim.notify("Checkstyle не установлен", vim.log.levels.ERROR)
        return
    end
    checkstyle.run_current_file()
  else
    vim.notify("Для данного типа файлов линтер не настроен", vim.log.levels.WARN)
  end
end, {})
