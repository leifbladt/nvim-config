return {
	"stevearc/aerial.nvim",
	event = "VeryLazy",
	config = function()
		require("aerial").setup({
			layout = {
				default_direction = "prefer_left",
			},
		})

		vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle! left<CR>")
	end,
}
