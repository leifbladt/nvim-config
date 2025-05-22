return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {},
	config = function()
		require("hardtime").setup({
			restriction_mode = "hint",
			disable_mouse = false,
		})
	end,
}
