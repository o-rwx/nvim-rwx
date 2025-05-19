return {
  name = "rust-analyzer",
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  init_options = { provideFormatter = true },
  root_markers = { "Cargo.toml", "Cargo.lock", ".git" },
}
