require('lualine').setup{
  options = {
    theme = 'tokyonight',
    section_separators = {nil, nil},
    component_separators = {'|', '|'},
  },
  sections = {
    lualine_a = {{
        'mode',
        format = function(value)
          return(string.sub(value, 1, 1))
        end
    }},
    lualine_b = {
      'branch',
      'filename',
      {'diagnostics', sources={'nvim_lsp'}},
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'},
  }
}
