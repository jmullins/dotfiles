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
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ellisonleao/glow.nvim', {'branch': 'main'}
Plug 'pwntester/octo.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'tami5/lspsaga.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'f3fora/cmp-spell'
Plug 'hrsh7th/cmp-vsnip'
Plug 'arkav/lualine-lsp-progress'
Plug 'mfussenegger/nvim-jdtls'
Plug 'vim-test/vim-test'
call plug#end()


" ==================== colors ==========================
set termguicolors
colorscheme moonlight


" ==================== display type =======================
syntax on           " Enable syntax highlighting
set nu              " Line numbers on
set showmatch       " Show matching braces / brackets
set vb              " Visual bell
set signcolumn=yes  " Always show sign column
set splitright      " Split vertical windows right to the current windows
set splitbelow      " Split horizontal windows below to the current windows
set nofoldenable    " Disable folding


" ==================== formatting =========================
set autoindent          " Indent at same level of the previous line
set cindent             " Smarter indentation
set et                  " Expand tabs to spaces
set sw=4                " Use idents of 4 spaces
set tpm=20              " Max number of tabs
set ts=4                " Indentation every four columns
set list                " Display white space
set listchars=tab:>-    " Display tabs only
set nowrap              " Line wrapping off


" ==================== file ===============================
set encoding=UTF-8            " Set default encoding to UTF-8
set fileformats=unix,dos,mac  " Prefer unix EOL
set noswapfile                " Don't use swapfile
set nobackup		          " Don't create annoying backup files
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
  ["<c-f>"] = { "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", "Scroll Forward" },
  ["<c-b>"] = { "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", "Scroll Back" },
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
  ["gr"] = { "<Cmd>Lspsaga lsp_finder<CR>", "Find Definition / References" },
  ["gd"] = { "<Cmd>Lspsaga preview_definition<CR>", "Preview Definition" },
  ["gR"] = { "<Cmd>Lspsaga rename<CR>", "Rename Symbol" },
  ["gs"] = { "<Cmd>Lspsaga signature_help<CR>", "Signature Help" },
  ["gk"] = { "<Cmd>Lspsaga hover_doc<CR>", "Hover Doc" },
  ["gl"] = { "<Cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics" },
  -- git mappings
  ["<leader>h"] = { name = "+git" },
  ["<leader>hd"] = { "<Cmd>Gitsigns diffthis<cr>", "Diff" },
  ["<leader>hw"] = { "<Cmd>Gitsigns toggle_word_diff<cr>", "Toggle Word Diff" },
  -- markdown mappings
  ["<leader>m"] = { name = "+markdown" },
  ["<leader>mp"] = { "<Cmd>Glow<cr>", "Markdown Preview" },
  ["<leader>mc"] = { "<Cmd>InsertToc<cr>", "Markdown Insert Table of Contents" },
  ["<leader>mC"] = { "<Cmd>Toc<cr>", "Markdown View Table of Contents" },
  ["<leader>mt"] = { "<Cmd>TableFormat<cr>", "Markdown Format Table" },
  -- floating terminal
  ["<C-T>"] = { "<Cmd>Lspsaga open_floaterm<CR>", "Floating Terminal" },
  -- code action mappings
  ["<leader>c"] = { name = "+code action" },
  ["<leader>cf"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Code Format" },
  ["<leader>ca"] = { "<Cmd>Lspsaga code_action<CR>", "Code Action" },
  -- testing mappings
  ["<leader>t"] = { name = "+test" },
  ["<leader>tf"] = { "<cmd>TestFile<CR>", "Test File" },
  ["<leader>ts"] = { "<cmd>TestSuite<CR>", "Test Suite" },
  ["<leader>tl"] = { "<cmd>TestLast<CR>", "Test Last" },
  ["<leader>tn"] = { "<cmd>TestNearest<CR>", "Test Nearest" },
})

-- visual mode mappings
wk.register({
  ["<leader>ca"] = { "<Cmd>Lspsaga range_code_action<CR>", "Code Action" },
  ["<leader>cf"] = { "<cmd>lua vim.lsp.buf.range_formatting()<CR>", "Code Format" },
}, {
  mode = "v"
})

wk.register({
  ["<C-T>"] = { "<Cmd>Lspsaga close_floaterm<CR>", "Close Floating Terminal" },
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
let g:dashboard_default_executive ='telescope'

" disable the tabline in the dashboard
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

" Add a custom dashboard items for GitHub
let g:dashboard_custom_section={
  \ 'gh_pull_requests': {
      \ 'description': ['  List pull requests          , o p'],
      \ 'command': 'Octo pr list' },
  \ 'gh_issues': {
      \ 'description': ['  List issues                 , o i'],
      \ 'command': 'Octo issue list' },
  \ 'file_files': {
      \ 'description': ['  Find files                  , f f'],
      \ 'command': 'Telescope find_files' },
  \ 'live_grep': {
      \ 'description': ['  Live grep                   , f g'],
      \ 'command': 'Telescope live_grep' },
  \ 'book_marks': {
      \ 'description': ['  Jump to bookmarks           , f m'],
      \ 'command': 'DashboardJumpMarks' },
      \ }


" =================== gitsigns =============================
lua << EOF
require("gitsigns").setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '_¯', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~_', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
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
  max_file_length = 40000,
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
  on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end
  end
}
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


" =================== nvim-lspconfig =======================
lua << EOF
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
EOF


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
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

EOF

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
  echo "You might want to install rust-analyzer: https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary"
endif


" =================== lspsaga.nvim =========================
lua << EOF
require'lspsaga'.init_lsp_saga{
  use_saga_diagnostic_sign = true,
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  infor_sign = '',
  diagnostic_header_icon = '   ',
  code_action_icon = ' ',
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
    },
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = 'o',
    vsplit = 's',
    split = 'i',
    quit = 'q',
    scroll_down = '<C-f>',
    scroll_up = '<C-b>',
    },
  code_action_keys = {
    quit = 'q',
    exec = '<CR>'
    },
  rename_action_keys = {
    quit = '<C-c>',
    exec = '<CR>',
    },
  definition_preview_icon = '  ',
  -- "single" "double" "round" "plus"
  border_style = "single",
  rename_prompt_prefix = '➤',
  server_filetype_map = { ["jdt.ls"] = {'java'} }
}
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
      'java',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-noverify',
      '-Xms1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      '-jar', vim.env.HOME .. '/local/install/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
      '-configuration', vim.env.HOME .. '/local/install/jdtls/config_linux',
      '-data', workspace_dir
    },
    root_dir = root_dir,
    settings = {
      java = {
        autobuild = {
          enabled = false
        },
        referencesCodeLens = {
          enabled = true
        },
        maven = {
          downloadSourcs = true
        }
      }
    },
    init_options = {
      bundles = {}
    },
  }
  require('jdtls').start_or_attach(config)
end
EOF

augroup nvim_jdtls
    au!
    au FileType java lua nvim_jdtls_setup()
augroup end
