local _2afile_2a = "/home/pb/.config/nvim/fnl/config/usercommand.fnl"
local _2amodule_name_2a = "config.usercommand"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local core, str, util = autoload("aniseed.core"), autoload("aniseed.string"), autoload("config.util")
do end (_2amodule_locals_2a)["core"] = core
_2amodule_locals_2a["str"] = str
_2amodule_locals_2a["util"] = util
local function _1_(opts)
  return vim.cmd(("1T bb nrepl-server " .. opts.args))
end
util["set-uc"]("BbRepl", _1_, {nargs = "?"})
local function _2_(opts)
  return vim.cmd(("1T nbb nrepl-server :port " .. opts.args))
end
util["set-uc"]("NbbRepl", _2_, {nargs = "?"})
local function _3_()
  return vim.cmd("1T npm run shadow:watch")
end
util["set-uc"]("NPMShadowWatch", _3_)
local function _4_()
  return vim.cmd("1T npm run shadow:release")
end
util["set-uc"]("NPMShadowRelease", _4_)
local function _5_()
  return vim.cmd("2T npm run tailwind:watch")
end
util["set-uc"]("NPMTailwindWatch", _5_)
local function _6_()
  return vim.cmd("2T npm run tailwind:release")
end
util["set-uc"]("NPMTailwindRelease", _6_)
local function _7_()
  return vim.cmd("1T npm run watch")
end
util["set-uc"]("NPMRunWatch", _7_)
local function _8_()
  return vim.cmd("1T npm run prod")
end
util["set-uc"]("NPMRunProd", _8_)
local function _9_()
  return vim.cmd("1T clj -A:dev")
end
util["set-uc"]("ClojureStartRepl", _9_)
local function _10_()
  vim.cmd("w")
  return vim.cmd("3T npx squint %")
end
util["set-uc"]("Sq", _10_)
local function _11_()
  vim.cmd("w")
  return vim.cmd("3T npx squint compile **/*.cljs")
end
util["set-uc"]("Sqall", _11_)
local function _12_()
  return vim.cmd("3T bb mjs_to_js.clj ./pages")
end
util["set-uc"]("Sqr", _12_)
local function _13_()
  vim.cmd("w")
  return vim.cmd(("ConjureEval (clerk/show! \"" .. ("notebooks/" .. vim.fn.expand("%:t")) .. "\")"))
end
util["set-uc"]("ClerkShow", _13_)
local function _14_()
  return vim.cmd(("3T javac " .. vim.fn.expand("%:t")))
end
util["set-uc"]("Jac", _14_)
local function _15_()
  return vim.cmd(("3T java " .. vim.fn.expand("%:t:r")))
end
util["set-uc"]("Jar", _15_)
local function _16_()
  return vim.cmd("3T clj -M:cljfmt %")
end
util["set-uc"]("Cljfmt", _16_)
local function _17_()
  return vim.cmd("2T vendor/bin/phel run %")
end
util["set-uc"]("Phr", _17_)
local function _18_()
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
util["set-uc"]("Nter", _18_)
local function _19_()
  vim.cmd(":%s/export //g")
  return vim.cmd(":w")
end
util["set-uc"]("JSRemoveExport", _19_)
local function _20_()
  vim.cmd(":%s/const/var/g")
  return vim.cmd(":w")
end
util["set-uc"]("JSReplaceConstWithVar", _20_)
local function _21_()
  vim.cmd(":%s/let")
  return vim.cmd(":w")
end
util["set-uc"]("JSRemoveLet", _21_)
local function _22_()
  vim.cmd("w")
  vim.cmd(":e index.html")
  vim.cmd(":w")
  return vim.cmd(":b #")
end
util["set-uc"]("SaveIndexAndReturn", _22_)
local function _23_()
  vim.cmd(":w")
  vim.cmd(("2T pint " .. vim.fn.expand("%:p")))
  vim.cmd(":sleep 300m")
  return vim.cmd(":e %")
end
util["set-uc"]("Pint", _23_)
local function _24_()
  local file = assert(io.open((os.getenv("HOME") .. "/neotes/all/01-checklists/dev-testing.md")))
  local lines = util["split-string-by-line"](file:read("*a"))
  file:close()
  return vim.api.nvim_buf_set_lines(0, -1, -1, false, lines)
end
util["set-uc"]("ChTest", _24_)
local function _25_()
  local file = assert(io.open((os.getenv("HOME") .. "/neotes/all/01-checklists/trello-template.md")))
  local lines = util["split-string-by-line"](file:read("*a"))
  file:close()
  return vim.api.nvim_buf_set_lines(0, -1, -1, false, lines)
