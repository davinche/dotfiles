require('telescope').setup {
    defaults = {
        file_ignore_patterns = {"node_modules"},
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            }
        }
    }, 
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}

local my_module = {}
my_module.search_dotfiles = function()
    require('telescope.builtin').find_files({
        prompt_title = "< VIM RC >",
        cwd = "~/dotfiles/",
    })
end

return my_module
