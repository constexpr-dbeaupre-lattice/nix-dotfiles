require("gitsigns").setup({
  on_attach = function(buf)
    local gs = require("gitsigns")
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
    end
    map("]h", function() gs.nav_hunk("next") end, "Next hunk")
    map("[h", function() gs.nav_hunk("prev") end, "Previous hunk")
    map("<leader>gs", gs.stage_hunk, "Stage hunk")
    map("<leader>gr", gs.reset_hunk, "Reset hunk")
    map("<leader>gp", gs.preview_hunk, "Preview hunk")
    map("<leader>gb", gs.blame_line, "Blame line")
  end,
})
