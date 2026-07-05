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
    local ok, jdtls = pcall(require, 'jdtls')
    if not ok then
        vim.notify("JDTLS not installed", vim.log.levels.ERROR)
        return
    end
    jdtls.update_project_config()
end

function M.oil_open_float()
    local ok, oil = pcall(require, 'oil')
    if not ok then
        vim.notify("OIL not installed", vim.log.levels.ERROR)
        return
    end
    oil.open_float()
end

local comment_not_loaded = "Comment.nvim doesn't loadad, PackerSync will save you :)"
function M.comment_lines_n()
  local ok, api = pcall(require, 'Comment.api')
  if not ok then
    vim.notify(comment_not_loaded, vim.log.levels.ERROR)
    return
  end
  api.toggle.linewise.current()
end
function M.comment_lines_v()
  local ok, api = pcall(require, 'Comment.api')
  if not ok then
    vim.notify(comment_not_loaded, vim.log.levels.ERROR)
    return
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
  api.toggle.linewise(vim.fn.visualmode())
end

function M.hodur_open_under_cursor()
  local ok, api = pcall(require, 'hodur')
  if not ok then
    vim.notify("Hodur.nvim doesn't loadad, PackerSync will save you :)", vim.log.levels.ERROR)
    return
  end
  api.open_under_cursor()
end

function M.dapui_close()
  local ok, dap = pcall(require, 'dap')
  if not ok then
    vim.notify("DAP doesn't loadad, PackerSync will save you :)", vim.log.levels.ERROR)
    return
  end
  local ok, dapui = pcall(require, 'dapui')
  if not ok then
    vim.notify("DAPUI doesn't loadad, PackerSync will save you :)", vim.log.levels.ERROR)
    return
  end

  -- Сначала остановить/отсоединиться от отладочной сессии
  dap.terminate()
  dap.disconnect({ terminateDebuggee = true })

  -- Затем закрыть интерфейс (панели, консоль, т.д.)
  dapui.close()
end

function M.dapui_float_element()
  local ok, dapui = pcall(require, 'dapui')
  if not ok then
    vim.notify("DAPUI doesn't loadad, PackerSync will save you :)", vim.log.levels.ERROR)
    return
  end
  dapui.float_element(nil, { enter = true })
end

function M.dap_cond_breakpoint()
  local ok, dap = pcall(require, 'dap')
  if not ok then
    vim.notify("DAP doesn't loadad, PackerSync will save you :)", vim.log.levels.ERROR)
    return
  end
  vim.ui.input({ prompt = 'Condition: ' }, function(cond)
    if cond then dap.set_breakpoint(cond) end
  end)
end

function M.lsp_buf_hover()
    vim.lsp.buf.hover({
        border = 'rounded',
        title = ' LSP info: ',
        title_pos = 'center',
    })
end

function M.toggle_terminal_mode()
    if vim.bo.buftype ~= 'terminal' then
        vim.cmd('terminal')
        return
    end

    local mode = vim.api.nvim_get_mode().mode

    if mode == 't' then
        vim.cmd('stopinsert')
    else
        vim.cmd('startinsert')
    end
end

return M
