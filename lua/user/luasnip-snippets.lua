if vim.g.snippets == "luasnip" then
	return
end

local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({})

ls.filetype_extend("typescriptreact", { "" })

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local rep = require("luasnip.extras").rep

ls.snippets = {
	lua = {
		-- example
		ls.parser.parse_snippet("fff", "-- expand here"),
	},
	typescriptreact = {
		-- console.log
		s("ccc", { t("console.log('some text: "), rep(1), t({ "', " }), i(1), t({ ");" }) }),
	},
}

vim.api.nvim_set_keymap(
	"n",
	"zzz",
	"<cmd>source ~/.config/nvim/lua/user/luasnip-snippets.lua<CR>",
	{ noremap = true, silent = true }
)
