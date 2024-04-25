return {
	"theprimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		-- set keymaps
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "[H]arpoon: [A]ppend file to list" })
		vim.keymap.set("n", "<leader>ht", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "[H]arpoon: [T]oggle quick menu" })
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "[H]arpoon: [N]ext file" })
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "[H]arpoon: [P]revious file" })
	end,
}
