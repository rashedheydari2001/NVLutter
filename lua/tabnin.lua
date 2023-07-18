local tabnine_enterprise_host = "https://tabnine.customer.com"

require('tabnine').setup({
	disable_auto_comment = false,
	accept_keymap = "<Tab>",
	dismiss_keymap = "<C-]>",
	debounce_ms = 800,
	suggestion_color = { gui = "#808080", cterm = 244 },
	exclude_filetypes = { "TelescopePrompt" },
	log_file_path = nil, -- absolute path to Tabnine log file,
	tabnine_enterprise_host = tabnine_enterprise_host
})
