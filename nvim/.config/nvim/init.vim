call plug#begin()
Plug 'vim-scripts/Wombat'
Plug 'vim-scripts/wombat256.vim'
Plug 'shaunsingh/moonlight.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'folke/which-key.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'echasnovski/mini.icons'
Plug 'ChristianChiarulli/neovim-codicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'elzr/vim-json'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'hedyhli/outline.nvim'
Plug 'lewis6991/gitsigns.nvim'
"Fix for nvim 0.9.5
"~/.local/share/nvim/plugged/hover.nvim/lua/hover/actions.lua
"uv = require('luv')
"s/vim.uv/uv/g
Plug 'lewis6991/hover.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ellisonleao/glow.nvim', {'branch': 'main'}
Plug 'pwntester/octo.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'folke/trouble.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'ray-x/lsp_signature.nvim'
Plug 'f3fora/cmp-spell'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'arkav/lualine-lsp-progress'
Plug 'simrat39/rust-tools.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'mfussenegger/nvim-lint'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'vim-test/vim-test'
Plug 'danymat/neogen'
"Plug 'anymat/neogen'
"Fix for nvim 0.9.5 - https://github.com/ldelossa/nvim-ide/issues/126
"~/.local/share/nvim/plugged/nvim-ide/lua/ide/components/explorer/filenode.lua
"uv = require('luv')
"s/vim.uv/uv/g
Plug 'ldelossa/nvim-ide'
Plug 'rcarriga/nvim-notify'
Plug 'rcarriga/nvim-dap-ui'
Plug 'DNLHC/glance.nvim'
call plug#end()


" ==================== colors =============================
set termguicolors
"colorscheme moonlight
colorscheme github_dark_tritanopia

lua << EOF
-- disable lsp semantic highlighting
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {})
end
EOF


" ==================== display =============================
syntax on           " Enable syntax highlighting
set nu              " Line numbers on
set showmatch       " Show matching braces / brackets
set vb              " Visual bell
set signcolumn=yes  " Always show sign column
set splitright      " Split vertical windows right to the current windows
set splitbelow      " Split horizontal windows below to the current windows
set nofoldenable    " Disable folding
set mouse=a         " Always enable mouse


" ==================== formatting ==========================
set autoindent          " Indent at same level of the previous line
set cindent             " Smarter indentation
set et                  " Expand tabs to spaces
set sw=4                " Use idents of 4 spaces
set tpm=20              " Max number of tabs
set ts=4                " Indentation every four columns
set list                " Display white space
set listchars=tab:>-    " Display tabs only
set nowrap              " Line wrapping off


" ==================== file ================================
set encoding=UTF-8            " Set default encoding to UTF-8
set fileformats=unix,dos,mac  " Prefer unix EOL
set noswapfile                " Don't use swapfile
set nobackup                  " Don't create annoying backup files
set nowritebackup             " Don't write to backup file before overwriting
set autowrite                 " Automatically save before :next, :make etc.
set autoread                  " Automatically reread changed files

" ==================== search ==============================
set incsearch     " Show match while typing
set hlsearch      " Highlight search results
set ignorecase    " Search case insensitive...
set smartcase     " ... unless pattern contains upper case


" ==================== wild menu ===========================
"Wild menu (command completion)
"List matches, then lognest common part, then all.
set wildmenu
set wildmode=list:longest,full


" ==================== key mappings =======================
let mapleader = ','

lua << EOF
local wk = require("which-key")
wk.setup {
  key = {
    scroll_down = '<c-f>',
    scroll_up = '<c-b>',
  },
}

