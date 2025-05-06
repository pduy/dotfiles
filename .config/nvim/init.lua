vim.cmd([[
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath=&runtimepath
  source ~/.vimrc
]])
if vim.g.vscode then
  ---- VSCode extension
else
  ---- ordinary Neovim
end
