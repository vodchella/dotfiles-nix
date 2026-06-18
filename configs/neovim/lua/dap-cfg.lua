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
            return vim.fn.input(
                'Executable: ',
                vim.fn.getcwd() .. '/.build/xogui',
                'file'
            )
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}
