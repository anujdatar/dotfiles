return {
	-- "gc" to comment visual regions/lines
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring", -- commenting for tsx and jsx files
	},
	config = function()
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- keymaps
		vim.keymap.set(
			"n",
			"<leader>/",
			require("Comment.api").toggle.linewise.current,
			{ desc = "Toggle comment on current line" }
		)
		vim.keymap.set(
			"v",
			"<leader>/",
			require("Comment.api").toggle.linewise.current,
			{ desc = "Toggle comment on current line" }
		)

		comment.setup({
			-- for commenting tsx and jsx files
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}
