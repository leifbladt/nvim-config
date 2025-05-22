return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>fl", builtin.resume, { desc = "Resume last picker" })
			vim.keymap.set("n", "<leader>fwg", function()
 				local word = vim.fn.expand("<cword>")
 				builtin.grep_string({ search = word })
 			end)
 			vim.keymap.set("n", "<leader>fwwg", function()
 				local word = vim.fn.expand("<cWORD>")
 				builtin.grep_string({ search = word })
 			end)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				pickers = {
					live_grep = {
						file_ignore_patterns = { "**/node_modules", ".git/", ".venv/" },
						additional_args = function(_)
							return { "--hidden" }
						end,
					},
					find_files = {
						file_ignore_patterns = { "**/node_modules/", ".git/", ".venv/" },
						hidden = true,
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}

