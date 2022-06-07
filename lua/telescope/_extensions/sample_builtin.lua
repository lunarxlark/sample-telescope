local pickers = require("telescope.pickers") -- pickerを作るために使う主なモジュール
local finders = require("telescope.finders") -- itemでpickerを一覧表示するためのインタフェース
local conf = require("telescope.config").values -- valuesテーブルはユーザの設定を保持する。


local colors = function(opts)
	-- for colorschemes
	--local colorschemes = vim.api.nvim_get_runtime_file("colors/*.vim", true)
	--for _,c in ipairs(colorschemes) do
	--  print(c)
	--end
	opts = opts or {}
	pickers.new(opts, {
		prompt_title = "colors",
		finder = finders.new_table({
		sorter = conf.generic_sorter(opts),
	}):find()
end

colors()
--colors(require("telescope.themes").get_dropdown{}) -- ドロップダウン形式
