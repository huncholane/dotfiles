local clipboards = {
	xclip = {
		name = "xclip",
		copy = {
			["+"] = "xclip -selection clipboard",
			["*"] = "xclip -selection primary",
		},
		paste = {
			["+"] = "xclip -selection clipboard -o",
			["*"] = "xclip -selection primary -o",
		},
		cache_enabled = 1,
	},
	wayland = {
		name = "wl-clipboard",
		copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
		paste = {
			["+"] = "wl-paste --no-newline",
			["*"] = "wl-paste --no-newline",
		},
		cache_enabled = 1,
	},
}
-- wayland settings
if vim.fn.getenv("WAYLAND_DISPLAY") ~= vim.NIL then
	vim.g.clipboard = clipboards.wayland
end