wk.add({
    -- normal mode mappings
    { "<c-l>",  "<cmd>nohlsearch<cr><c-l>", desc = "Redraw / Remove Search Highlight"},
    { "<c-e>", "<cmd>NvimTreeFindFileToggle<cr>", desc  = "File Tree Find File" },
    { "<c-p>", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },

    -- nvim config
    { "<leader>i", "<cmd>Telescope find_files cwd=~/.config/nvim follow=true <cr>", desc = "init.vim" },

    -- which key help
    { "<leader>?", "<cmd>WhichKey<cr>", desc = "WhichKey"},

    -- bufferline mappings
    { "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Buffer 1" },
    { "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Buffer 2" },
    { "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Buffer 3" },
    { "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Buffer 4" },
    { "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Buffer 5" },
    { "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Buffer 6" },
    { "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Buffer 7" },
    { "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Buffer 8" },
    { "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Buffer 9" },

    { "<leader>f", group = "find" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>ft", "<cmd>NvimTreeToggle<cr>", desc = "File Tree" },

    -- get mappings
    { "<leader>g", group = "get" },
    { "<leader>gd", "<Cmd>Telescope lsp_definitions<CR>", desc = "Definition" },
    { "<leader>gi", "<Cmd>Telescope lsp_implementations<CR>", desc = "Implementations" },
    { "<leader>gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Declaration" },
    { "<leader>gr", "<Cmd>Telescope lsp_references<CR>", desc = "References" },
    { "<leader>ge", "<Cmd>Telescope diagnostics bufnr=0<CR>", desc = "Document Diagnostics" },
    { "<leader>gE", "<Cmd>Telescope diagnostics <CR>", desc = "Workspace Diagnostics" },
    { "<leader>gs", "<Cmd>Telescope lsp_document_symbols<CR>", desc = "Document Symbols" },
    { "<leader>gS", "<Cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace Symbols" },
    { "gd", "<Cmd>TroubleToggle lsp_definitions<CR>", desc = "Toggle Definitions" },
    { "gr", "<Cmd>TroubleToggle lsp_references<CR>", desc = "Toggle References" },
    { "gi", "<Cmd>TroubleToggle lsp_implementations<CR>", desc = "Toggle Implementations" },
    { "ge", "<Cmd>TroubleToggle document_diagnostics<CR>", desc = "Toggle Document Diagnostics" },
    { "gE", "<Cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Toggle Workspace Diagnostics" },
    { "gn", '<Cmd>lua require("trouble").next({skip_groups = true, jump = true})<CR>', desc = "Next" },
    { "gp", '<Cmd>lua require("trouble").previous({skip_groups = true, jump = true})<CR>', desc = "Previous" },
    --{ "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", desc = "Code Hover" },
    { "gh", "<Cmd>lua require('hover').hover()<CR>", desc = "Code Hover" },
    { "gs", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature" },
    -- { "gs", "<Cmd>lua require('lsp_signature').toggle_float_win()<CR>" },
    -- { "go", "<Cmd>Outline<CR>", desc = "Toggle Symbols Outline" },

    -- history mappings
    { "<leader>h",  group = "history" },
    { "<leader>hn", "<Cmd>Gitsigns next_hunk<cr>", desc = "Diff Next Hunk" },
    { "<leader>hp", "<Cmd>Gitsigns prev_hunk<cr>", desc = "Diff Prev Hunk" },
    { "<leader>hd", "<Cmd>Gitsigns diffthis<cr>", desc = "Diff" },
    { "<leader>hw", "<Cmd>Gitsigns toggle_word_diff<cr>", desc = "Toggle Word Diff" },
    { "<leader>hD", "<Cmd>DiffviewOpen<cr>", desc = "Diff View" },
    { "<leader>hh", "<Cmd>DiffviewFileHistory %<cr>", desc = "Diff View File History" },

    -- markdown mappings
    { "<leader>m", group = "markdown" },
    { "<leader>mp", "<Cmd>Glow<cr>", desc = "Markdown Preview" },
    { "<leader>mc", "<Cmd>InsertToc<cr>", desc = "Markdown Insert Table of Contents" },
    { "<leader>mC", "<Cmd>Toc<cr>", desc = "Markdown View Table of Contents" },
    { "<leader>mt", "<Cmd>TableFormat<cr>", desc = "Markdown Format Table" },

    -- code action mappings
    { "<leader>c", group = "code action" },
    { "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = false })<CR>", desc = "Code Format" },
    { "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
    { "<leader>cr", "<Cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename Symbol" },
    { "<leader>cd", "<Cmd>Neogen<CR>", desc = "Generate Doc" },

    -- octo mappings
    { "<leader>o", group = "octo" },
    { "<leader>oa", "<cmd>Octo actions<CR>", desc = "Octo menu" },

    -- testing mappings
    { "<leader>t", group = "test" },
    { "<leader>tf", "<cmd>TestFile $TEST_OPTS<CR>", desc = "Test File" },
    { "<leader>ts", "<cmd>TestSuite $TEST_OPTS<CR>", desc = "Test Suite" },
    { "<leader>tl", "<cmd>TestLast $TEST_OPTS<CR>", desc = "Test Last" },
    { "<leader>tn", "<cmd>TestNearest $TEST_OPTS<CR>", desc = "Test Nearest" },

    -- debug mappings
    { "<F4>", '<cmd>lua require("dap.ext.vscode").load_launchjs()<CR>', desc = "Debug Load launch.json" },
    { "<F5>", '<cmd>lua require("dap").continue()<CR>', desc = "Debug Run / Continue" },
    { "<F10>", '<cmd>lua require("dap").step_over()<CR>', desc = "Debug Step Over" },
    { "<F11>", '<cmd>lua require("dap").step_into()<CR>', desc = "Debug Step Into" },
    { "<F12>", '<cmd>lua require("dap").step_out()<CR>', desc = "Debug Step Out" },
    { "<leader>d", group = "debug" },
    { "<leader>dc", '<cmd>lua require("dap").continue()<CR>', desc = "Continue" },
    { "<leader>dx", '<cmd>lua require("dap").terminate()<CR>', desc = "Terminate" },
    { "<leader>db", '<cmd>lua require("dap").toggle_breakpoint()<CR>', desc = "Toggle Breakpoint" },
    { "<leader>dr", '<cmd>lua require("dap").repl.toggle()<CR>', desc = "Toggle Repl" },
    { "<leader>dv", '<cmd>lua require("dap.ui.widgets").hover()<CR>', desc = "Variables" },
    { "<leader>dtn", '<cmd>lua require("jdtls").test_nearest_method()<CR>', desc = "Test Nearest (DAP)" },
    { "<leader>dtf", '<cmd>lua require("jdtls").test_class()<CR>', desc = "Test Class (DAP)" },
    { "<leader>dlc", '<cmd>Telescope dap commands<CR>', desc = "List Commands" },
    { "<leader>dlf", '<cmd>Telescope dap frames<CR>', desc = "List Frames" },
    { "<leader>dlv", '<cmd>Telescope dap variables<CR>', desc = "List Variables" },
    { "<leader>dlb", '<cmd>Telescope dap list_breakpoints<CR>', desc = "List Breakpoints" },
    { "<leader>dui", '<cmd>lua require("dapui").toggle()<CR>', desc = "Toggle DAP UI" },
    {
      mode = { "v" },
      { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
      { "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = false })<CR>", desc = "Code Format" },
    }
})
EOF

" ==================== key mappings ========================
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'


" ==================== file type ===========================
" Enable file type detection.
" And loading filetype plugin / indent files
filetype plugin indent on

au BufNewFile,BufRead *.lua setlocal et ts=4 sw=4
au BufNewFile,BufRead *.go setlocal et ts=4 sw=4 sts=4
au BufNewFile,BufRead *.java setlocal et ts=4 sw=4
au BufNewFile,BufRead *.json setlocal et ts=2 sw=2
au BufNewFile,BufRead *.md setlocal spell et ts=4 sw=4
au BufNewFile,BufRead *.py setlocal et ts=4 sw=4
au BufNewFile,BufRead *.rs setlocal et ts=4 sw=4
au BufNewFile,BufRead *.txt setlocal spell et ts=4 sw=4
au BufNewFile,BufRead *.yml,*.yaml setlocal et ts=2 sw=2

augroup filetypedetect
  au BufNewFile,BufRead *.avsc,*.code-snippets set filetype=json
  au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  au BufNewFile,BufRead Jenkinsfile set filetype=groovy
augroup END

au FileType gitcommit setlocal spell

" edit binary files with xxd
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END


" ==================== nvim-web-devicons ===================
lua << EOF
require'nvim-web-devicons'.setup{
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
}
EOF


" ==================== bufferline ==========================
lua << EOF
require("bufferline").setup {
  options = {
    numbers = "ordinal",
    }
}
EOF


" ==================== lualine ============================
lua << END
local config = {
  options = {
    icons_enabled = true,
    theme = 'moonlight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- Color for highlights
local colors = {
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
    'lsp_progress',
    display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
    colors = {
      percentage  = colors.cyan,
      title  = colors.cyan,
      message  = colors.cyan,
      spinner = colors.cyan,
      lsp_client_name = colors.magenta,
      use = true,
    },
    separators = {
        component = ' ',
        progress = ' | ',
        message = { pre = '(', post = ')'},
        percentage = { pre = '', post = '%% ' },
        title = { pre = '', post = ': ' },
        lsp_client_name = { pre = '[', post = ']' },
        spinner = { pre = '', post = '' },
        message = { commenced = 'In Progress', completed = 'Completed' },
    },
    display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
    timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
    spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
}

require('lualine').setup(config)
END


" ==================== nvim-tree ===========================
lua << EOF

local function on_nvim_tree_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<c-e>', api.tree.close, opts('Close'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

require'nvim-tree'.setup{
  git = {
    ignore = true,
  },
  filters = {
    dotfiles = false,
    custom = {
      '\\.git',
      '\\.DS_Store',
    },
  },
  view = {
    width=45,
  },
  renderer = {
    group_empty = true
  },
  on_attach = on_nvim_tree_attach,
}
EOF


" ==================== telescope ===========================
lua << EOF
require('telescope').setup{
  defaults = {
    path_display= { "truncate" },
    mappings = {
      i = {
        -- map actions.which_key to ?
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["?"] = "which_key"
      }
    },
    file_ignore_patterns = {
      "^.git/",
      ".DS_Store",
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      find_command = {"rg", "--ignore", "--hidden", "--files"},
      },
    oldfiles = {
      theme = "dropdown",
      },
    live_grep = {
      theme = "dropdown",
      },
    buffers = {
      theme = "dropdown",
      },
    git_branches = {
      theme = "dropdown",
      },
    lsp_references = {
      theme = "dropdown",
      },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
   },
  },
}

require('telescope').load_extension('dap')
require("telescope").load_extension("ui-select")
EOF


" =================== vim-better-whitespace ================
let g:better_whitespace_filetypes_blacklist=['terminal', 'dashboard',
            \'diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive']


" =================== vim-json =============================
let g:vim_json_syntax_conceal = 0


" =================== dashboard-nvim =======================
lua << EOF
require('dashboard').setup({
    theme = 'hyper',
    config = {
      week_header = {
       enable = true,
      },
      shortcut = {
        {
           desc = ' Find files',
           group = 'Number',
           action = 'Telescope find_files',
           key = 'f'
        },
        {
           desc = ' Live Grep',
           group = 'Number',
           action = 'Telescope live_grep',
           key = 'g'
        },
        {
           desc = ' Recent files',
           group = 'Number',
           action = 'Telescope oldfiles',
           key = 'r'
        },
        {
           desc = ' Pull Requests',
           group = 'Number',
           action = 'Octo pr list',
           key = 'p'
        },
        {
           desc = ' Dot Files',
           group = 'Number',
           action = 'Telescope find_files cwd=~/dotfiles',
           key = '.'
        },
        {
           desc = ' init.vim',
           group = 'Number',
           action = 'Telescope find_files cwd=~/.config/nvim follow=true',
           key = 'i'
        },
        {
           desc = ' Check Health',
           group = 'Number',
           action = 'checkhealth',
           key = 'c'
        },
      },
      packages = { enable = true },
      project = { limit = 8, icon = 'Projects', label = '', action = 'Telescope find_files cwd=' },
      mru = { limit = 10, icon = 'Recent Files', label = '', },
      footer = {},
    },
  })
EOF


" =================== nvim-treesitter  =====================
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "lua", "vimdoc", "java", "vim", "bash" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled

    -- disable java parser since it's too slow
    disable = { "java"  },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,

  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<cr>",
      scope_incremental = "<cr>",
      node_incremental = "<tab>",
      node_decremental = "<s-tab>",
    },
  },
}
EOF


" =================== outline =============================
lua << EOF
require("outline").setup({
  outline_window = {
    -- Where to open the split window: right/left
    position = 'right',
    -- The default split commands used are 'topleft vs' and 'botright vs'
    -- depending on `position`. You can change this by providing your own
    -- `split_command`.
    -- `position` will not be considered if `split_command` is non-nil.
    -- This should be a valid vim command used for opening the split for the
    -- outline window. Eg, 'rightbelow vsplit'.
    split_command = nil,

    -- Percentage or integer of columns
    width = 35,
    -- Whether width is relative to the total width of nvim
    -- When relative_width = true, this means take 25% of the total
    -- screen width for outline window.
    relative_width = true,

    -- Auto close the outline window if goto_location is triggered and not for
    -- peek_location
    auto_close = false,
    -- Automatically scroll to the location in code when navigating outline window.
    auto_jump = false,
    -- boolean or integer for milliseconds duration to apply a temporary highlight
    -- when jumping. false to disable.
    jump_highlight_duration = 300,
    -- Whether to center the cursor line vertically in the screen when
    -- jumping/focusing. Executes zz.
    center_on_jump = true,

    -- Vim options for the outline window
    show_numbers = false,
    show_relative_numbers = false,
    wrap = false,

    -- true/false/'focus_in_outline'/'focus_in_code'.
    -- The last two means only show cursorline when the focus is in outline/code.
    -- 'focus_in_outline' can be used if the outline_items.auto_set_cursor
    -- operations are too distracting due to visual contrast caused by cursorline.
    show_cursorline = true,
    -- Enable this only if you enabled cursorline so your cursor color can
    -- blend with the cursorline, in effect, as if your cursor is hidden
    -- in the outline window.
    -- This makes your line of cursor have the same color as if the cursor
    -- wasn't focused on the outline window.
    -- This feature is experimental.
    hide_cursor = false,

    -- Whether to auto-focus on the outline window when it is opened.
    -- Set to false to *always* retain focus on your previous buffer when opening
    -- outline.
    -- If you enable this you can still use bangs in :Outline! or :OutlineOpen! to
    -- retain focus on your code. If this is false, retaining focus will be
    -- enforced for :Outline/:OutlineOpen and you will not be able to have the
    -- other behaviour.
    focus_on_open = true,
    -- Winhighlight option for outline window.
    -- See :help 'winhl'
    -- To change background color to "CustomHl" for example, use "Normal:CustomHl".
    winhl = '',
  },

  outline_items = {
    -- Show extra details with the symbols (lsp dependent) as virtual next
    show_symbol_details = true,
    -- Show corresponding line numbers of each symbol on the left column as
    -- virtual text, for quick navigation when not focused on outline.
    -- Why? See this comment:
    -- https://github.com/simrat39/symbols-outline.nvim/issues/212#issuecomment-1793503563
    show_symbol_lineno = false,
    -- Whether to highlight the currently hovered symbol and all direct parents
    highlight_hovered_item = true,
    -- Whether to automatically set cursor location in outline to match
    -- location in code when focus is in code. If disabled you can use
    -- `:OutlineFollow[!]` from any window or `<C-g>` from outline window to
    -- trigger this manually.
    auto_set_cursor = true,
    -- Autocmd events to automatically trigger these operations.
    auto_update_events = {
      -- Includes both setting of cursor and highlighting of hovered item.
      -- The above two options are respected.
      -- This can be triggered manually through `follow_cursor` lua API,
      -- :OutlineFollow command, or <C-g>.
      follow = { 'CursorMoved' },
      -- Re-request symbols from the provider.
      -- This can be triggered manually through `refresh_outline` lua API, or
      -- :OutlineRefresh command.
      items = { 'InsertLeave', 'WinEnter', 'BufEnter', 'BufWinEnter', 'TabEnter', 'BufWritePost' },
    },
  },

  -- Options for outline guides which help show tree hierarchy of symbols
  guides = {
    enabled = true,
    markers = {
      -- It is recommended for bottom and middle markers to use the same number
      -- of characters to align all child nodes vertically.
      bottom = '└',
      middle = '├',
      vertical = '│',
    },
  },

  symbol_folding = {
    -- Depth past which nodes will be folded by default. Set to false to unfold all on open.
    autofold_depth = 1,
    -- When to auto unfold nodes
    auto_unfold = {
      -- Auto unfold currently hovered symbol
      hovered = true,
      -- Auto fold when the root level only has this many nodes.
      -- Set true for 1 node, false for 0.
      only = true,
    },
    markers = { '', '' },
  },

  preview_window = {
    -- Automatically open preview of code location when navigating outline window
    auto_preview = false,
    -- Automatically open hover_symbol when opening preview (see keymaps for
    -- hover_symbol).
    -- If you disable this you can still open hover_symbol using your keymap
    -- below.
    open_hover_on_preview = false,
    width = 50,     -- Percentage or integer of columns
    min_width = 50, -- This is the number of columns
    -- Whether width is relative to the total width of nvim.
    -- When relative_width = true, this means take 50% of the total
    -- screen width for preview window, ensure the result width is at least 50
    -- characters wide.
    relative_width = true,
    -- Border option for floating preview window.
    -- Options include: single/double/rounded/solid/shadow or an array of border
    -- characters.
    -- See :help nvim_open_win() and search for "border" option.
    border = 'single',
    -- winhl options for the preview window, see ':h winhl'
    winhl = 'NormalFloat:',
    -- Pseudo-transparency of the preview window, see ':h winblend'
    winblend = 0,
    -- Experimental feature that let's you edit the source content live
    -- in the preview window. Like VS Code's "peek editor".
    live = false
  },

  -- These keymaps can be a string or a table for multiple keys.
  -- Set to `{}` to disable. (Using 'nil' will fallback to default keys)
  keymaps = {
    show_help = '?',
    close = {'<Esc>', 'q'},
    -- Jump to symbol under cursor.
    -- It can auto close the outline window when triggered, see
    -- 'auto_close' option above.
    goto_location = '<Cr>',
    -- Jump to symbol under cursor but keep focus on outline window.
    peek_location = 'o',
    -- Visit location in code and close outline immediately
    goto_and_close = '<S-Cr>',
    -- Change cursor position of outline window to match current location in code.
    -- 'Opposite' of goto/peek_location.
    restore_location = '<C-g>',
    -- Open LSP/provider-dependent symbol hover information
    hover_symbol = '<C-space>',
    -- Preview location code of the symbol under cursor
    toggle_preview = 'K',
    rename_symbol = 'r',
    code_actions = 'a',
    -- These fold actions are collapsing tree nodes, not code folding
    fold = 'h',
    unfold = 'l',
    fold_toggle = '<Tab>',
    -- Toggle folds for all nodes.
    -- If at least one node is folded, this action will fold all nodes.
    -- If all nodes are folded, this action will unfold all nodes.
    fold_toggle_all = '<S-Tab>',
    fold_all = 'W',
    unfold_all = 'E',
    fold_reset = 'R',
    -- Move down/up by one line and peek_location immediately.
    -- You can also use outline_window.auto_jump=true to do this for any
    -- j/k/<down>/<up>.
    down_and_jump = '<C-j>',
    up_and_jump = '<C-k>',
  },

  providers = {
    priority = { 'lsp', 'coc', 'markdown', 'norg' },
    -- Configuration for each provider (3rd party providers are supported)
    lsp = {
      -- Lsp client names to ignore
      blacklist_clients = {},
    },
    markdown = {
      -- List of supported ft's to use the markdown provider
      filetypes = {'markdown'},
    },
  },

  symbols = {
    -- Filter by kinds (string) for symbols in the outline.
    -- Possible kinds are the Keys in the icons table below.
    -- A filter list is a string[] with an optional exclude (boolean) field.
    -- The symbols.filter option takes either a filter list or ft:filterList
    -- key-value pairs.
    -- Put  exclude=true  in the string list to filter by excluding the list of
    -- kinds instead.
    -- Include all except String and Constant:
    --   filter = { 'String', 'Constant', exclude = true }
    -- Only include Package, Module, and Function:
    --   filter = { 'Package', 'Module', 'Function' }
    -- See more examples below.
    filter = nil,

    -- You can use a custom function that returns the icon for each symbol kind.
    -- This function takes a kind (string) as parameter and should return an
    -- icon as string.
    icon_fetcher = nil,
    -- 3rd party source for fetching icons. Fallback if icon_fetcher returned
    -- empty string. Currently supported values: 'lspkind'
    icon_source = nil,
    -- The next fallback if both icon_fetcher and icon_source has failed, is
    -- the custom mapping of icons specified below. The icons table is also
    -- needed for specifying hl group.
    icons = {
      File = { icon = '', hl = 'Identifier' },
      Module = { icon = '', hl = 'Include' },
      Namespace = { icon = '󰅪', hl = 'Include' },
      Package = { icon = '󰏗', hl = 'Include' },
      Class = { icon = '𝓒', hl = 'Type' },
      Method = { icon = 'ƒ', hl = 'Function' },
      Property = { icon = '', hl = 'Identifier' },
      Field = { icon = '󰆨', hl = 'Identifier' },
      Constructor = { icon = '', hl = 'Special' },
      Enum = { icon = 'ℰ', hl = 'Type' },
      Interface = { icon = '󰜰', hl = 'Type' },
      Function = { icon = '', hl = 'Function' },
      Variable = { icon = '', hl = 'Constant' },
      Constant = { icon = '', hl = 'Constant' },
      String = { icon = '𝓐', hl = 'String' },
      Number = { icon = '#', hl = 'Number' },
      Boolean = { icon = '⊨', hl = 'Boolean' },
      Array = { icon = '󰅪', hl = 'Constant' },
      Object = { icon = '⦿', hl = 'Type' },
      Key = { icon = '🔐', hl = 'Type' },
      Null = { icon = 'NULL', hl = 'Type' },
      EnumMember = { icon = '', hl = 'Identifier' },
      Struct = { icon = '𝓢', hl = 'Structure' },
      Event = { icon = '🗲', hl = 'Type' },
      Operator = { icon = '+', hl = 'Identifier' },
      TypeParameter = { icon = '𝙏', hl = 'Identifier' },
      Component = { icon = '󰅴', hl = 'Function' },
      Fragment = { icon = '󰅴', hl = 'Constant' },
      TypeAlias = { icon = ' ', hl = 'Type' },
      Parameter = { icon = ' ', hl = 'Identifier' },
      StaticMethod = { icon = ' ', hl = 'Function' },
      Macro = { icon = ' ', hl = 'Function' },
    },
  },
})
EOF


" =================== gitsigns =============================
lua << EOF
require('gitsigns').setup {
  signs = {
    add          = { text = '+' },
    change       = { text = '+' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}
EOF

" =================== hover ===============================
lua << EOF

require("hover").setup {
  init = function()
      -- Require providers
      require("hover.providers.lsp")
      -- require('hover.providers.gh')
      -- require('hover.providers.gh_user')
      -- require('hover.providers.jira')
      -- require('hover.providers.man')
      -- require('hover.providers.dictionary')
  end,
  preview_opts = {
      border = 'single'
  },
  -- Whether the contents of a currently open hover window should be moved
  -- to a :h preview-window when pressing the hover keymap.
  preview_window = false,
  title = true,
  mouse_providers = {
      'LSP'
  },
  mouse_delay = 1000
}

-- Setup keymaps
-- vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
-- vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
-- vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("previous") end, {desc = "hover.nvim (previous source)"})
-- vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end, {desc = "hover.nvim (next source)"})

-- Mouse support
vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
vim.o.mousemoveevent = true
EOF


" =================== diffview =============================
lua << EOF
local actions = require("diffview.actions")

require("diffview").setup({
  diff_binaries = false,    -- Show diffs for binaries
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  git_cmd = { "git" },      -- The git executable followed by default args.
  use_icons = true,         -- Requires nvim-web-devicons
  show_help_hints = true,   -- Show hints for how to open the help panel
  watch_index = true,       -- Update views and index buffers when the git index changes.
  icons = {                 -- Only applies when use_icons is true.
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
    done = "✓",
  },
  view = {
    -- Configure the layout and behavior of different types of views.
    -- Available layouts:
    --  'diff1_plain'
    --    |'diff2_horizontal'
    --    |'diff2_vertical'
    --    |'diff3_horizontal'
    --    |'diff3_vertical'
    --    |'diff3_mixed'
    --    |'diff4_mixed'
    -- For more info, see ':h diffview-config-view.x.layout'.
    default = {
      -- Config for changed files, and staged files in diff views.
      layout = "diff2_horizontal",
      winbar_info = false,          -- See ':h diffview-config-view.x.winbar_info'
    },
    merge_tool = {
      -- Config for conflicted files in diff views during a merge or rebase.
      layout = "diff3_horizontal",
      disable_diagnostics = true,   -- Temporarily disable diagnostics for conflict buffers while in the view.
      winbar_info = true,           -- See ':h diffview-config-view.x.winbar_info'
    },
    file_history = {
      -- Config for changed files in file history views.
      layout = "diff2_horizontal",
      winbar_info = false,          -- See ':h diffview-config-view.x.winbar_info'
    },
  },
  file_panel = {
    listing_style = "tree",             -- One of 'list' or 'tree'
    tree_options = {                    -- Only applies when listing_style is 'tree'
      flatten_dirs = true,              -- Flatten dirs that only contain one single dir
      folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
    },
    win_config = {                      -- See ':h diffview-config-win_config'
      position = "left",
      width = 35,
      win_opts = {}
    },
  },
  file_history_panel = {
    log_options = {   -- See ':h diffview-config-log_options'
      git = {
        single_file = {
          diff_merges = "combined",
        },
        multi_file = {
          diff_merges = "first-parent",
        },
      },
      hg = {
        single_file = {},
        multi_file = {},
      },
    },
    win_config = {    -- See ':h diffview-config-win_config'
      position = "bottom",
      height = 16,
      win_opts = {}
    },
  },
  commit_log_panel = {
    win_config = {   -- See ':h diffview-config-win_config'
      win_opts = {},
    }
  },
  default_args = {    -- Default args prepended to the arg-list for the listed commands
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {},         -- See ':h diffview-config-hooks'
  keymaps = {
    disable_defaults = false, -- Disable the default keymaps
    view = {
      -- The `view` bindings are active in the diff buffers, only when the current
      -- tabpage is a Diffview.
      { "n", "<tab>",      actions.select_next_entry,          { desc = "Open the diff for the next file" } },
      { "n", "<s-tab>",    actions.select_prev_entry,          { desc = "Open the diff for the previous file" } },
      { "n", "gf",         actions.goto_file,                  { desc = "Open the file in a new split in the previous tabpage" } },
      { "n", "<C-w><C-f>", actions.goto_file_split,            { desc = "Open the file in a new split" } },
      { "n", "<C-w>gf",    actions.goto_file_tab,              { desc = "Open the file in a new tabpage" } },
      { "n", "<leader>e",  actions.focus_files,                { desc = "Bring focus to the file panel" } },
      { "n", "<leader>b",  actions.toggle_files,               { desc = "Toggle the file panel." } },
      { "n", "g<C-x>",     actions.cycle_layout,               { desc = "Cycle through available layouts." } },
      { "n", "[x",         actions.prev_conflict,              { desc = "In the merge-tool: jump to the previous conflict" } },
      { "n", "]x",         actions.next_conflict,              { desc = "In the merge-tool: jump to the next conflict" } },
      { "n", "<leader>co", actions.conflict_choose("ours"),    { desc = "Choose the OURS version of a conflict" } },
      { "n", "<leader>ct", actions.conflict_choose("theirs"),  { desc = "Choose the THEIRS version of a conflict" } },
      { "n", "<leader>cb", actions.conflict_choose("base"),    { desc = "Choose the BASE version of a conflict" } },
      { "n", "<leader>ca", actions.conflict_choose("all"),     { desc = "Choose all the versions of a conflict" } },
      { "n", "dx",         actions.conflict_choose("none"),    { desc = "Delete the conflict region" } },
    },
    diff1 = {
      -- Mappings in single window diff layouts
      { "n", "g?", actions.help({ "view", "diff1" }), { desc = "Open the help panel" } },
    },
    diff2 = {
      -- Mappings in 2-way diff layouts
      { "n", "g?", actions.help({ "view", "diff2" }), { desc = "Open the help panel" } },
    },
    diff3 = {
      -- Mappings in 3-way diff layouts
      { { "n", "x" }, "2do",  actions.diffget("ours"),            { desc = "Obtain the diff hunk from the OURS version of the file" } },
      { { "n", "x" }, "3do",  actions.diffget("theirs"),          { desc = "Obtain the diff hunk from the THEIRS version of the file" } },
      { "n",          "g?",   actions.help({ "view", "diff3" }),  { desc = "Open the help panel" } },
    },
    diff4 = {
      -- Mappings in 4-way diff layouts
      { { "n", "x" }, "1do",  actions.diffget("base"),            { desc = "Obtain the diff hunk from the BASE version of the file" } },
      { { "n", "x" }, "2do",  actions.diffget("ours"),            { desc = "Obtain the diff hunk from the OURS version of the file" } },
      { { "n", "x" }, "3do",  actions.diffget("theirs"),          { desc = "Obtain the diff hunk from the THEIRS version of the file" } },
      { "n",          "g?",   actions.help({ "view", "diff4" }),  { desc = "Open the help panel" } },
    },
    file_panel = {
      { "n", "j",             actions.next_entry,           { desc = "Bring the cursor to the next file entry" } },
      { "n", "<down>",        actions.next_entry,           { desc = "Bring the cursor to the next file entry" } },
      { "n", "k",             actions.prev_entry,           { desc = "Bring the cursor to the previous file entry." } },
      { "n", "<up>",          actions.prev_entry,           { desc = "Bring the cursor to the previous file entry." } },
      { "n", "<cr>",          actions.select_entry,         { desc = "Open the diff for the selected entry." } },
      { "n", "o",             actions.select_entry,         { desc = "Open the diff for the selected entry." } },
      { "n", "<2-LeftMouse>", actions.select_entry,         { desc = "Open the diff for the selected entry." } },
      { "n", "-",             actions.toggle_stage_entry,   { desc = "Stage / unstage the selected entry." } },
      { "n", "S",             actions.stage_all,            { desc = "Stage all entries." } },
      { "n", "U",             actions.unstage_all,          { desc = "Unstage all entries." } },
      { "n", "X",             actions.restore_entry,        { desc = "Restore entry to the state on the left side." } },
      { "n", "L",             actions.open_commit_log,      { desc = "Open the commit log panel." } },
      { "n", "<c-b>",         actions.scroll_view(-0.25),   { desc = "Scroll the view up" } },
      { "n", "<c-f>",         actions.scroll_view(0.25),    { desc = "Scroll the view down" } },
      { "n", "<tab>",         actions.select_next_entry,    { desc = "Open the diff for the next file" } },
      { "n", "<s-tab>",       actions.select_prev_entry,    { desc = "Open the diff for the previous file" } },
      { "n", "gf",            actions.goto_file,            { desc = "Open the file in a new split in the previous tabpage" } },
      { "n", "<C-w><C-f>",    actions.goto_file_split,      { desc = "Open the file in a new split" } },
      { "n", "<C-w>gf",       actions.goto_file_tab,        { desc = "Open the file in a new tabpage" } },
      { "n", "i",             actions.listing_style,        { desc = "Toggle between 'list' and 'tree' views" } },
      { "n", "f",             actions.toggle_flatten_dirs,  { desc = "Flatten empty subdirectories in tree listing style." } },
      { "n", "R",             actions.refresh_files,        { desc = "Update stats and entries in the file list." } },
      { "n", "<leader>e",     actions.focus_files,          { desc = "Bring focus to the file panel" } },
      { "n", "<leader>b",     actions.toggle_files,         { desc = "Toggle the file panel" } },
      { "n", "g<C-x>",        actions.cycle_layout,         { desc = "Cycle available layouts" } },
      { "n", "[x",            actions.prev_conflict,        { desc = "Go to the previous conflict" } },
      { "n", "]x",            actions.next_conflict,        { desc = "Go to the next conflict" } },
      { "n", "g?",            actions.help("file_panel"),   { desc = "Open the help panel" } },
    },
    file_history_panel = {
      { "n", "g!",            actions.options,                     { desc = "Open the option panel" } },
      { "n", "<C-A-d>",       actions.open_in_diffview,            { desc = "Open the entry under the cursor in a diffview" } },
      { "n", "y",             actions.copy_hash,                   { desc = "Copy the commit hash of the entry under the cursor" } },
      { "n", "L",             actions.open_commit_log,             { desc = "Show commit details" } },
      { "n", "zR",            actions.open_all_folds,              { desc = "Expand all folds" } },
      { "n", "zM",            actions.close_all_folds,             { desc = "Collapse all folds" } },
      { "n", "j",             actions.next_entry,                  { desc = "Bring the cursor to the next file entry" } },
      { "n", "<down>",        actions.next_entry,                  { desc = "Bring the cursor to the next file entry" } },
      { "n", "k",             actions.prev_entry,                  { desc = "Bring the cursor to the previous file entry." } },
      { "n", "<up>",          actions.prev_entry,                  { desc = "Bring the cursor to the previous file entry." } },
      { "n", "<cr>",          actions.select_entry,                { desc = "Open the diff for the selected entry." } },
      { "n", "o",             actions.select_entry,                { desc = "Open the diff for the selected entry." } },
      { "n", "<2-LeftMouse>", actions.select_entry,                { desc = "Open the diff for the selected entry." } },
      { "n", "<c-b>",         actions.scroll_view(-0.25),          { desc = "Scroll the view up" } },
      { "n", "<c-f>",         actions.scroll_view(0.25),           { desc = "Scroll the view down" } },
      { "n", "<tab>",         actions.select_next_entry,           { desc = "Open the diff for the next file" } },
      { "n", "<s-tab>",       actions.select_prev_entry,           { desc = "Open the diff for the previous file" } },
      { "n", "gf",            actions.goto_file,                   { desc = "Open the file in a new split in the previous tabpage" } },
      { "n", "<C-w><C-f>",    actions.goto_file_split,             { desc = "Open the file in a new split" } },
      { "n", "<C-w>gf",       actions.goto_file_tab,               { desc = "Open the file in a new tabpage" } },
      { "n", "<leader>e",     actions.focus_files,                 { desc = "Bring focus to the file panel" } },
      { "n", "<leader>b",     actions.toggle_files,                { desc = "Toggle the file panel" } },
      { "n", "g<C-x>",        actions.cycle_layout,                { desc = "Cycle available layouts" } },
      { "n", "g?",            actions.help("file_history_panel"),  { desc = "Open the help panel" } },
    },
    option_panel = {
      { "n", "<tab>", actions.select_entry,          { desc = "Change the current option" } },
      { "n", "q",     actions.close,                 { desc = "Close the panel" } },
      { "n", "g?",    actions.help("option_panel"),  { desc = "Open the help panel" } },
    },
    help_panel = {
      { "n", "q",     actions.close,  { desc = "Close help menu" } },
      { "n", "<esc>", actions.close,  { desc = "Close help menu" } },
    },
  },
})
EOF


" =================== vim-markdown =========================

" disable folding
let g:vim_markdown_folding_disabled = 1

" Allow for the TOC window to auto-fit when it's possible for it to shrink.
" It never increases its default size (half screen), it only shrinks.
let g:vim_markdown_toc_autofit = 1

" Disable conceal
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Allow the ge command to follow named anchors in links of the form
" file#anchor or just #anchor, where file may omit the .md extension as usual
let g:vim_markdown_follow_anchor = 1

" highlight frontmatter
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1


" =================== glow =================================
lua << EOF
require('glow').setup()
EOF


" =================== octo ================================
lua << EOF
require"octo".setup({
  default_remote = {"upstream", "origin"}; -- order to try remotes
  reaction_viewer_hint_icon = "";         -- marker for user reactions
  user_icon = " ";                        -- user icon
  timeline_marker = "";                   -- timeline marker
  timeline_indent = "2";                   -- timeline indentation
  right_bubble_delimiter = "";            -- Bubble delimiter
  left_bubble_delimiter = "";             -- Bubble delimiter
  github_hostname = "";                    -- GitHub Enterprise host
  gh_env = {
      http_proxy = vim.env.http_proxy,
      https_proxy = vim.env.https_proxy,
      no_proxy = vim.env.no_proxy,
  };
  snippet_context_lines = 4;               -- number or lines around commented lines
  file_panel = {
    size = 10,                             -- changed files panel rows
    use_icons = true                       -- use web-devicons in file panel
  },
   suppress_missing_scope = {
    projects_v2 = true,
  },
  mappings = {
    issue = {
      close_issue = "<space>ic",           -- close issue
      reopen_issue = "<space>io",          -- reopen issue
      list_issues = "<space>il",           -- list open issues on same repo
      reload = "<C-r>",                    -- reload issue
      open_in_browser = "<C-b>",           -- open issue in browser
      copy_url = "<C-y>",                  -- copy url to system clipboard
      add_assignee = "<space>aa",          -- add assignee
      remove_assignee = "<space>ad",       -- remove assignee
      create_label = "<space>lc",          -- create label
      add_label = "<space>la",             -- add label
      remove_label = "<space>ld",          -- remove label
      goto_issue = "<space>gi",            -- navigate to a local repo issue
      add_comment = "<space>ca",           -- add comment
      delete_comment = "<space>cd",        -- delete comment
      next_comment = "]c",                 -- go to next comment
      prev_comment = "[c",                 -- go to previous comment
      react_hooray = "<space>rp",          -- add/remove 🎉 reaction
      react_heart = "<space>rh",           -- add/remove ❤️ reaction
      react_eyes = "<space>re",            -- add/remove 👀 reaction
      react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
      react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
      react_rocket = "<space>rr",          -- add/remove 🚀 reaction
      react_laugh = "<space>rl",           -- add/remove 😄 reaction
      react_confused = "<space>rc",        -- add/remove 😕 reaction
    },
    pull_request = {
      checkout_pr = "<space>po",           -- checkout PR
      merge_pr = "<space>pm",              -- merge PR
      list_commits = "<space>pc",          -- list PR commits
      list_changed_files = "<space>pf",    -- list PR changed files
      show_pr_diff = "<space>pd",          -- show PR diff
      add_reviewer = "<space>va",          -- add reviewer
      remove_reviewer = "<space>vd",       -- remove reviewer request
      close_issue = "<space>ic",           -- close PR
      reopen_issue = "<space>io",          -- reopen PR
      list_issues = "<space>il",           -- list open issues on same repo
      reload = "<C-r>",                    -- reload PR
      open_in_browser = "<C-b>",           -- open PR in browser
      copy_url = "<C-y>",                  -- copy url to system clipboard
      add_assignee = "<space>aa",          -- add assignee
      remove_assignee = "<space>ad",       -- remove assignee
      create_label = "<space>lc",          -- create label
      add_label = "<space>la",             -- add label
      remove_label = "<space>ld",          -- remove label
      goto_issue = "<space>gi",            -- navigate to a local repo issue
      add_comment = "<space>ca",           -- add comment
      delete_comment = "<space>cd",        -- delete comment
      next_comment = "]c",                 -- go to next comment
      prev_comment = "[c",                 -- go to previous comment
      react_hooray = "<space>rp",          -- add/remove 🎉 reaction
      react_heart = "<space>rh",           -- add/remove ❤️ reaction
      react_eyes = "<space>re",            -- add/remove 👀 reaction
      react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
      react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
      react_rocket = "<space>rr",          -- add/remove 🚀 reaction
      react_laugh = "<space>rl",           -- add/remove 😄 reaction
      react_confused = "<space>rc",        -- add/remove 😕 reaction
    },
    review_thread = {
      goto_issue = "<space>gi",            -- navigate to a local repo issue
      add_comment = "<space>ca",           -- add comment
      add_suggestion = "<space>sa",        -- add suggestion
      delete_comment = "<space>cd",        -- delete comment
      next_comment = "]c",                 -- go to next comment
      prev_comment = "[c",                 -- go to previous comment
      select_next_entry = "]q",            -- move to previous changed file
      select_prev_entry = "[q",            -- move to next changed file
      close_review_tab = "<C-c>",          -- close review tab
      react_hooray = "<space>rp",          -- add/remove 🎉 reaction
      react_heart = "<space>rh",           -- add/remove ❤️ reaction
      react_eyes = "<space>re",            -- add/remove 👀 reaction
      react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
      react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
      react_rocket = "<space>rr",          -- add/remove 🚀 reaction
      react_laugh = "<space>rl",           -- add/remove 😄 reaction
      react_confused = "<space>rc",        -- add/remove 😕 reaction
    },
    submit_win = {
      approve_review = "<C-a>",            -- approve review
      comment_review = "<C-m>",            -- comment review
      request_changes = "<C-r>",           -- request changes review
      close_review_tab = "<C-c>",          -- close review tab
    },
    review_diff = {
      add_review_comment = "<space>ca",    -- add a new review comment
      add_review_suggestion = "<space>sa", -- add a new review suggestion
      focus_files = "<leader>e",           -- move focus to changed file panel
      toggle_files = "<leader>b",          -- hide/show changed files panel
      next_thread = "]t",                  -- move to next thread
      prev_thread = "[t",                  -- move to previous thread
      select_next_entry = "]q",            -- move to previous changed file
      select_prev_entry = "[q",            -- move to next changed file
      close_review_tab = "<C-c>",          -- close review tab
      toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
    },
    file_panel = {
      next_entry = "j",                    -- move to next changed file
      prev_entry = "k",                    -- move to previous changed file
      select_entry = "<cr>",               -- show selected changed file diffs
      refresh_files = "R",                 -- refresh changed files panel
      focus_files = "<leader>e",           -- move focus to changed file panel
      toggle_files = "<leader>b",          -- hide/show changed files panel
      select_next_entry = "]q",            -- move to previous changed file
      select_prev_entry = "[q",            -- move to next changed file
      close_review_tab = "<C-c>",          -- close review tab
      toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
    }
  }
})
EOF


" =================== lspconfig ============================


" =================== clangd ===============================
if executable('clangd')
lua << EOF
require'lspconfig'.clangd.setup{}
EOF
else
  echo "You might want to install clangd: https://clangd.llvm.org/installation.html"
endif


" =================== pyright ==============================
if executable('pyright')
lua << EOF
require'lspconfig'.pyright.setup{}
EOF
else
  echo "You might want to install pyright: npm install pyright"
endif


" =================== ts_ls ================================
if executable('tsserver')
lua << EOF
require'lspconfig'.ts_ls.setup{}
EOF
else
  echo "You might want to install tsserver: yarn global add typescript typescript-language-server"
endif


" =================== yaml-language-server =================
if executable('yaml-language-server')
lua << EOF
require'lspconfig'.yamlls.setup{}
EOF
else
  echo "You might want to install yaml-language-server"
endif


" =================== json-language-server =================
if executable('vscode-json-language-server')
lua << EOF

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.jsonls.setup{
  capabilities = capabilities,
  settings = {
    json = {
     schemas = {
       {
         description = 'BBDS JSON schema',
         fileMatch = { 'com.bloomberg.*.json' },
         url = vim.env.HOME ..  '/bbgithub.com/jmullins31/bbds-local/.vscode/bbds-json-schema.json',
       },
     },
     validate = { enable = true },
    }
  }
}
EOF
else
  echo "You might want to install vscode-json-language-server"
endif


" =================== bash-language-server =================
if executable('bash-language-server')
lua << EOF
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end,
})
EOF
else
  echo "You might want to install bash-language-server"
endif


" =================== rust-tools ===========================
if executable('rust-analyzer')
lua << EOF
-- monkeypatch rust-tools to correctly detect our custom rust-analyzer
require'rust-tools.utils.utils'.is_ra_server = function (client)
  local name = client.name
  local target = "rust_analyzer"
  return string.sub(client.name, 1, string.len(target)) == target
    or client.name == "rust_analyzer-standalone"
end

-- Configure LSP through rust-tools.nvim plugin, with lots of bonus
-- content for Hubris compatibility
local cache = {}
local clients = {}
require'rust-tools'.setup{
  tools = { -- rust-tools options
    autoSetHints = true,
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
      -- do other configuration here as desired
    },
  },

  server = {
    on_new_config = function(new_config, new_root_dir)
      local bufnr = vim.api.nvim_get_current_buf()
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      local dir = new_config.root_dir()
      if string.find(dir, "hubris") then
        -- Run `xtask lsp` for the target file, which gives us a JSON
        -- dictionary with bonus configuration.
        local prev_cwd = vim.fn.getcwd()
        vim.cmd("cd " .. dir)
        local cmd = dir .. "/target/debug/xtask lsp "
        -- Notify `xtask lsp` of existing clients in the CLI invocation,
        -- so it can check against them first (which would mean a faster
        -- attach)
        for _,v in pairs(clients) do
          local c = vim.fn.escape(vim.json.encode(v), '"')
          cmd = cmd .. '-c"' .. c .. '" '
        end
        local handle = io.popen(cmd .. bufname)
        handle:flush()
        local result = handle:read("*a")
        handle:close()
        vim.cmd("cd " .. prev_cwd)

        -- If `xtask` doesn't know about `lsp`, then it will print an error to
        -- stderr and return nothing on stdout.
        if result == "" then
          vim.notify("recompile `xtask` for `lsp` support", vim.log.levels.WARN)
        end

        -- If the given file should be handled with special care, then
        -- we give the rust-analyzer client a custom name (to prevent
        -- multiple buffers from attaching to it), then cache the JSON in
        -- a local variable for use in `on_attach`
        local json = vim.json.decode(result)
        if json["Ok"] ~= nil then
          new_config.name = "rust_analyzer_" .. json.Ok.hash
          cache[bufnr] = json
          table.insert(clients, {toml = json.Ok.app, task = json.Ok.task})
        else
          -- TODO:
          -- vim.notify(vim.inspect(json.Err), vim.log.levels.ERROR)
        end
      end
    end,

    on_attach = function(client, bufnr)
      local json = cache[bufnr]
      if json ~= nil then
        local config = vim.deepcopy(client.config)
        local ra = config.settings["rust-analyzer"]
        -- Do rust-analyzer builds in a separate folder to avoid blocking
        -- the main build with a file lock.
        table.insert(json.Ok.buildOverrideCommand, "--target-dir")
        table.insert(json.Ok.buildOverrideCommand, "target/rust-analyzer")
        ra.cargo = {
          extraEnv = json.Ok.extraEnv,
          features = json.Ok.features,
          noDefaultFeatures = true,
          target = json.Ok.target,
          buildScripts = {
            overrideCommand = json.Ok.buildOverrideCommand,
          },
        }
        ra.check = {
          overrideCommand = json.Ok.buildOverrideCommand,
        }
        config.lspinfo = function()
          return { "Hubris app:      " .. json.Ok.app,
                   "Hubris task:     " .. json.Ok.task }
        end
        client.config = config
      end
    end,

    settings = {
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
          extraArgs = { '--target-dir', 'target/rust-analyzer' },
        },
        diagnostics = {
          disabled = {"inactive-code"},
        },
      }
    }
  },
}
EOF
else
  echo "You might want to install rust-analyzer"
