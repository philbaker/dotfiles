-- [nfnl] fnl/plugins/projectionist.fnl
local function _1_()
  vim.g.projectionist_heuristics = {["app/&composer.json"] = {["app/*.php"] = {alternate = {"tests/{}Test.php"}, type = "source"}, ["tests/*Test.php"] = {alternate = "app/{}.php", type = "test"}}, artisan = {["*"] = {console = "php artisan tinker", start = "php artisan serve"}, ["app/*.php"] = {alternate = {"tests/Unit/{}Test.php", "tests/Feature/{}Test.php"}, type = "source"}, ["app/Http/Controllers/*.php"] = {type = "controller"}, ["app/Models/*.php"] = {type = "model"}, ["database/migrations/*.php"] = {type = "migration"}, ["routes/*.php"] = {type = "route"}, ["tests/Feature/*Test.php"] = {alternate = "app/{}.php", type = "test"}, ["tests/Unit/*Test.php"] = {alternate = "app/{}.php", type = "test"}}, ["src/&composer.json"] = {["src/*.php"] = {alternate = {"tests/{}Test.php"}, type = "source"}, ["tests/*Test.php"] = {alternate = "src/{}.php", type = "test"}}}
  return nil
end
return {{"tpope/vim-projectionist", config = _1_, dependencies = "tpope/vim-dispatch"}}
