local opt = vim.opt

-- set relative numbers
opt.relativenumber = true
opt.number = true

-- set tabs to 2 spaces
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- wraps text to false
opt.wrap = false

-- ignore cases when searching match
opt.ignorecase = true
opt.smartcase = true

-- show cursor line
opt.cursorline = true
opt.signcolumn = "yes"

-- use OS clipboard as default
opt.clipboard:append("unnamedplus")

-- treat some-word as one word
opt.iskeyword:append("-")
