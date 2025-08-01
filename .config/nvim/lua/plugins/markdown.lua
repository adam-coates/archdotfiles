return {
	"OXY2DEV/markview.nvim",
	lazy = false,
    priority = 49,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("markview").setup({
			preview = {
				icon_provider = "devicons",
                filetypes = { "markdown", "Avante", "quarto" },
			},
			markdown = {
				list_items = {
					marker_minus = {
						add_padding = false,
					},
					marker_plus = {
						add_padding = false,
					},
					marker_star = {
						add_padding = false,
					},
					marker_dot = {
						add_padding = false,
					},
					marker_parenthesis = {
						add_padding = false,
					},
				},
			},
		})
	end,
}
-- local colorquote = "fffcfc"
-- return {
-- 	"MeanderingProgrammer/markdown.nvim",
-- 	main = "render-markdown",
-- 	opts = {},
-- 	name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
-- 	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		require("render-markdown").setup({
-- 			file_types = { "markdown", "quarto" },
-- 			quote = {
-- 				enabled = true,
-- 				highlight = colorquote,
-- 			},
-- 			heading = {
-- 				enabled = true,
-- 				sign = true,
-- 				position = "overlay",
-- 				icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
-- 				signs = { "󰫎 " },
-- 				width = "full",
-- 				left_margin = 0,
-- 				left_pad = 0,
-- 				right_pad = 0,
-- 				min_width = 0,
-- 				border = false,
-- 				border_virtual = false,
-- 				border_prefix = false,
-- 				above = "▄",
-- 				below = "▀",
-- 				backgrounds = {
-- 					"RenderMarkdownH1Bg",
-- 					"RenderMarkdownH2Bg",
-- 					"RenderMarkdownH3Bg",
-- 					"RenderMarkdownH4Bg",
-- 					"RenderMarkdownH5Bg",
-- 					"RenderMarkdownH6Bg",
-- 				},
-- 				foregrounds = {
-- 					"RenderMarkdownH1",
-- 					"RenderMarkdownH2",
-- 					"RenderMarkdownH3",
-- 					"RenderMarkdownH4",
-- 					"RenderMarkdownH5",
-- 					"RenderMarkdownH6",
-- 				},
-- 			},
--             code = {
--                 disable_background = { 1 },
--             },
-- 		})
-- 	end,
-- }
