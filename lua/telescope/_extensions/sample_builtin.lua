local pickers = require("telescope.pickers") -- pickerを作るために使う主なモジュール
local finders = require("telescope.finders") -- itemでpickerを一覧表示するためのインタフェース
local conf = require("telescope.config").values -- valuesテーブルはユーザの設定を保持する。

local actions = require("telescope.actions") -- ユーザによってマッピングされる全アクションを保持
local action_stae = require("telescope.actions.state") -- 現在のpicker,選択範囲、行を取得sするために使用するutils

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
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_stae.get_selected_entry()
				--print(vim.inspect(selection))
				vim.api.nvim_put({ selection[1] }, "", false, true)
			end)
			return true
		end,
	}):find()
end

colors()
--colors(require("telescope.themes").get_dropdown{}) -- ドロップダウン形式
