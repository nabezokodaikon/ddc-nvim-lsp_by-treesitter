local utils = require('nvim-treesitter.ts_utils')
local parsers = require('nvim-treesitter.parsers')

local M =  {}

function M.get_delimities()
  local start_row, start_col, end_row, end_col = utils.get_node_at_cursor():range()
  local bufnr = vim.api.nvim_get_current_buf()
  local lang = parsers.get_buf_lang(bufnr)
  local query = vim.treesitter.query.get_query(lang, 'highlights')
  local parent_node = utils.get_node_at_cursor()

  local tbl = {}
  for _, match, metadata in query:iter_matches(parent_node, 0, start_row, end_row) do
      for id, node in pairs(match) do
          local character_type = query.captures[id]
          if character_type == 'punctuation.delimiter' then
              local word = vim.treesitter.query.get_node_text(node, bufnr)
              table.insert(tbl, word)
          end
      end
  end

  return tbl
end

return M
