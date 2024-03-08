-- [nfnl] Compiled from fnl/config/usercommand.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local util = autoload("config.util")
local function _2_(opts)
  return vim.cmd(("1T bb nrepl-server " .. opts.args))
end
util["set-uc"]("BbRepl", _2_, {nargs = "?"})
local function _3_(opts)
  return vim.cmd(("1T nbb nrepl-server :port " .. opts.args))
end
util["set-uc"]("NbbRepl", _3_, {nargs = "?"})
local function _4_()
  return vim.cmd("1T npm run shadow:watch")
end
util["set-uc"]("NPMShadowWatch", _4_)
local function _5_()
  return vim.cmd("1T npm run shadow:release")
end
util["set-uc"]("NPMShadowRelease", _5_)
local function _6_()
  return vim.cmd("2T npm run tailwind:watch")
end
util["set-uc"]("NPMTailwindWatch", _6_)
local function _7_()
  return vim.cmd("2T npm run tailwind:release")
end
util["set-uc"]("NPMTailwindRelease", _7_)
local function _8_()
  return vim.cmd("1T npm run watch")
end
util["set-uc"]("NPMRunWatch", _8_)
local function _9_()
  return vim.cmd("1T npm run prod")
end
util["set-uc"]("NPMRunProd", _9_)
local function _10_()
  return vim.cmd("1T clj -A:dev")
end
util["set-uc"]("ClojureStartRepl", _10_)
local function _11_()
  vim.cmd("w")
  return vim.cmd("3T npx squint %")
end
util["set-uc"]("Sq", _11_)
local function _12_()
  vim.cmd("w")
  return vim.cmd("3T npx squint compile **/*.cljs")
end
util["set-uc"]("Sqall", _12_)
local function _13_()
  return vim.cmd("3T bb mjs_to_js.clj ./pages")
end
util["set-uc"]("Sqr", _13_)
local function _14_()
  vim.cmd("w")
  return vim.cmd(("ConjureEval (clerk/show! \"" .. ("notebooks/" .. vim.fn.expand("%:t")) .. "\")"))
end
util["set-uc"]("ClerkShow", _14_)
local function _15_()
  return vim.cmd(("3T javac " .. vim.fn.expand("%:t")))
end
util["set-uc"]("Jac", _15_)
local function _16_()
  return vim.cmd(("3T java " .. vim.fn.expand("%:t:r")))
end
util["set-uc"]("Jar", _16_)
local function _17_()
  return vim.cmd("3T clj -M:cljfmt %")
end
util["set-uc"]("Cljfmt", _17_)
local function _18_()
  return vim.cmd("2T vendor/bin/phel run %")
end
util["set-uc"]("Phr", _18_)
local function _19_()
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
util["set-uc"]("Nter", _19_)
local function _20_()
  vim.cmd(":%s/export //g")
  return vim.cmd(":w")
end
util["set-uc"]("JSRemoveExport", _20_)
local function _21_()
  vim.cmd(":%s/const/var/g")
  return vim.cmd(":w")
end
util["set-uc"]("JSReplaceConstWithVar", _21_)
local function _22_()
  vim.cmd(":%s/let")
  return vim.cmd(":w")
end
util["set-uc"]("JSRemoveLet", _22_)
local function _23_()
  vim.cmd("w")
  vim.cmd(":e index.html")
  vim.cmd(":w")
  return vim.cmd(":b #")
end
util["set-uc"]("SaveIndexAndReturn", _23_)
local function _24_()
  vim.cmd(":w")
  vim.cmd(("2T pint " .. vim.fn.expand("%:p")))
  vim.cmd(":sleep 300m")
  return vim.cmd(":e %")
end
util["set-uc"]("Pint", _24_)
local function _25_()
  local file = assert(io.open((os.getenv("HOME") .. "/neotes/all/01-checklists/dev-testing.md")))
  local lines = util["split-string-by-line"](file:read("*a"))
  file:close()
  return vim.api.nvim_buf_set_lines(0, -1, -1, false, lines)
end
util["set-uc"]("ChTest", _25_)
local function _26_()
  local file = assert(io.open((os.getenv("HOME") .. "/neotes/all/01-checklists/trello-template.md")))
  local lines = util["split-string-by-line"](file:read("*a"))
  file:close()
  return vim.api.nvim_buf_set_lines(0, -1, -1, false, lines)
end
util["set-uc"]("ChTrello", _26_)
local function _27_()
  local file = assert(io.open((os.getenv("HOME") .. "/neotes/all/01-checklists/ab-testing.md")))
  local lines = util["split-string-by-line"](file:read("*a"))
  file:close()
  return vim.api.nvim_buf_set_lines(0, -1, -1, false, lines)
end
util["set-uc"]("AbTest", _27_)
local function _28_()
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/none/vim-sexp-key-bindings.md"))
end
util["set-uc"]("VimSexpKeyBindings", _28_)
local function _29_()
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/none/20230411-vim-sexp-mappings.md"))
end
util["set-uc"]("VimSexpKeyMappings", _29_)
local function _30_()
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/none/20230722-vim-surround.md"))
end
util["set-uc"]("VimSurroundKeyMappings", _30_)
local function _31_(opts)
  return __fnl_global__ag_2doutside_2dcwd("/dotfiles/nvim", opts.args)
