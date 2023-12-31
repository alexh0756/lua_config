-- fetch the dap plugin
local dap = require('dap')
-- setup DapUI
local dapui = require('dapui')
dapui.setup()


file = '.config/python.txt'
require('utils')
local config_file = getScriptDir(debug.getinfo(1).source)
local configPath = config_file .. file
print(configPath)
local config_data = lines_from(configPath)
print(config_file)
print(config_data)
local pythonPath = config_data[1]
local launchJSON = config_data[2]
print(pythonPath, launchJSON)


-- Dap fires events before and after, trigger dap UI when we see them
dap.listeners.after.event_initialized['dapui_config'] = function()
	dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
	dapui.close()
end
dap.listeners.before.event_exiting['dapui_config'] = function()
	dapui.close()
end

local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})


dap.adapters.delve = {
	type = 'server',
	port = '${port}',
	executable = {
		command = 'dlv',
		args = {'dap', '-l', '127.0.0.1:${port}'},
	}
}

dap.configurations.go = {
	{
		type = 'delve',
		name = 'debug',
		request = 'launch',
		program = '${file}'
	},{
		type = 'delve',
		name = 'debug tests',
		request = 'launch', 
		mode = 'test',
		program = '${file}'
	}
}

dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      command = pythonPath,
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

print('launch conditional state', launchJSON)
print('launch true', launchJSON=='true')
print('launch false', launchJSON=='false')


if launchJSON == 'true' then
	print('launch is true')	
else
	dap.configurations.python = {
	  {
	    -- The first three options are required by nvim-dap
	    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
	    request = 'launch';
	    name = "Launch file";
	
	    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
	
	    program = "${file}"; -- This configuration will launch the current file if used.
	    pythonPath = function()
	      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
	      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
	      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
	      local cwd = vim.fn.getcwd()
	      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
	        return cwd .. '/venv/bin/python'
	      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
	        return cwd .. '/.venv/bin/python'
	      else
	        return '/usr/bin/python3'
	      end
	    end;
	  },
	}
	print('launch is false')
end
