local f = require("functions")

vim.api.nvim_create_user_command("LspBufInfo", function()
  f.show_lsp_for_buffer()
end, {})