endif


" =================== nvim-cmp ============================
lua << EOF
-- Add additional capabilities supported by nvim-cmp
local nvim_lsp = require'lspconfig'
local cmp = require'cmp'

cmp.setup ({
  snippet = {
    -- Enable LSP snippets
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-c>'] = cmp.mapping.close(),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<S-TAB>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
    --{ name = 'cmdline' },
    { name = 'spell' },
  },
})


vim.opt.spelllang = { 'en_us' }

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'pyright', 'rust_analyzer', 'ts_ls', 'yamlls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
  }
end

EOF

" =================== trouble.nvim =========================
lua << EOF
  require("trouble").setup {
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- previous item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}
EOF


" =================== lsp_signature.nvim ===================
lua << EOF
 cfg = {
  debug = false, -- set to true to enable debug logging
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
  -- default is  ~/.cache/nvim/lsp_signature.log
  verbose = false, -- show debug line number

  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you DO NOT want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode, 10 by default

  max_height = 12, -- max height of signature floating_window
  max_width = 80, -- max_width of signature floating_window
  noice = false, -- set to true if you using noice to render markdown
  wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long

  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap

  floating_window_off_x = 1, -- adjust float windows x position.
                             -- can be either a number or function
  floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
                              -- can be either number or function, see examples

  close_timeout = 4000, -- close floating window after ms when laster parameter is entered
  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
  hint_scheme = "String",
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  handler_opts = {
    border = "rounded"   -- double, rounded, single, shadow, none, or a table of borders
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  transparency = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'

  select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
  move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
}

-- recommended:
require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key
EOF


" =================== dap-ui ===============================
lua << EOF
require('dapui').setup {
}

-- automatically open and close dap-ui
--local dap, dapui = require("dap"), require("dapui")
--dap.listeners.before.attach.dapui_config = function()
--  dapui.open()
--end
--dap.listeners.before.launch.dapui_config = function()
--  dapui.open()
--end
--dap.listeners.before.event_terminated.dapui_config = function()
--  dapui.close()
--end
--dap.listeners.before.event_exited.dapui_config = function()
--  dapui.close()
--end
EOF

" =================== nvim-ide ============================
lua << EOF
local bufferlist      = require('ide.components.bufferlist')
local explorer        = require('ide.components.explorer')
local outline         = require('ide.components.outline')
local callhierarchy   = require('ide.components.callhierarchy')
local timeline        = require('ide.components.timeline')
local terminal        = require('ide.components.terminal')
local terminalbrowser = require('ide.components.terminal.terminalbrowser')
local changes         = require('ide.components.changes')
local commits         = require('ide.components.commits')
local branches        = require('ide.components.branches')
local bookmarks       = require('ide.components.bookmarks')

require('ide').setup({
    -- The global icon set to use.
    -- values: "nerd", "codicon", "default"
    icon_set = "default",
    -- Set the log level for nvim-ide's log. Log can be accessed with
    -- 'Workspace OpenLog'. Values are 'debug', 'warn', 'info', 'error'
    log_level = "info",
    -- Component specific configurations and default config overrides.
    components = {
        -- The global keymap is applied to all Components before construction.
        -- It allows common keymaps such as "hide" to be overridden, without having
        -- to make an override entry for all Components.
        --
        -- If a more specific keymap override is defined for a specific Component
        -- this takes precedence.
        global_keymaps = {
            -- example, change all Component's hide keymap to "h"
            -- hide = h
        },
        -- example, prefer "x" for hide only for Explorer component.
        -- Explorer = {
        --     keymaps = {
        --         hide = "x",
        --     }
        -- }
    },
    -- default panel groups to display on left and right.
    panels = {
        left = "explorer",
        right = "git"
    },
    -- panels defined by groups of components, user is free to redefine the defaults
    -- and/or add additional.
    panel_groups = {
        explorer = { outline.Name, bufferlist.Name, explorer.Name, bookmarks.Name, callhierarchy.Name, terminalbrowser.Name },
        terminal = { terminal.Name },
        git = { changes.Name, commits.Name, timeline.Name, branches.Name }
    },
    -- workspaces config
    workspaces = {
        -- which panels to open by default, one of: 'left', 'right', 'both', 'none'
        auto_open = 'none',
    },
    -- default panel sizes for the different positions
    panel_sizes = {
        left = 45,
        right = 45,
        bottom = 15
    }
})
EOF


" =================== neogen ===============================
lua << EOF
require('neogen').setup {
    enabled = true,
    input_after_comment = true,
    --snippet_engine = 'vsnip'
}
EOF


" =================== nvim-lint ============================
lua << EOF
require('lint').linters_by_ft = {
  yaml = {'yamllint',},
  groovy = {'npm-groovy-lint',},
}
EOF

" lint on save
au BufWritePost * lua require('lint').try_lint()


" =================== nvim-jdtls ===========================
lua << EOF
function nvim_jdtls_setup()
  -- run 'mvn eclipse:eclipse -DdownloadSources' to bootstrap project

  -- if we're not in a normal buffer return
  --local buffer_type = vim.api.nvim_buf_get_option(0, 'buftype')
  --if buffer_type ~= "" then
  --    vim.notify("jdtls disabled for non-normal buffer: " .. buffer_type, vim.log.levels.WARN)
  --    return
  --end

  local project_name = "default"
  local root_dir = require('jdtls.setup').find_root({'.git'})
  if (root_dir == nil) then
      vim.notify("jdtls using default project name: " .. project_name, vim.log.levels.WARN)
  else
    project_name = string.gsub(root_dir, "(.*/)(.*)", "%2")
  end

  local workspace_dir = vim.env.HOME .. "/workspace/" .. project_name

  local extendedClientCapabilities = require'jdtls'.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

  local bundles = {
    vim.fn.glob(vim.env.HOME .. '/github.com/microsoft/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar')
  }
  vim.list_extend(bundles, vim.split(vim.fn.glob(vim.env.HOME .. '/github.com/microsoft/vscode-java-test/server/*.jar', 1), "\n"))

  --for _, bundle in ipairs(bundles) do
  --  vim.notify("found jdtls bundle: " .. bundle, vim.log.levels.INFO)
  --end

  -- See `:help vim.lsp.start_client` for config options
  local config = {
    -- For cmd options see:
    -- https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
      '/usr/lib/jvm/java-17-openjdk-amd64/bin/java',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      -- '-noverify',
      '-Xms1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      '-jar', vim.env.HOME .. '/.local/install/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
      '-configuration', vim.env.HOME .. '/.local/install/jdtls/config_linux',
      '-data', workspace_dir
    },

    root_dir = root_dir,
    -- For settings see:
    -- https://github.com/mfussenegger/nvim-jdtls
    -- https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- https://github.com/eclipse/eclipse.jdt.ls/blob/master/org.eclipse.jdt.ls.core/src/org/eclipse/jdt/ls/core/internal/preferences/Preferences.java
    settings = {
      capabilities = capabilities,
      java = {
        autobuild = {
          enabled = true
        },
        referencesCodeLens = {
          enabled = false
        },
        implementationCodeLens = {
          enabled = false
        },
        signatureHelp = {
          enabled = true,
          description = {
              enabled = true
          }
        },
        inlayHints = {
          parameterNames= {
            -- enabled options: literals, all, none
            enabled = "all"
          }
        },
        maven = {
          downloadSources = true
        },
        configuration = {
          runtimes = {
            {
              name = 'JavaSE-1.8',
              path = '/usr/lib/jvm/java-8-openjdk-amd64'
            },
            {
              name = 'JavaSE-11',
              path = '/usr/lib/jvm/java-11-openjdk-amd64'
            },
            {
              name = 'JavaSE-17',
              path = '/usr/lib/jvm/java-17-openjdk-amd64'
            },
          },
          maven = {
           userSettings = vim.env.HOME .. '/.m2/settings.jdt.xml',
           globalSettings = '/opt/local/install/maven/conf/settings.xml',
          },
        },
      },
    },
    init_options = {
      bundles = bundles,
      extendedClientCapabilities = extendedClientCapabilities,
    },
  }
  require('jdtls').start_or_attach(config)
  require('jdtls.setup').add_commands()
  require('jdtls').setup_dap({
    hotcodereplace = 'auto',
    -- These will be used as default overrides for jdtls.dap.test_class, jdtls.dap.test_nearest_method, and discovered main classes
    -- https://github.com/mfussenegger/nvim-jdtls/blob/master/lua/jdtls/dap.lua#L716C11-L716C168
    config_overrides = {
        vmArgs = vim.env.TEST_OPTS,
        env = {
            IAM_IDENTITY = vim.env.IAM_IDENTITY
        }
    }
  })

  -- Commands below are unreliable sinece jdtls must be fully loaded
  -- so instead use :JdtUpdateDebugConfig and DapLoadLaunchJson
  --require('jdtls.dap').setup_dap_main_class_configs()
  --require('dap.ext.vscode').load_launchjs()

end
EOF

augroup nvim_jdtls
    au!
    au FileType java lua nvim_jdtls_setup()
augroup end