end
util["set-uc"]("Sv", _31_, {nargs = "?"})
local function _32_(opts)
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/none/" .. os.date("!%Y%m%d-") .. opts.args))
end
util["set-uc"]("Note", _32_, {nargs = "?"})
local function _33_(opts)
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/all/" .. os.date("!%Y%m%d-") .. opts.args))
end
util["set-uc"]("Notee", _33_, {nargs = "?"})
local function _34_(opts)
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/home/" .. os.date("!%Y%m%d-") .. opts.args))
end
util["set-uc"]("Noteh", _34_, {nargs = "?"})
local function _35_(opts)
  local current_dir = vim.fn.getcwd()
  return __fnl_global__ag_2doutside_2dcwd("/neotes", opts.args)
end
util["set-uc"]("Sn", _35_, {nargs = "?"})
local function _36_(opts)
  local current_dir = vim.fn.getcwd()
  return vim.cmd((":3T cd ~/neotes && bb scripts/encrypt.clj " .. opts.args .. " && cd " .. current_dir))
end
util["set-uc"]("EncryptNotes", _36_, {nargs = "?"})
local function _37_(opts)
  local current_dir = vim.fn.getcwd()
  return vim.cmd((":3T cd ~/neotes && bb scripts/decrypt.clj " .. opts.args .. " && cd " .. current_dir))
end
util["set-uc"]("DecryptNotes", _37_, {nargs = "?"})
local function _38_()
  vim.cmd("tabe")
  return vim.cmd("cope")
end
util["set-uc"]("Qtc", _38_)
local function _39_()
  return __fnl_global__replace_2dpixel_2drem()
end
util["set-uc"]("PixelToRem", _39_)
local function _40_()
  return __fnl_global__replace_2drem_2dpixel()
end
util["set-uc"]("RemToPixel", _40_)
local function _41_()
  return __fnl_global__replace_2dhex_2drgb()
end
util["set-uc"]("HexToRgb", _41_)
local function _42_()
  vim.cmd("normal dt(r[f)r]^")
  vim.cmd("normal f xf x")
  return __fnl_global__replace_2drgb_2dhex()
end
util["set-uc"]("RgbToHex", _42_)
local function _43_()
  return __fnl_global__tailwind_2dhex_2dto_2dclass()
end
util["set-uc"]("TailwindHexToClass", _43_)
local function _44_()
  return __fnl_global__tailwind_2dclass_2dto_2dhex()
end
util["set-uc"]("TailwindClassToHex", _44_)
local function _45_(opts)
  return __fnl_global__insert_2doptimised_2dsvg(opts.args)
end
util["set-uc"]("Svg", _45_, {nargs = "?"})
local function _46_()
  util.cmdtc("<C-W>j")
  vim.cmd("resize 10")
  return util.cmdtc("<C-W>k")
end
util["set-uc"]("Resize10", _46_)
local function _47_()
  vim.cmd("sp")
  vim.cmd("normal 'C")
  vim.cmd("resize 10")
  return util.cmdtc("<C-w>k")
end
util["set-uc"]("Rsp", _47_, {nargs = "?"})
local function _48_(opts)
  if (opts.args ~= "block") then
    util.cmdtc("<Plug>(neoterm-repl-send-line)")
  else
  end
  vim.cmd("sleep 100ms")
  util.cmdtc("<C-w>j")
  vim.cmd("normal G")
  vim.cmd("normal k")
  if (opts.args == "block") then
    vim.cmd("normal V%y")
  else
    vim.cmd("normal yy")
  end
  util.cmdtc("<C-w>k")
  vim.cmd("normal p")
  if (opts.args == "block") then
    vim.cmd("normal V%gc")
  else
    vim.cmd("normal gcc")
  end
  util.cmdtc("<C-w>j")
  vim.cmd("normal G")
  return util.cmdtc("<C-w>k")
end
util["set-uc"]("Rspa", _48_, {nargs = "?"})
local function _52_()
  local path = vim.api.nvim_buf_get_name(0)
  local directory = str.join("/", core.butlast(str.split(path, "/")))
  if (__fnl_global__system_2dos() == "Linux") then
    return os.execute(("xdg-open " .. directory))
  else
    return os.execute(("open -R " .. directory))
  end
end
util["set-uc"]("Open", _52_)
local function _54_()
  local items = {"W - HTML/CSS", "W - TypeScript/JavaScript/React/Node", "G - Clojure(Script)", "W - SQL", "V - Vim/Fennel/Lua/Keyboard"}
  local item = items[math.random(#items)]
  return print(item)
end
util["set-uc"]("Ftd", _54_)
do local _ = {} end
local function _55_()
  return vim.fn.setreg("+", vim.fn.expand("%:~:."))
end
return util["set-uc"]("YankFilePath", _55_)
