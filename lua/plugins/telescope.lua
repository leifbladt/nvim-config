return {
	{
		"nvim-telescope/telescope.nvim",
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

			-- Displays hover information about the symbol under the cursor
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

			-- Jump to the definition
			vim.keymap.set("n", "gd", builtin.lsp_definitions, {})

			-- Selects a code action available at the current cursor position
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

			-- Jump to declaration
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})

			-- Lists all the implementations for the symbol under the cursor
			vim.keymap.set("n", "gi", builtin.lsp_implementations, {})

			-- Jumps to the definition of the type symbol
			vim.keymap.set("n", "go", builtin.lsp_type_definitions, {})

			-- Lists all the references
			vim.keymap.set("n", "gr", builtin.lsp_references, {})

			-- Displays a function's signature information
			vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, {})

			-- Renames all references to the symbol under the cursor
			vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {})

			-- Show diagnostics in a floating window
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, {})
			-- vim.keymap.set("n", "gal", builtin.diagnostics, {})

			-- Move to the previous diagnostic
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})

			-- Move to the next diagnostic
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
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

