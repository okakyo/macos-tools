require'nvim-treesitter.configs'.setup {
  
  ensure_installed = {
    "c",
    "css",
    "cpp",
    "dockerfile",
    "go",
    "graphql",
    "html",
    "java",
    "javascript",
    "json5",
    "lua",
    "markdown",
    "prisma",
    "python",
    "ruby",
    "rust",
    "sql",
    "typescript",
    "tsx",
    "vim",
    "vue",
    "yaml",
  },

  sync_install = true,
  auto_install = true,


  highlight = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

