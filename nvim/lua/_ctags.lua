vim.api.nvim_exec(
([[command! Tags !ctags -R -I EXTERN -I INIT --exclude="build*" --exclude=".vim-src/**" --exclude="node_modules/**" --exclude="venv/**"
   --exclude="**/site-packages/**" --exclude="data/**" --exclude="dist/**" --exclude="notebooks/**" --exclude="notebooks/**"
   --exclude="*graphhopper_data/*.json" --exclude="*graphhopper/*.json" --exclude="*.json" --exclude="qgis/**" --exclude=.git
   --exclude=.svn --exclude=.hg --exclude="*.cache.html" --exclude="*.nocache.js" --exclude="*.min.*" --exclude="*.map"
   --exclude="*.swp" --exclude="*.bak" --exclude="*.pyc" --exclude="*.class" --exclude="*.sln" --exclude="*.master" --exclude="*.csproj"
   --exclude="*.csproj.user" --exclude="*.cache" --exclude="*.dll" --exclude="*.pdb" --exclude=tags --exclude="cscope.*" --exclude="*.tar.*"
]]):gsub("\n", ""), '')
