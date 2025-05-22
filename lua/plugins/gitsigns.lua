return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
			current_line_blame_formatter = "<author> • <author_time:%d-%m-%Y %H:%M:%S> • <summary>",
			current_line_blame_opts = { delay = 500 },
		})
	end,
}

