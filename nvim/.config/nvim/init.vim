call plug#begin()
Plug 'vim-scripts/Wombat'
Plug 'vim-scripts/wombat256.vim'
Plug 'shaunsingh/moonlight.nvim'
Plug 'folke/which-key.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'elzr/vim-json'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'lewis6991/gitsigns.nvim'
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
Plug 'mfussenegger/nvim-jdtls'
Plug 'vim-test/vim-test'
call plug#end()


" ==================== colors =============================
set termguicolors
colorscheme moonlight


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
  popup_mappings = {
    scroll_down = '<c-f>',
    scroll_up = '<c-b>',
  },
}

-- normal mode mappings
wk.register({
  ["<c-l>"] = { "<cmd>nohlsearch<cr><c-l>", "Redraw / Remove Search Highlight"},
  ["<c-e>"] = { "<cmd>NvimTreeToggle<cr>", "File Tree" },
  ["<c-p>"] = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
  ["<c-.>"] = { "<cmd>Telescope find_files cwd=~/dotfiles/nvim <cr>", "Dot Files" },
  ["<c-i>"] = { "<cmd>Telescope find_files cwd=~/.config/nvim <cr>", "init.vim" },
  -- which key help
  ["<leader>?"] = { "<cmd>WhichKey<cr>", "WhichKey"},
  -- bufferline mappings
  ["<leader>1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Buffer 1" },
  ["<leader>2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Buffer 2" },
  ["<leader>3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Buffer 3" },
  ["<leader>4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Buffer 4" },
  ["<leader>5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Buffer 5" },
  ["<leader>6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "Buffer 6" },
  ["<leader>7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "Buffer 7" },
  ["<leader>8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "Buffer 8" },
  ["<leader>9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "Buffer 9" },
  -- find mappings
  ["<leader>f"] = { name = "+find" },
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
  ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
  ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
  ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
  ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
  ["<leader>ft"] = { "<cmd>NvimTreeToggle<cr>", "File Tree" },
  -- get mappings
  ["<leader>g"] = { name = "+get" },
  ["<leader>gd"] = { "<Cmd>Telescope lsp_definitions<CR>", "Definition" },
  ["<leader>gi"] = { "<Cmd>Telescope lsp_implementations<CR>", "Implementations" },
  ["<leader>gD"] = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
  ["<leader>gr"] = { "<Cmd>Telescope lsp_references<CR>", "References" },
  ["<leader>ge"] = { "<Cmd>Telescope diagnostics bufnr=0<CR>", "Document Diagnostics" },
  ["<leader>gE"] = { "<Cmd>Telescope diagnostics <CR>", "Workspace Diagnostics" },
  ["<leader>gs"] = { "<Cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
  ["<leader>gS"] = { "<Cmd>Telescope lsp_workspace_symbols<CR>", "Workspace Symbols" },
  ["gd"] = { "<Cmd>TroubleToggle lsp_definitions<CR>", "Toggle Definitions" },
  ["gr"] = { "<Cmd>TroubleToggle lsp_references<CR>", "Toggle References" },
  ["gi"] = { "<Cmd>TroubleToggle lsp_implementations<CR>", "Toggle Implementations" },
  ["ge"] = { "<Cmd>TroubleToggle document_diagnostics<CR>", "Toggle Document Diagnostics" },
  ["gE"] = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", "Toggle Workspace Diagnostics" },
  ["gn"] = { '<Cmd>lua require("trouble").next({skip_groups = true, jump = true})<CR>', "Next" },
  ["gp"] = { '<Cmd>lua require("trouble").previous({skip_groups = true, jump = true})<CR>', "Previous" },
  ["gh"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Code Hover" },
  ["gs"] = { "<Cmd>lua vim.lsp.buf.signature_help()<CR>", "Code Hover" },


  -- history mappings
  ["<leader>h"] = { name = "+history" },
  ["<leader>hn"] = { "<Cmd>Gitsigns next_hunk<cr>", "Diff Next Hunk" },
  ["<leader>hp"] = { "<Cmd>Gitsigns prev_hunk<cr>", "Diff Prev Hunk" },
  ["<leader>hd"] = { "<Cmd>Gitsigns diffthis<cr>", "Diff" },
  ["<leader>hw"] = { "<Cmd>Gitsigns toggle_word_diff<cr>", "Toggle Word Diff" },
  ["<leader>hD"] = { "<Cmd>DiffviewOpen<cr>", "Diff View" },
  ["<leader>hh"] = { "<Cmd>DiffviewFileHistory %<cr>", "Diff View File History" },
  -- markdown mappings
  ["<leader>m"] = { name = "+markdown" },
  ["<leader>mp"] = { "<Cmd>Glow<cr>", "Markdown Preview" },
  ["<leader>mc"] = { "<Cmd>InsertToc<cr>", "Markdown Insert Table of Contents" },
  ["<leader>mC"] = { "<Cmd>Toc<cr>", "Markdown View Table of Contents" },
  ["<leader>mt"] = { "<Cmd>TableFormat<cr>", "Markdown Format Table" },
  -- code action mappings
  ["<leader>c"] = { name = "+code action" },
  ["<leader>cf"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Code Format" },
  ["<leader>ca"] = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
  ["<leader>cr"] = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol" },
  -- testing mappings
  ["<leader>t"] = { name = "+test" },
  ["<leader>tf"] = { "<cmd>TestFile<CR>", "Test File" },
  ["<leader>ts"] = { "<cmd>TestSuite<CR>", "Test Suite" },
  ["<leader>tl"] = { "<cmd>TestLast<CR>", "Test Last" },
  ["<leader>tn"] = { "<cmd>TestNearest<CR>", "Test Nearest" },
})

-- visual mode mappings
wk.register({
  ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
  ["<leader>cf"] = { "<cmd>lua vim.lsp.buf.range_formatting()<CR>", "Code Format" },
}, {
  mode = "v"
})

wk.register({
}, {
  mode = "t"
})
EOF


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
  au BufNewFile,BufRead *.avsc set filetype=json
  au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
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
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup{
  git = {
    ignore = true,
  },
  filters = {
    dotfiles = false,
    custom = {
      '.git',
      '.DS_Store',
    },
  },
  view = {
    width="35%",
    mappings = {
      list = {
        { key = "?", cb = tree_cb("toggle_help") },
        { key = "m", cb = tree_cb("rename") },
        { key = "r", cb = tree_cb("refresh") },
        { key = "<c-e>", cb = tree_cb("close") },
      }
    }
  },
  renderer = {
    group_empty = true
  }
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
  }
}
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
           desc = ' Dot Files',
           group = 'Number',
           action = 'Telescope find_files cwd=~/dotfiles',
           key = '.'
        },
        {
           desc = ' init.vim',
           group = 'Number',
           action = 'Telescope find_files cwd=~/.config/nvim',
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
  ensure_installed = { "lua", "help", "java", "vim" },

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
    disable = { "java"  },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
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
  yadm = {
    enable = false
  },
}
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
  snippet_context_lines = 4;               -- number or lines around commented lines
  file_panel = {
    size = 10,                             -- changed files panel rows
    use_icons = true                       -- use web-devicons in file panel
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


" =================== tsserver =============================
if executable('tsserver')
lua << EOF
require'lspconfig'.tsserver.setup{}
EOF
else
  echo "You might want to install tsserver: yarn global add typescript typescript-language-server"
endif


" =================== rust-analyzer ========================
if executable('rust-analyzer')
lua << EOF
local nvim_lsp = require'lspconfig'

nvim_lsp.rust_analyzer.setup({
  -- on_attach is a callback called when the language server attachs to the buffer
  -- on_attach = on_attach,
  settings = {
    -- config from: https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    ["rust-analyzer"] = {
      cargo = {
        target = "thumbv7em-none-eabihf",
        runBuildScripts = false,
        allFeatures = true
      },
      checkOnSave = {
        enable = true,
        target = "thumbv7em-none-eabihf",
        allTargets = false,
      },
      procMacro = {
        enable = false
      }
    }
  }
})
EOF
else
  echo "You might want to install rust-analyzer: https://rust-analyzer.github.io"
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
    { name = 'cmdline' },
    { name = 'spell' },
  },
})


vim.opt.spelllang = { 'en_us' }

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'pyright', 'rust_analyzer', 'tsserver' }
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


" =================== nvim-jdtls ===========================
lua << EOF
function nvim_jdtls_setup()
  -- if we're not in a normal buffer return
  if vim.api.nvim_buf_get_option(0, 'buftype') ~= "" then
      return
  end

  -- if we can't resolve a root directory return
  local root_dir = require('jdtls.setup').find_root({'.git'})
  if (root_dir == nil) then
      return
  end
  local project_name = string.gsub(root_dir, "(.*/)(.*)", "%2")
  local workspace_dir = vim.env.HOME .. "/workspace/" .. project_name

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
      java = {
        autobuild = {
          enabled = false
        },
        referencesCodeLens = {
          enabled = true
        },
        signatureHelp = {
          enabled = true
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
        },
        maven = {
         userSettings = vim.env.HOME .. '/.m2/settings.xml',
        },
      },
    },
    init_options = {
      bundles = {}
    },
  }
  require('jdtls').start_or_attach(config)
  require('jdtls.setup').add_commands()
end
EOF


augroup nvim_jdtls
    au!
    au FileType java lua nvim_jdtls_setup()
augroup end