end
util["set-uc"]("ChTrello", _25_)
local function _26_()
  local file = assert(io.open((os.getenv("HOME") .. "/neotes/all/01-checklists/ab-testing.md")))
  local lines = util["split-string-by-line"](file:read("*a"))
  file:close()
  return vim.api.nvim_buf_set_lines(0, -1, -1, false, lines)
end
util["set-uc"]("AbTest", _26_)
local function _27_()
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/none/vim-sexp-key-bindings.md"))
end
util["set-uc"]("VimSexpKeyBindings", _27_)
local function _28_()
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/none/20230411-vim-sexp-mappings.md"))
end
util["set-uc"]("VimSexpKeyMappings", _28_)
local function _29_()
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/none/20230722-vim-surround.md"))
end
util["set-uc"]("VimSurroundKeyMappings", _29_)
local function _30_(opts)
  return util["ag-outside-cwd"]("/dotfiles/nvim", opts.args)
end
util["set-uc"]("Sv", _30_, {nargs = "?"})
local function _31_(opts)
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/none/" .. os.date("!%Y%m%d-") .. opts.args))
end
util["set-uc"]("Note", _31_, {nargs = "?"})
local function _32_(opts)
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/all/" .. os.date("!%Y%m%d-") .. opts.args))
end
util["set-uc"]("Notee", _32_, {nargs = "?"})
local function _33_(opts)
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/home/" .. os.date("!%Y%m%d-") .. opts.args))
end
util["set-uc"]("Noteh", _33_, {nargs = "?"})
local function _34_(opts)
  local current_dir = vim.fn.getcwd()
  return util["ag-outside-cwd"]("/neotes", opts.args)
end
util["set-uc"]("Sn", _34_, {nargs = "?"})
local function _35_(opts)
  local current_dir = vim.fn.getcwd()
  return vim.cmd((":3T cd ~/neotes && bb scripts/encrypt.clj " .. opts.args .. " && cd " .. current_dir))
end
util["set-uc"]("EncryptNotes", _35_, {nargs = "?"})
local function _36_(opts)
  local current_dir = vim.fn.getcwd()
  return vim.cmd((":3T cd ~/neotes && bb scripts/decrypt.clj " .. opts.args .. " && cd " .. current_dir))
end
util["set-uc"]("DecryptNotes", _36_, {nargs = "?"})
local function _37_()
  vim.cmd("tabe")
  return vim.cmd("cope")
end
util["set-uc"]("Qtc", _37_)
local function _38_()
  return util["replace-pixel-rem"]()
end
util["set-uc"]("PixelToRem", _38_)
local function _39_()
  return util["replace-rem-pixel"]()
end
util["set-uc"]("RemToPixel", _39_)
local function _40_()
  return util["replace-hex-rgb"]()
end
util["set-uc"]("HexToRgb", _40_)
local function _41_()
  vim.cmd("normal dt(r[f)r]^")
  vim.cmd("normal f xf x")
  return util["replace-rgb-hex"]()
end
util["set-uc"]("RgbToHex", _41_)
local function _42_()
  return util["tailwind-hex-to-class"]()
end
util["set-uc"]("TailwindHexToClass", _42_)
local function _43_()
  return util["tailwind-class-to-hex"]()
end
util["set-uc"]("TailwindClassToHex", _43_)
local function _44_(opts)
  return util["insert-optimised-svg"](opts.args)
end
util["set-uc"]("Svg", _44_, {nargs = "?"})
local function _45_()
  util.cmdtc("<C-W>j")
  vim.cmd("resize 10")
  return util.cmdtc("<C-W>k")
end
util["set-uc"]("Resize10", _45_)
local function _46_()
  vim.cmd("sp")
  vim.cmd("normal 'C")
  vim.cmd("resize 10")
  return util.cmdtc("<C-w>k")
end
util["set-uc"]("Rsp", _46_, {nargs = "?"})
local function _47_(opts)
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
util["set-uc"]("Rspa", _47_, {nargs = "?"})
local function _51_()
  local path = vim.api.nvim_buf_get_name(0)
  local directory = str.join("/", core.butlast(str.split(path, "/")))
  if (util["system-os"]() == "Linux") then
    return os.execute(("xdg-open " .. directory))
  else
    return os.execute(("open -R " .. directory))
  end
end
util["set-uc"]("Open", _51_)
return _2amodule_2a