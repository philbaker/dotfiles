-- [nfnl] fnl/config/usercommand.fnl
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
  return vim.cmd(("3T javac " .. vim.fn.expand("%:t")))
end
util["set-uc"]("Jac", _14_)
local function _15_()
  return vim.cmd(("3T java " .. vim.fn.expand("%:t:r")))
end
util["set-uc"]("Jar", _15_)
local function _16_()
  return vim.cmd("4T clojure -M:format -m cljfmt.main fix %")
end
util["set-uc"]("Cljfmt", _16_)
local function _17_()
  return vim.cmd("4T zprint < %")
end
util["set-uc"]("Zprint", _17_)
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
  vim.cmd("w")
  vim.cmd(":e index.html")
  vim.cmd(":w")
  return vim.cmd(":b #")
end
util["set-uc"]("SaveIndexAndReturn", _19_)
local function _20_()
  vim.cmd(":w")
  vim.cmd(("2T ./vendor/bin/pint " .. vim.fn.expand("%:p")))
  vim.cmd(":sleep 300m")
  return vim.cmd(":e %")
end
util["set-uc"]("Pint", _20_)
local function _21_()
  local file = assert(io.open((os.getenv("HOME") .. "/neotes/all/01-checklists/t.md")))
  local lines = util["split-string-by-line"](file:read("*a"))
  file:close()
  return vim.api.nvim_buf_set_lines(0, -1, -1, false, lines)
end
util["set-uc"]("ChT", _21_)
local function _22_()
  local file = assert(io.open("n/notebooks/general/stemplate.md"))
  local lines = util["split-string-by-line"](file:read("*a"))
  file:close()
  return vim.api.nvim_buf_set_lines(0, -1, -1, false, lines)
end
util["set-uc"]("ChSt", _22_)
local function _23_()
  return vim.cmd((":e " .. "n/journal/" .. os.date("!%Y%m%d-daily.md")))
end
util["set-uc"]("Jote", _23_)
local function _24_()
  return vim.fn.feedkeys((":e " .. os.date("!%Y%m%d-daily.md")))
end
util["set-uc"]("Kote", _24_)
local function _25_(opts)
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/none/" .. os.date("!%Y%m%d-") .. opts.args))
end
util["set-uc"]("Note", _25_, {nargs = "?"})
local function _26_(opts)
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/all/clo/notebooks/" .. os.date("!%Y%m%d-") .. opts.args))
end
util["set-uc"]("Notee", _26_, {nargs = "?"})
local function _27_(opts)
  return vim.cmd((":e " .. os.getenv("HOME") .. "/neotes/home/" .. os.date("!%Y%m%d-") .. opts.args))
end
util["set-uc"]("Noteh", _27_, {nargs = "?"})
local function _28_(opts)
  local current_dir = vim.fn.getcwd()
  return vim.cmd((":3T cd ~/neotes && bb scripts/encrypt.clj " .. opts.args .. " && cd " .. current_dir))
end
util["set-uc"]("EncryptNotes", _28_, {nargs = "?"})
local function _29_(opts)
  local current_dir = vim.fn.getcwd()
  return vim.cmd((":3T cd ~/neotes && bb scripts/decrypt.clj " .. opts.args .. " && cd " .. current_dir))
end
util["set-uc"]("DecryptNotes", _29_, {nargs = "?"})
local function _30_(opts)
  return vim.cmd((":3T bb scripts/encrypt.clj " .. opts.args))
end
util["set-uc"]("EncryptJotes", _30_, {nargs = "?"})
local function _31_(opts)
  return vim.cmd((":3T bb scripts/decrypt.clj " .. opts.args))
end
util["set-uc"]("DecryptJotes", _31_, {nargs = "?"})
local function _32_()
  util.cmdtc("<C-W>j")
  vim.cmd("resize 10")
  return util.cmdtc("<C-W>k")
end
util["set-uc"]("Resize10", _32_)
local function _33_()
  return vim.cmd(":e ~/neotes/none/cycle.md")
end
util["set-uc"]("Pro", _33_)
local function _34_()
  vim.cmd("sp")
  vim.cmd("normal 'C")
  vim.cmd("resize 10")
  return util.cmdtc("<C-w>k")
end
util["set-uc"]("Rsp", _34_, {nargs = "?"})
local function timestamp()
  return os.date("%Y-%m-%d %H:%M:%S")
end
local function filepath()
  return vim.fn.expand("%:~:.")
end
local function timestamp_filepath()
  return (timestamp() .. " " .. filepath())
end
local function _35_()
  return vim.fn.setreg("+", filepath())
end
util["set-uc"]("Ypath", _35_)
local function _36_()
  return vim.fn.setreg("+", timestamp())
end
util["set-uc"]("Yts", _36_)
local function _37_()
  return vim.fn.setreg("+", timestamp_filepath())
end
util["set-uc"]("Ytspath", _37_)
local function _38_()
  vim.cmd(":FasterDisableLsp")
  vim.cmd(":FasterDisableTreesitter")
  return vim.cmd(":FasterDisableMatchparen")
end
util["set-uc"]("FasterFix", _38_)
return {}
