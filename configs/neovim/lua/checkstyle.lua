local M = {}

M.jar = vim.fn.expand("~/.nix-profile/checkstyle/checkstyle-all.jar")
M.cfg = vim.fn.expand("~/projects/checkstyle/checkstyle.xml")


local efm = table.concat({
  "%f:%l:%c: %t%*[^:]: %m",
  "%f:%l: %t%*[^:]: %m",
}, ",")

function M.run_current_file()
  if vim.bo.modified then
    vim.notify("Сначала сохрани файл (:w).", vim.log.levels.WARN)
    return
  end
  local file = vim.fn.expand("%:p")
  local cmd = {
    "java", "-jar", M.jar, "-c", M.cfg, file
  }

  -- очистить quickfix
  vim.fn.setqflist({}, 'r')

  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      if not data then return end
      -- временно пишем в буфер сообщений; парсинг сделаем через setqflist + efm
      for _, line in ipairs(data) do
        if line ~= "" then
          vim.fn.setqflist({}, 'a', { lines = { line }, efm = efm })
        end
      end
    end,
    on_stderr = function(_, data)
      if not data then return end
      for _, line in ipairs(data) do
        if line ~= "" then
          vim.fn.setqflist({}, 'a', { lines = { line }, efm = efm })
        end
      end
    end,
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("Checkstyle: OK", vim.log.levels.INFO)
      else
        vim.notify("Checkstyle: есть замечания (см. :copen)", vim.log.levels.WARN)
      end
      vim.cmd("copen")
    end,
  })
end

return M
