local pickers = require("telescope.pickers") -- pickerを作るために使う主なモジュール
local finders = require("telescope.finders") -- itemでpickerを一覧表示するためのインタフェース
local conf = require("telescope.config").values -- valuesテーブルはユーザの設定を保持する。


local colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "colors",
    finder = finders.new_table {
      results = {"red", "green", "blue"}
    },
    sorter = conf.generic_sorter(opts),
  }):find()
end

colors()
--colors(require("telescope.themes").get_dropdown{}) -- ドロップダウン形式
