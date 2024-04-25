return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- Disable Netrw at the start
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			view = {
				relativenumber = true,
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- keymaps
		vim.keymap.set(
			"n",
			"<leader>tt",
			vim.cmd.NvimTreeToggle,
			{ noremap = true, silent = true, desc = "[T]oggle Nvim[T]ree" }
		)
		vim.keymap.set(
			"n",
			"<leader>tr",
			vim.cmd.NvimTreeRefresh,
			{ noremap = true, silent = true, desc = "Nvim[T]ree [R]efresh" }
		)
		vim.keymap.set(
			"n",
			"<leader>tf",
			vim.cmd.NvimTreeFocus,
			{ noremap = true, silent = true, desc = "Nvim[T]ree [F]ocus" }
		)
		vim.keymap.set(
			"n",
			"<leader>to",
			vim.cmd.NvimTreeFindFileToggle,
			{ noremap = true, silent = true, desc = "Nvim[T]ree [O]pen, show file location" }
		)
	end,
}
