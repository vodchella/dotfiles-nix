local M = {}

--- Показывает историю git для выделенных строк (аналог IntelliJ "History for selection")
function M.git_history_for_selection()
  local file = vim.fn.expand("%:p")
  if vim.fn.filereadable(file) ~= 1 then
    vim.notify("Not a file on disk", vim.log.levels.WARN)
    return
  end

  local s = vim.fn.line("v")
  local e = vim.fn.line(".")
  if s > e then s, e = e, s end

  -- Команда git log -L для диапазона строк
  local cmd = { "git", "-c", "color.ui=never", "log", "-p", ("-L%d,%d:%s"):format(s, e, file) }

  -- Очищаем quickfix и запускаем джобу
  vim.fn.setqflist({}, "r")
  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if not data then return end
      vim.fn.setqflist({}, "a", { lines = data })
    end,
    on_exit = function()
      vim.cmd("copen")
    end,
  })
end

-- Возвращает строки с именами LSP-клиентов, прикреплённых к текущему буферу
function M.get_attached_lsp_clients()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  if #clients == 0 then
    return nil, "No LSP clients attached to this buffer"
  end

  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end

  return names
end

-- Выводит LSP-клиентов через notify
function M.show_lsp_for_buffer()
  local names, err = M.get_attached_lsp_clients()

  if not names then
    vim.api.nvim_echo({{ err, "WarningMsg" }}, false, {})
    return
  end

  local msg = "Current attached LSP: " .. table.concat(names, ", ")
  vim.api.nvim_echo({{ msg, "None" }}, false, {})
end

function M.jdtls_update_project_config()
    require('jdtls').update_project_config()
end

return M
