require('lualine').setup{
  options = {
    theme = 'onedark',
    section_separators = {nil, nil},
    component_separators = {nil, nil},
  },
  sections = {
    lualine_a = {{ 
        'mode',
        format = function(value)
          return(string.sub(value, 1, 1))
        end
    }},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  }
}
