local M = {}

local find_offset = function(s)
    if string.len(s) > 0 then
        local _, offset = string.find(s, "^[%s\t]+")
        return offset
    end
    return 0
end

local make_comment_line = function(comment, text, len, offset)
    len = len or 72
    offset = offset or 0
    local offset_char = ' '

    if string.len(text) > 0 then
        if string.sub(text, 0) == "\t" then
            offset_char = "\t"
        end
    end

    text = text:gsub("^[%s\t]+", ""):gsub("[%s\t]+$", "")

    local l = comment
    if string.len(text) > 0 then
        l = l .. ' ' .. text
    end

    if len - string.len(l) - offset - 1 > 0 then
        l = string.rep(offset_char, offset) .. l .. ' ' .. string.rep('-', len - string.len(l) - offset - 1)
    end
    return l
end

-- ---------------------------------------------------------------------
-- LineComment ---------------------------------------------------------
-- ---------------------------------------------------------------------
-- Takes the current line converts it to a formatted comment. ----------
-- ---------------------------------------------------------------------

M.LineComment = function()
    local comment = vim.fn.input("Comment Chars: ")
    local curr_line = vim.api.nvim_get_current_line()
    local offset = find_offset(curr_line)
    local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
    local comment_text = make_comment_line(comment, curr_line, 72, offset)
    vim.api.nvim_buf_set_lines(0, row-1, row, false, {comment_text})
end

-- ---------------------------------------------------------------------
-- BlockComment --------------------------------------------------------
-- ---------------------------------------------------------------------
-- Takes the current line converts it to a formatted block of comment. -
-- ---------------------------------------------------------------------
M.BlockComment = function()
    local comment = vim.fn.input("Comment Chars: ")
    local curr_line = vim.api.nvim_get_current_line()
    local offset = find_offset(curr_line)

    -- create line above and line below the line to make a block comment
    vim.cmd("normal O ")
    local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_win_set_cursor(0, {row+1, 0})
    vim.cmd("normal o")

    -- create the comment block
    local comment_line = make_comment_line(comment, '', 72, offset)
    local comment_text = make_comment_line(comment, curr_line, 72, offset)
    local replace = { comment_line, comment_text, comment_line }

    -- make the substitution
    vim.api.nvim_buf_set_lines(0, row-1, row+2, false, replace)
end

return M
