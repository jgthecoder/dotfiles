local opts = { silent = true, noremap = true }

-- Window navigation
vim.keymap.set("n", "<C-h>", ":wincmd h<cr>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<cr>", opts)
vim.keymap.set("n", "<C-k>", ":wincmd k<cr>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<cr>", opts)

vim.keymap.set("n", "<tab>", ":bn<cr>", opts)
vim.keymap.set("n", "<s-tab>", ":bprev<cr>", opts)

-- Make life easier
vim.keymap.set("n", "<leader>w", "<cmd>up<cr>")
vim.keymap.set("n", ";", ":")
vim.keymap.set("i", "jk", "<esc>")

-- Move lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quick source
vim.keymap.set("n", "<leader>o", "<cmd>update<cr> <cmd>source<cr>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- better indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Centering
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("x", "p", '"_dp')
vim.keymap.set("x", "P", '"_dP')

vim.keymap.set("n", "<leader>rc", function()
  local file_name = vim.api.nvim_buf_get_name(0)
  local file_type = vim.bo.filetype

  if file_type == "lua" then
    -- Run the LUA file in the terminal
    vim.cmd("terminal lua " .. vim.fn.fnameescape(file_name))
  elseif file_type == "c" then
    -- Compile and run the C file in the terminal
    vim.cmd("terminal gcc " .. vim.fn.fnameescape(file_name) .. " -o result; ./result")
  elseif file_type == "cpp" then
    -- Compile and run the CPP file in the terminal
    vim.cmd("terminal g++ " .. vim.fn.fnameescape(file_name) .. " -o result; ./result")
  elseif file_type == "python" then
    -- Compile and run the PYHTON file in the terminal
    vim.cmd("terminal python3 " .. file_name)
  elseif file_type == "go" then
    -- Compile and run the PYHTON file in the terminal
    vim.cmd("terminal go run " .. file_name)
  elseif file_type == "rust" then
    -- vim.cmd("rustc " .. file_name .. ";./" .. vim.fn.expand("%:t"))
    vim.cmd "terminal cargo run"

    -- 	local output_name = vim.fs.basename(file_name):gsub("%.rs$", "")
    -- 	vim.fn.jobstart("rustc " .. file_name, {
    -- 		on_exit = function(_, exit_code)
    -- 			if exit_code == 0 then
    -- 				-- Open a new terminal split and run the compiled binary
    -- 				vim.cmd("split | terminal ./" .. output_name)
    -- 			else
    -- 				print("Compilation failed")
    -- 			end
    -- 		end,
    -- 	})
  end -- Compile Rust file
end, { desc = "Run Code" })

---@diagnostic disable-next-line: unused-local
local job_id = 0
vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 10)

  ---@diagnostic disable-next-line: unused-local
  job_id = vim.bo.channel
end, { desc = "Small terminal" })

-- Enter normal mode in terminal
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", opts)

vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostics in float" })
