local dap = require('dap')

dap.adapters.codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'codelldb',
        args = { '--port', '${port}' },
    },
}

dap.configurations.odin = {
    {
        name = 'Debug Odin',
        type = 'codelldb',
        request = 'launch',
        program = function()
            if not vim.g.dap_executable then
                vim.notify(
                    'DAP executable is not configured. Set vim.g.dap_executable in .nvim.lua',
                    vim.log.levels.ERROR,
                    { title = 'nvim-dap' }
                )
                return nil
            end
            return vim.g.dap_executable
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}
