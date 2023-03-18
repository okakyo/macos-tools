vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

-- keymap
local mason = require('mason')
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup_handlers({ function(server_name)
  local opts = {}
  opts.on_attach = function(_, bufnr)
    local bufopts = { silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gtD', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'grf', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>p', vim.lsp.buf.format, bufopts)
  end

  local lspOption = {
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  }

  require('lspconfig')[server_name].setup(lspOption)
  require("lspconfig").pyright.setup{
        settings = {
          python = {
            venvPath = ".",
            pythonPath = "./.venv/bin/python",
            analysis = {
              extraPaths = {"."}
            }
          }
        }
      }

end
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { separator = true }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { separator = true }
)

  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

-- colorscheme -----------------------------------------------------------------
require('onedark').setup  {
  style = 'deep'
}
require('onedark').load()
-- 'vim-airline/vim-airline' ---------------------------------------------------
vim.cmd 'let g:airline#extensions#tabline#enabled = 1'
vim.cmd 'let g:airline_powerline_fonts = 1'

-- 'vim-airline/vim-airline-themes' --------------------------------------------
vim.cmd 'let g:airline_theme = "onedark"'

-- 'airblade/vim-gitgutter' ----------------------------------------------------
vim.cmd 'let g:gitgutter_sign_added = "+"'
vim.cmd 'let g:gitgutter_sign_modified = "^"'
vim.cmd 'let g:gitgutter_sign_removed = "-"'
vim.cmd 'highlight GitGutterAdd    guifg=#009900 ctermfg=2'
vim.cmd 'highlight GitGutterChange guifg=#bbbb00 ctermfg=3'
vim.cmd 'highlight GitGutterDelete guifg=#ff2222 ctermfg=1'
vim.cmd 'highlight GitGutterAddLine          ctermbg=2'
vim.cmd 'highlight GitGutterChangeLine       ctermbg=3'
vim.cmd 'highlight GitGutterDeleteLine       ctermbg=1'

-- 'junegunn/fzf.vim' ----------------------------------------------------------
vim.cmd "let g:fzf_preview_window = ['right:70%', 'ctrl-/']"

-- fern.vim----------------------------------------------------------------------
vim.cmd "let g:fern#renderer = 'nerdfont'"

require 'config'
require 'plugins'
require 'keybindings'
require 'treesitter'

