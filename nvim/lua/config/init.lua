-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local core = autoload("nfnl.core")
nvim.ex.set("nowrap")
do
  local options = {backup = true, termguicolors = true, colorcolumn = "80", splitbelow = true, splitright = true, completeopt = "menuone,noselect", inccommand = "nosplit", ignorecase = true, smartcase = true, signcolumn = "yes", undofile = true, undodir = vim.fn.expand("~/.undodir"), confirm = true, breakindent = true, list = true, clipboard = "unnamedplus", scrolloff = 3, number = true, relativenumber = true, swapfile = false}
  for option, value in pairs(options) do
    core.assoc(nvim.o, option, value)
  end
end
nvim.ex.autocmd("FileType", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
nvim.ex.let("neoterm_autoinsert=1")
nvim.ex.autocmd("FileType", "qf", "wincmd J")
vim.cmd("autocmd BufNewFile,BufRead *.phel set syntax=clojure")
do end (vim.opt.backupdir):remove(".")
vim.opt.listchars = {tab = "\226\150\184 ", trail = "\194\183"}
nvim.set_keymap("n", "<space>", "<nop>", {noremap = true})
local function split_string_by_line(str)
  local words = {}
  for line in string.gmatch(str, "([^\n]*)\n?") do
    if (string.len(line) ~= 0) then
      table.insert(words, line)
    else
    end
  end
  return words
end
local function remove_all_spaces(str)
  return tostring(string.gsub(str, "%s+", ""))
end
local function nbb_script(script, args)
  local scripts_dir = (os.getenv("HOME") .. "/dotfiles/scripts/nbbs/")
  return remove_all_spaces(vim.fn.system(("nbb " .. scripts_dir .. script .. ".cljs " .. args)))
end
local function nbb_script_spaces(script, args)
  local scripts_dir = (os.getenv("HOME") .. "/dotfiles/scripts/nbbs/")
  return vim.fn.system(("nbb " .. scripts_dir .. script .. ".cljs " .. args))
end
local function node_script(script, args)
  local scripts_dir = (os.getenv("HOME") .. "/dotfiles/scripts/")
  return remove_all_spaces(vim.fn.system(("node " .. scripts_dir .. script .. args)))
end
local function replace_pixel_rem()
  local current_word = vim.call("expand", "<cword>")
  local replacement = nbb_script("pixel_to_rem", tostring(current_word))
  return vim.cmd(("normal! diwi" .. replacement))
end
local function replace_rem_pixel()
  local current_word = vim.call("expand", "<cword>")
  local replacement = nbb_script("rem_to_pixel", tostring(current_word))
  return vim.cmd(("normal! diwi" .. replacement))
end
local function replace_hex_rgb()
  local current_word = vim.call("expand", "<cword>")
  local replacement = nbb_script("hex_to_rgb", ("\"" .. tostring(current_word) .. "\""))
  return vim.cmd(("normal! diwi" .. replacement))
end
local function replace_rgb_hex()
  local current_word = vim.call("expand", "<cWORD>")
  local replacement = nbb_script("rgb_to_hex", ("\"" .. tostring(current_word) .. "\""))
  return vim.cmd(("normal! diWi" .. replacement))
end
local function tailwind_colors(arg)
  local current_word = vim.call("expand", "<cWORD>")
  local replacement = node_script("tw-colors/index.mjs", (" " .. arg .. " " .. "\"" .. tostring(current_word) .. "\""))
  return vim.cmd(("normal! diWi" .. replacement))
end
local function tailwind_class_to_hex()
  return tailwind_colors("ch")
end
local function tailwind_hex_to_class()
  return tailwind_colors("hc")
end
local function system_os()
  return vim.loop.os_uname().sysname
end
local function insert_optimised_svg(file_name, id)
  local function _3_()
    if id then
      return nbb_script_spaces("svg_to_symbol", (os.getenv("HOME") .. "/Downloads/" .. file_name .. id))
    else
      return nbb_script_spaces("svg_to_symbol", (os.getenv("HOME") .. "/Downloads/" .. file_name))
    end
  end
  return vim.api.nvim_buf_set_lines(0, -1, -1, false, split_string_by_line(_3_()))
end
local function set_key(key, action, noremap, _3fmode)
  return nvim.set_keymap((_3fmode or "n"), key, action, {noremap = noremap})
end
local function set_uc(name, command, _3fopts)
  return vim.api.nvim_create_user_command(name, command, (_3fopts or {bang = false}))
end
local function getcwf()
  return tostring(string.gsub(vim.fn.getcwd(), os.getenv("HOME"), ""))
end
local function cmdtc(cmd)
  return vim.cmd(vim.api.nvim_replace_termcodes(("normal " .. cmd), true, true, true))
end
vim.o.timeoutlen = 500
set_key("<space>", "<nop>")
nvim.g.mapleader = " "
nvim.g.maplocalleader = ","
set_key("<S-Up>", "<C-w>+", true)
set_key("<S-Down>", "<C-w>-", true)
set_key("<S-Right>", "<C-w>>", true)
set_key("<S-Left>", "<C-w><", true)
set_key("<Esc>", "<C-\\><C-n>", false, "t")
set_key("<C-R>", "<C-R>", false)
local function _4_(opts)
  return vim.cmd(("1T bb nrepl-server " .. opts.args))
end
set_uc("BbRepl", _4_, {nargs = "?"})
local function _5_(opts)
  return vim.cmd(("1T nbb nrepl-server :port " .. opts.args))
end
set_uc("NbbRepl", _5_, {nargs = "?"})
local function _6_()
  return vim.cmd("1T npm run shadow:watch")
end
set_uc("NPMShadowWatch", _6_)
local function _7_()
  return vim.cmd("1T npm run shadow:release")
end
set_uc("NPMShadowRelease", _7_)
local function _8_()
  return vim.cmd("2T npm run tailwind:watch")
end
set_uc("NPMTailwindWatch", _8_)
local function _9_()
  return vim.cmd("2T npm run tailwind:release")
end
set_uc("NPMTailwindRelease", _9_)
local function _10_()
  return vim.cmd("1T npm run watch")
end
set_uc("NPMRunWatch", _10_)
local function _11_()
  return vim.cmd("1T npm run prod")
end
set_uc("NPMRunProd", _11_)
local function _12_()
  return vim.cmd("1T clj -A:dev")
end
set_uc("ClojureStartRepl", _12_)
local function _13_()
  vim.cmd("w")
  return vim.cmd("3T npx squint %")
end
set_uc("Sq", _13_)
local function _14_()
  vim.cmd("w")
  return vim.cmd("3T npx squint compile **/*.cljs")
end
set_uc("Sqall", _14_)
local function _15_()
  return vim.cmd("3T bb mjs_to_js.clj ./pages")
end
set_uc("Sqr", _15_)
local function _16_()
  vim.cmd("w")
  return vim.cmd(("ConjureEval (clerk/show! \"" .. ("notebooks/" .. vim.fn.expand("%:t")) .. "\")"))
end
set_uc("ClerkShow", _16_)
local function _17_()
  return vim.cmd(("3T javac " .. vim.fn.expand("%:t")))
end
set_uc("Jac", _17_)
local function _18_()
  return vim.cmd(("3T java " .. vim.fn.expand("%:t:r")))
end
set_uc("Jar", _18_)
local function _19_()
  return vim.cmd("3T clj -M:cljfmt %")
end
set_uc("Cljfmt", _19_)
local function _20_()
  return vim.cmd("2T vendor/bin/phel run %")
end
set_uc("Phr", _20_)
local function _21_()
  vim.cmd("normal mZ")
  vim.cmd("1Topen")
  vim.cmd("normal mA")
  vim.cmd("2Topen")
  vim.cmd("normal mB")
  vim.cmd("3Topen")
  vim.cmd("normal mC")
  vim.cmd("4Topen")
  vim.cmd("normal mD")
  vim.cmd("normal 'Z")
  return vim.cmd("stopinsert")
end
set_uc("Nter", _21_)
local function _22_()
  vim.cmd(":%s/export //g")
  return vim.cmd(":w")
end
set_uc("JSRemoveExport", _22_)
local function _23_()
  vim.cmd(":%s/const/var/g")
  return vim.cmd(":w")
end
set_uc("JSReplaceConstWithVar", _23_)
local function _24_()
  vim.cmd(":%s/let")
  return vim.cmd(":w")
end
set_uc("JSRemoveLet", _24_)
local function _25_()
  vim.cmd("w")
  vim.cmd(":e index.html")
  vim.cmd(":w")
  return vim.cmd(":b #")
end
set_uc("SaveIndexAndReturn", _25_)
local function _26_()
  vim.cmd(":w")
  vim.cmd(("2T pint " .. vim.fn.expand("%:p")))
  vim.cmd(":sleep 300m")
  return vim.cmd(":e %")
end
set_uc("Pint", _26_)
local function _27_()
  local file = assert(io.open((os.getenv("HOME") .. "/neotes/all/01-checklists/dev-testing.md")))
  local lines = split_string_by_line(file:read("*a"))
  file:close()
  return vim.api.nvim_buf_set_lines(0, -1, -1, false, lines)
end
set_uc("ChTest", _27_)
local function _28_()
  local file = assert(io.open((os.getenv("HOME") .. "/neotes/all/01-checklists/trello-template.md")))
  local lines = split_string_by_line(file:read("*a"))
  file:close()
  return vim.api.nvim_buf_set_lines(0, -1, -1, false, lines)
end
set_uc("ChTrello", _28_)
local function _29_()
  local file = assert(io.open((os.getenv("HOME") .. "/neotes/all/01-checklists/ab-testing.md")))
  local lines = split_string_by_line(file:read("*a"))
  file:close()
  return vim.api.nvim_buf_set_lines(0, -1, -1, false, lines)
end
set_uc("AbTest", _29_)
local function _30_()
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/none/vim-sexp-key-bindings.md"))
end
set_uc("VimSexpKeyBindings", _30_)
local function _31_()
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/none/20230411-vim-sexp-mappings.md"))
end
set_uc("VimSexpKeyMappings", _31_)
local function _32_()
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/none/20230722-vim-surround.md"))
end
set_uc("VimSurroundKeyMappings", _32_)
local function _33_(opts)
  return __fnl_global__ag_2doutside_2dcwd("/dotfiles/nvim", opts.args)
end
set_uc("Sv", _33_, {nargs = "?"})
local function _34_(opts)
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/none/" .. os.date("!%Y%m%d-") .. opts.args))
end
set_uc("Note", _34_, {nargs = "?"})
local function _35_(opts)
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/all/" .. os.date("!%Y%m%d-") .. opts.args))
end
set_uc("Notee", _35_, {nargs = "?"})
local function _36_(opts)
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/home/" .. os.date("!%Y%m%d-") .. opts.args))
end
set_uc("Noteh", _36_, {nargs = "?"})
local function _37_(opts)
  local current_dir = vim.fn.getcwd()
  return __fnl_global__ag_2doutside_2dcwd("/neotes", opts.args)
end
set_uc("Sn", _37_, {nargs = "?"})
local function _38_(opts)
  local current_dir = vim.fn.getcwd()
  return vim.cmd((":3T cd ~/neotes && bb scripts/encrypt.clj " .. opts.args .. " && cd " .. current_dir))
end
set_uc("EncryptNotes", _38_, {nargs = "?"})
local function _39_(opts)
  local current_dir = vim.fn.getcwd()
  return vim.cmd((":3T cd ~/neotes && bb scripts/decrypt.clj " .. opts.args .. " && cd " .. current_dir))
end
set_uc("DecryptNotes", _39_, {nargs = "?"})
local function _40_()
  vim.cmd("tabe")
  return vim.cmd("cope")
end
set_uc("Qtc", _40_)
local function _41_()
  return replace_pixel_rem()
end
set_uc("PixelToRem", _41_)
local function _42_()
  return replace_rem_pixel()
end
set_uc("RemToPixel", _42_)
local function _43_()
  return replace_hex_rgb()
end
set_uc("HexToRgb", _43_)
local function _44_()
  vim.cmd("normal dt(r[f)r]^")
  vim.cmd("normal f xf x")
  return replace_rgb_hex()
end
set_uc("RgbToHex", _44_)
local function _45_()
  return tailwind_hex_to_class()
end
set_uc("TailwindHexToClass", _45_)
local function _46_()
  return tailwind_class_to_hex()
end
set_uc("TailwindClassToHex", _46_)
local function _47_(opts)
  return insert_optimised_svg(opts.args)
end
set_uc("Svg", _47_, {nargs = "?"})
local function _48_()
  cmdtc("<C-W>j")
  vim.cmd("resize 10")
  return cmdtc("<C-W>k")
end
set_uc("Resize10", _48_)
local function _49_()
  vim.cmd("sp")
  vim.cmd("normal 'C")
  vim.cmd("resize 10")
  return cmdtc("<C-w>k")
end
set_uc("Rsp", _49_, {nargs = "?"})
local function _50_(opts)
  if (opts.args ~= "block") then
    cmdtc("<Plug>(neoterm-repl-send-line)")
  else
  end
  vim.cmd("sleep 100ms")
  cmdtc("<C-w>j")
  vim.cmd("normal G")
  vim.cmd("normal k")
  if (opts.args == "block") then
    vim.cmd("normal V%y")
  else
    vim.cmd("normal yy")
  end
  cmdtc("<C-w>k")
  vim.cmd("normal p")
  if (opts.args == "block") then
    vim.cmd("normal V%gc")
  else
    vim.cmd("normal gcc")
  end
  cmdtc("<C-w>j")
  vim.cmd("normal G")
  return cmdtc("<C-w>k")
end
set_uc("Rspa", _50_, {nargs = "?"})
local function _54_()
  local path = vim.api.nvim_buf_get_name(0)
  local directory = str.join("/", core.butlast(str.split(path, "/")))
  if (system_os() == "Linux") then
    return os.execute(("xdg-open " .. directory))
  else
    return os.execute(("open -R " .. directory))
  end
end
set_uc("Open", _54_)
return {}
