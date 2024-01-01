function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end

-- print all line numbers and their contents
-- for k,v in pairs(lines) do
--   print('line[' .. k .. ']', v)
-- end



function string.cut(s,pattern)
  if pattern == nil then pattern = " " end
  local cutstring = {}
  local i1 = 0
  repeat
    i2 = nil
    local i2 = string.find(s,pattern,i1+1)
    if i2 == nil then i2 = string.len(s)+1 end
    table.insert(cutstring,string.sub(s,i1+1,i2-1))
    i1 = i2
  until i2 == string.len(s)+1
  return cutstring
end

function getScriptDir(source)
  if source == nil then
    source = debug.getinfo(1).source
  end
  local pwd1 = (io.popen("echo %cd%"):read("*l")):gsub("\\","/")
  local pwd2 = source:sub(2):gsub("\\","/")
  local pwd = ""
  if pwd2:sub(2,3) == ":/" then
    pwd = pwd2:sub(1,pwd2:find("[^/]*%.lua")-1)
  else
    local path1 = string.cut(pwd1:sub(4),"/")
    local path2 = string.cut(pwd2,"/")
    for i = 1,#path2-1 do
      if path2[i] == ".." then
        table.remove(path1)
      else
        table.insert(path1,path2[i])
      end
    end
    for i = 2,#path1 do
      pwd = pwd..path1[i].."/"
    end
  end
  return pwd
end


local function add_line(line)
  local lnum = vim.fn.line('$')
  line = string.gsub(line, "\n", "")
  vim.api.nvim_buf_set_lines(0, lnum - 1, lnum, true, {'dap> ' .. line})
  vim.cmd('startinsert!')
end

vim.keymap.set('n', '<leader>pp', function() add_line(vim.fn.getreg('"')) end, {buffer = 0})

-- function to allow for sending commands straight to repl
-- function send_to_repl(line)

-- vim.keymap.set('n', '<leader>e', function() require('dap').repl.execute(vim.fn.getreg('"')) end)
vim.api.nvim_set_keymap('v', '<leader>e', [[:lua require('dap').repl.execute(vim.fn.getreg('"') <CR> <leader>dri]], {}) 
vim.api.nvim_set_keymap('n', '<leader>e', [[:lua require('dap').repl.execute(vim.fn.getreg('"')]], {}) 


local BinaryFormat = package.cpath:match("%p[\\|/]?%p(%a+)")
if BinaryFormat == "dll" then
    function os.name()
        return "Windows"
    end
elseif BinaryFormat == "so" then
    function os.name()
        return "Linux"
    end
elseif BinaryFormat == "dylib" then
    function os.name()
        return "MacOS"
    end
end
BinaryFormat = nil

print(os.name())
