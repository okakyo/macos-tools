vim.g.dashboard_defualt_executive = 'true'


local home = os.getenv('HOME')
local db = require('dashboard')

db.preview_file_height = 12
db.preview_file_width = 80

db.custom_header = {
'                    .                    ',
'    ##############..... ##############   ',
'    ##############......##############   ',
'      ##########..........##########     ',
'      ##########........##########       ',
'      ##########.......##########        ',
'      ##########.....##########..        ',
'      ##########....##########.....      ',
'    ..##########..##########.........    ',
'  ....##########.#########.............  ',
'    ..################JJJ............    ',
'      ################.............      ',
'      ##############.JJJ.JJJJJJJJJJ      ',
'      ############...JJ...JJ..JJ  JJ     ',
'      ##########....JJ...JJ..JJ  JJ      ',
'      ########......JJJ..JJJ JJJ JJJ     ',
'      ######    .........                ',
'                  .....                  ',
'                    .                    '
  }


db.custom_center = {
  {icon = '  ',
  desc = 'Find  File                              ',
  action = 'Telescope find_files find_command=rg,--hidden,--files',
  shortcut = 'SPC f f'},
  {icon = '  ',
  desc ='Open Browser                            ',
  action =  'Fern . -reveal=% -drawer -toggle -width=40',
  shortcut = 'CTR n'},
  {icon = '  ',
  desc = 'Find  word                              ',
  action = 'Telescope live_grep',
  shortcut = 'SPC f w'},
  {icon = '  ',
  desc = 'Open Personal dotfiles                  ',
  action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
  shortcut = 'SPC f d'},
}
