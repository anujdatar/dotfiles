return {
	-- Syntax highliting and code navigation
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/nvim-treesitter-textobjects",
			init = function()
				-- disable rtp plugin, as we only need its queries for mini.ai
				-- In case other textobject modules are enabled, we will load them
				-- once nvim-treesitter is loaded
				require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
				load_textobjects = true
			end,
		},
	},
	opts = {
		-- Add languages to be installed here that you want installed for treesitter
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"css",
			"dockerfile",
			"gitignore",
			"go",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"rust",
			"svelte",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
		auto_install = true,

		-- Enable syntax highlighting
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},

		-- Enable treesitter based indentation
		indent = { enable = true },

		-- Enable autotagging, using nvim-ts-autotag
		autotag = { enable = true },

		-- Enable incremental selection based on treesitter
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
