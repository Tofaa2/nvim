return {

{
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function ()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = { 
[[                                                                    ]],
[[                                                                    ]],
[[ ________           ______             __     __  __                ]],
[[|        \         /      \           |  \   |  \|  \               ]],
[[ \$$$$$$$$______  |  $$$$$$\ __    __ | $$   | $$ \$$ ______ ____   ]],
[[   | $$  /      \ | $$_  \$$|  \  |  \| $$   | $$|  \|      \    \  ]],
[[   | $$ |  $$$$$$\| $$ \    | $$  | $$ \$$\ /  $$| $$| $$$$$$\$$$$\ ]],
[[   | $$ | $$  | $$| $$$$    | $$  | $$  \$$\  $$ | $$| $$ | $$ | $$ ]],
[[   | $$ | $$__/ $$| $$      | $$__/ $$   \$$ $$  | $$| $$ | $$ | $$ ]],
[[   | $$  \$$    $$| $$       \$$    $$    \$$$   | $$| $$ | $$ | $$ ]], 
[[    \$$   \$$$$$$  \$$        \$$$$$$      \$     \$$ \$$  \$$  \$$ ]],
[[                                                                    ]],
[[                                                                    ]]

      }

      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
};

}
