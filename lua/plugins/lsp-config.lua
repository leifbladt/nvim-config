return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", version = "^1.*" },
			{ "mason-org/mason-lspconfig.nvim", version = "^1.*" },
 		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason").setup()
 			require("mason-lspconfig").setup({
 				ensure_installed = { "lua_ls", "ts_ls" },
 				handlers = {
 					function(server_name)
 						require("lspconfig")[server_name].setup({
 							capabilities = capabilities,
 						})
 					end,
 				},
 			})

			local builtin = require("telescope.builtin")

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
			vim.keymap.set("n", "gl", builtin.diagnostics, {})

			-- Move to the previous diagnostic
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})

			-- Move to the next diagnostic
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
		end,
	},
}
