require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- ==== DAP (отладка) ====
local dap_status, dap = pcall(require, "dap")
if dap_status then
    -- Запустить / продолжить
    map("n", "<F5>", dap.continue, { desc = "DAP Continue / Start" })
    -- Остановить / завершить сессию
    map("n", "<F6>", dap.terminate, { desc = "DAP Terminate" })
    -- Шаг за шагом
    map("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
    map("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
    map("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })
    -- Точки останова
    map("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
    map("n", "<leader>B", function() 
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) 
    end, { desc = "DAP Set Conditional Breakpoint" })
    -- REPL
    map("n", "<leader>dr", dap.repl.open, { desc = "DAP Open REPL" })
    map("n", "<leader>dl", dap.run_last, { desc = "DAP Run Last" })
end

-- ==== DAP UI ====
local dapui_status, dapui = pcall(require, "dapui")
if dapui_status then
    map("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
end


-- UI FOCUS

vim.keymap.set("n", "<leader>nf", function()
  vim.cmd("NvimTreeFocus")
end, { desc = "Focus on file explorer" })
