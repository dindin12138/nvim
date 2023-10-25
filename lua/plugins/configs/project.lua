return {
  detection_methods = { "pattern" },
  patterns = {
    "README.md",
    "Cargo.toml",
    ".sln",
    ".git",
    "_darcs",
    ".hg",
    ".bzr",
    ".svn",
    "Makefile",
  },
  exclude_dirs = { "~/.local/*" },
}
