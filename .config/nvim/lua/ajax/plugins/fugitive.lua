return {
	-- Git plugins
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { noremap = true, silent = true, desc = "Git [S]tatus" })
			vim.keymap.set("n", "<leader>gb", vim.cmd.Gblame, { noremap = true, silent = true, desc = "Git [B]lame" })
			vim.keymap.set("n", "<leader>gc", vim.cmd.Gcommit, { noremap = true, silent = true, desc = "Git [C]ommit" })
			vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiff, { noremap = true, silent = true, desc = "Git [D]iff" })
			vim.keymap.set("n", "<leader>gp", vim.cmd.Gpull, { noremap = true, silent = true, desc = "Git [P]ull" })
			vim.keymap.set("n", "<leader>gP", vim.cmd.Gpush, { noremap = true, silent = true, desc = "Git [P]ush" })
		end,
	},
	{ "tpope/vim-rhubarb" },
}
