return {
  "junegunn/fzf.vim",
  dependencies = { "junegunn/fzf" },
  config = function()
    vim.cmd('let $FZF_DEFAULT_COMMAND="rg --files --hidden"')

    vim.cmd(
      "let g:rg_command = \"rg --column --line-number --no-heading --ignore-case --hidden --follow --glob '!{.git/*,node_modules/*, sorbet/*}' --color 'always' \""
    )
    vim.cmd(
      "command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%'), <bang>0)"
    )
  end,
  keys = {
    { "<leader>p", "<cmd>Files<cr>", desc = "Find Files (root dir)" },
  },
}
