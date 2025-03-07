﻿vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap -- for conciseness

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- replace current word on
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current word" })

-- scroll in middle
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("x", "p", "\"_dP")

-- move selected liens up or down 
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<leader>on", function()
  if vim.fn.bufname('%') == '' and vim.fn.line('$') == 1 and vim.fn.getline(1) == '' then
    local title = vim.fn.input("Enter note title: ")
    if title == "" then
      print("Title cannot be empty!")
      return
    end

    local dir = vim.fn.expand("~/notes/0 - Inbox/")
    local filename = dir .. title .. ".md"

    vim.fn.mkdir(dir, "p")

    vim.cmd("edit " .. filename)

    vim.cmd("write")
  end

  local original_cwd = vim.fn.getcwd()

  vim.cmd("cd ~/notes")

  vim.cmd(":ObsidianTemplate note")

  vim.cmd("cd " .. original_cwd)
end, { desc = "Create Obsidian note with template" })


-- Bold: position cursor between **
vim.keymap.set('v', '<leader>b', 'c****<Esc>hhp')

-- Italic: position cursor between *
vim.keymap.set('v', '<leader>i', 'c**<Esc>hp')

-- Both: position cursor between ***
vim.keymap.set('v', '<leader>bi', 'c******<Esc>hhhp')


-- Search for files in notes
vim.keymap.set("n", "<leader>os", ":Telescope find_files search_dirs={\"/home/adam/notes\"}<cr>", {desc = "find notes files"})
vim.keymap.set("n", "<leader>oz", ":Telescope live_grep search_dirs={\"/home/adam/notes\"}<cr>", {desc = "grep notes"})
