return {
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false,
    ft = { "rust" },
    config = function()
      local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/")
      
      if mason_path ~= "" and vim.fn.isdirectory(mason_path) == 1 then
        local codelldb_path = mason_path .. "adapter/codelldb"
        local liblldb_path = mason_path .. "lldb/lib/liblldb.so"
        
        if vim.fn.executable(codelldb_path) == 1 and vim.fn.filereadable(liblldb_path) == 1 then
          local cfg = require('rustaceanvim.config')
          vim.g.rustaceanvim = {
            dap = {
              adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
            },
          }
        else
          vim.g.rustaceanvim = {}
          vim.notify("codelldb files not found. Make sure codelldb is properly installed.", vim.log.levels.WARN)
        end
      else
        vim.g.rustaceanvim = {}
        vim.notify("codelldb not found. Install with :MasonInstall codelldb for debugging support", vim.log.levels.WARN)
      end
    end,
  }
}
