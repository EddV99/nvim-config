local colors = {
  bg  = '#100f0f',
  bg2 = '#1c1b1a',
  ui  = '#282726',
  ui2 = '#343331',
  ui3 = '#403e3c',
  tx3 = '#575653',
  tx2 = '#878580',
  tx  = '#cecdc3',
  re  = '#d14d41',
  ora = '#da702c',
  ye  = '#d0a215',
  gr  = '#879a39',
  cy  = '#3aa99f',
  bl  = '#4385be',
  pu  = '#8b7ec8',
  ma  = '#ce5d97',
}

return {
  normal = {
    a = {bg = colors.gr, fg = colors.bg, gui = 'bold'},
    b = {bg = colors.ui3, fg = colors.tx},
    c = {bg = colors.ui, fg = colors.tx3}
  },
  insert = {
    a = {bg = colors.pu, fg = colors.bg, gui = 'bold'},
    b = {bg = colors.ui3, fg = colors.tx},
    c = {bg = colors.ui, fg = colors.tx3}
  },
  visual = {
    a = {bg = colors.ye, fg = colors.bg, gui = 'bold'},
    b = {bg = colors.ui3, fg = colors.tx},
    c = {bg = colors.ui, fg = colors.tx3}
  },
  replace = {
    a = {bg = colors.cy, fg = colors.bg, gui = 'bold'},
    b = {bg = colors.ui3, fg = colors.tx},
    c = {bg = colors.ui, fg = colors.tx3}
  },
  command = {
    a = {bg = colors.re, fg = colors.bg, gui = 'bold'},
    b = {bg = colors.ui3, fg = colors.tx},
    c = {bg = colors.ui, fg = colors.tx3}
  },
  inactive = {
    a = {bg = colors.ma, fg = colors.bg, gui = 'bold'},
    b = {bg = colors.ui3, fg = colors.tx},
    c = {bg = colors.ui, fg = colors.tx3}
  }
}
