local api = vim.api

local command = 'command! Tags !ctags -R -I EXTERN -I INIT'
command = command .. ' ' .. '--exclude=.git --exclude=.svn --exclude=.hg'
command = command .. ' ' .. '--exclude=.github --exclude=.circleci --exclude="*.swp"'
command = command .. ' ' .. '--exclude="build/**" --exclude="**/build/**" --exclude="db/**" --exclude="doc/**"'
command = command .. ' ' .. '--exclude="log/**" --exclude="tmp/**" --exclude="vendor/**"'
command = command .. ' ' .. '--exclude="*.json" --exclude="*.lock" --exclude="*.md"'
command = command .. ' ' .. '--exclude="*.yml" --exclude="*.rdb" --exclude="*.log"'
command = command .. ' ' .. '--exclude="*.dump" --exclude="*.pdb" --exclude="*.dll"'
command = command .. ' ' .. '--exclude="*.pyc" --exclude="*.class" --exclude="*.o"'
command = command .. ' ' .. '--exclude=tags --exclude="cscope.*" --exclude="*.cache"'
command = command .. ' ' .. '--exclude="*.csproj" --exclude="*.csproj.user" --exclude="*.bak"'
command = command .. ' ' .. '--exclude="assets/**" --exclude="**/assets/**" --exclude="*.min.*" --exclude="*images*"'
command = command .. ' ' .. '--exclude="dist/**" --exclude="notebooks/**" --exclude="qgis/**"'

api.nvim_exec(command, '')
