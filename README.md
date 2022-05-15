# ddc-nvim-lsp_by-treesitter

nvim-lsp_by-treesitter completion for ddc.vim

## Required

### denops.vim

https://github.com/vim-denops/denops.vim

### ddc.vim

https://github.com/Shougo/ddc.vim

### nvim-treesitter

https://github.com/nvim-treesitter/nvim-treesitter

### neovim 0.7.0+ with nvim-lsp and nvim-treesitter configuration

## Configuration

```vim
call ddc#custom#patch_global('sources', ['nvim-lsp_by-treesitter'])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': { 'matchers': ['matcher_head'] },
      \ 'nvim-lsp_by-treesitter': {
      \   'mark': 'lsp',
      \ })

" Use Customized labels
call ddc#custom#patch_global('sourceParams', {
      \ 'nvim-lsp_by-treesitter': { 'kindLabels': { 'Class': 'c' } },
      \ })
```

## Original code

It based on [deoplete-lsp](https://github.com/deoplete-plugins/deoplete-lsp)
