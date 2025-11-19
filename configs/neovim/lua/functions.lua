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

function M.jdtls_update_project_config()
    require('jdtls').update_project_config()
end

return M
