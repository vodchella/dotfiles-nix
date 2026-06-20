local dap = require('dap')

dap.adapters.codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'codelldb',
        args = { '--port', '${port}' },
    },
}

dap.adapters.ocamlearlybird = {
    type = 'executable',
    command = 'ocamlearlybird',
    args = { 'debug' },
}


local function get_dap_executable()
    -- .nvim.lua samples:
    -- vim.g.dap_executable = vim.fn.getcwd() .. '/.build/xogui'
    -- vim.g.dap_executable = vim.fn.getcwd() .. '/_build/default/src/xo.bc'
    if not vim.g.dap_executable then
        vim.notify(
            'DAP executable is not configured. Set vim.g.dap_executable in .nvim.lua',
            vim.log.levels.ERROR,
            { title = 'nvim-dap' }
        )
        return nil
    end
    return vim.g.dap_executable
end

dap.configurations.odin = {
    {
        name = 'Debug Odin',
        type = 'codelldb',
        request = 'launch',
        program = get_dap_executable,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

dap.configurations.ocaml = {
    {
        name = 'Debug OCaml',
        type = 'ocamlearlybird',
        request = 'launch',
        program = get_dap_executable,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        onlyDebugGlob = '<${workspaceFolder}/**/*>',
        yieldSteps = 1024,
    },
}

