local conf = require('vscode.config')

local M = {
    { 'phaazon/hop.nvim', branch = 'v2', cmd = { 'HopWord', 'HopLine', 'HopChar1', 'HopChar2' },
        config = conf.hop }
}

return M