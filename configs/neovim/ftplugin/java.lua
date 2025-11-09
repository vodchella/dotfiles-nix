local ok, jdtls = pcall(require, 'jdtls')
if not ok then return end

--- paths ---
local data = vim.fn.stdpath('data')
local mason = data .. '/mason'
local jdt    = mason .. '/packages/jdtls'
local config = jdt .. '/config_linux'
local launcher = vim.fn.glob(jdt .. '/plugins/org.eclipse.equinox.launcher_*.jar')
local debug_bundle = vim.fn.glob(mason .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar")

--- Lombok jar: берём из ENV, иначе из стандартного места
local lombok = vim.env.LOMBOK_JAR or (vim.fn.expand('~/.local/share/nvim/mason/packages/jdtls/lombok.jar'))
if vim.fn.filereadable(lombok) == 0 then
  vim.notify('Lombok jar not found at: ' .. lombok, vim.log.levels.WARN)
end

--- workspace per project ---
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace = vim.fn.expand('~/.cache/jdtls-workspace/') .. project_name

-- --- JDT LS command with -javaagent ---
local cmd = {
  'java',
  string.format('-javaagent:%s', lombok),
  '-Declipse.application=org.eclipse.jdt.ls.core.id1',
  '-Dosgi.bundles.defaultStartLevel=4',
  '-Declipse.product=org.eclipse.jdt.ls.core.product',
  '-Dlog.protocol=true',
  '-Dlog.level=ALL',
  '-Xms1g',
  '--add-modules=ALL-SYSTEM',
  '--add-opens', 'java.base/java.util=ALL-UNNAMED',
  '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
  '-jar', launcher,
  '-configuration', config,
  '-data', workspace,
}

local jdtls_config = {
  name = 'jdtls',
  cmd = cmd,
  root_dir = vim.fs.root(0, {'gradlew', '.git', 'mvnw'}),
  init_options = {
    bundles = { debug_bundle }
  },
  on_attach = function(client, bufnr)
      require('jdtls').setup_dap{ hotcodereplace = 'auto' }
      require('jdtls.dap').setup_dap_main_class_configs()
  end,
}

jdtls.start_or_attach(jdtls_config)
