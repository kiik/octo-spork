# Used by "mix format"
[
  import_deps: [:ecto, :ecto_sql, :phoenix],
  subdirectories: ["priv/*/migrations"],
  plugins: [Phoenix.LiveView.HTMLFormatter],
  inputs: ["mix.exs", "config/*.exs"],
  subdirectories: ["apps/*"]
]
