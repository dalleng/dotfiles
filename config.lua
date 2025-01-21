-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- change the leader
lvim.leader = ","
-- Use jj to leave insert mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true})

-- Bring gt and gT to switch tabs
lvim.keys.normal_mode["gt"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["gT"] = ":BufferLineCyclePrev<CR>"

-- Use the spacebar to clear highlights
vim.api.nvim_set_keymap('n', '<Space>', ':nohlsearch<Bar>:echo<CR>', { noremap = true, silent = true })

-- Stop the LSP client for .env files
require("lspconfig").bashls.setup({
  on_attach = function(client, bufnr)
    if vim.fn.expand("%:t") == ".env" then
      client.stop()
    else
      require("lvim.lsp").common_on_attach(client, bufnr)
    end
  end,
})
