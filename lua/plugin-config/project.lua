require("project_nvim").setup {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	detection_methods = { "pattern" },
	patterns = {
		"README.md",
		"Cargo.toml",
		"package.json",
		".sln",
		".git",
		"_darcs",
		".hg",
		".bzr",
		".svn",
		"Makefile",
	},
}
