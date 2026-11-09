{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
    settings.mgr = {
      show_hidden = true;
      sort_dir_first = true;
    };
    theme = {
      mgr = {
        cwd = { fg = "#8ea4a2"; };
        find_keyword = { fg = "#c4b28a"; bold = true; italic = true; underline = true; };
        find_position = { fg = "#a292a3"; bg = "reset"; bold = true; italic = true; };
        marker_copied = { fg = "#87a987"; bg = "#87a987"; };
        marker_cut = { fg = "#c4746e"; bg = "#c4746e"; };
        marker_marked = { fg = "#8ea4a2"; bg = "#8ea4a2"; };
        marker_selected = { fg = "#c4b28a"; bg = "#c4b28a"; };
        count_copied = { fg = "#181616"; bg = "#87a987"; };
        count_cut = { fg = "#181616"; bg = "#c4746e"; };
        count_selected = { fg = "#181616"; bg = "#c4b28a"; };
        border_style = { fg = "#625e5a"; };
      };
      tabs = {
        active = { fg = "#181616"; bg = "#8ba4b0"; bold = true; };
        inactive = { fg = "#8ba4b0"; bg = "#282727"; };
      };
      mode = {
        normal_main = { fg = "#181616"; bg = "#8ba4b0"; bold = true; };
        normal_alt = { fg = "#8ba4b0"; bg = "#282727"; };
        select_main = { fg = "#181616"; bg = "#a292a3"; bold = true; };
        select_alt = { fg = "#a292a3"; bg = "#282727"; };
        unset_main = { fg = "#181616"; bg = "#c4746e"; bold = true; };
        unset_alt = { fg = "#c4746e"; bg = "#282727"; };
      };
      indicator = {
        parent = { fg = "#c5c9c5"; bg = "#282727"; };
        current = { fg = "#c5c9c5"; bg = "#393836"; bold = true; };
        preview = { underline = true; };
      };
      status = {
        perm_sep = { fg = "#625e5a"; };
        perm_type = { fg = "#8a9a7b"; };
        perm_read = { fg = "#c4b28a"; };
        perm_write = { fg = "#c4746e"; };
        perm_exec = { fg = "#8ea4a2"; };
        progress_normal = { fg = "#8a9a7b"; bg = "#282727"; };
        progress_error = { fg = "#c4b28a"; bg = "#c4746e"; };
      };
      which = {
        mask = { bg = "#181616"; };
        cand = { fg = "#8ea4a2"; };
        rest = { fg = "#737c73"; };
        desc = { fg = "#a292a3"; };
        separator_style = { fg = "#625e5a"; };
      };
      confirm = {
        border = { fg = "#8ba4b0"; };
        title = { fg = "#8ba4b0"; };
      };
      spot = {
        border = { fg = "#8ba4b0"; };
        title = { fg = "#8ba4b0"; };
        tbl_col = { fg = "#8ba4b0"; };
        tbl_cell = { fg = "#c4b28a"; reversed = true; };
      };
      notify = {
        title_info = { fg = "#87a987"; };
        title_warn = { fg = "#c4b28a"; };
        title_error = { fg = "#c4746e"; };
      };
      pick = {
        border = { fg = "#8ba4b0"; };
        active = { fg = "#a292a3"; bold = true; };
      };
      input.border = { fg = "#8ba4b0"; };
      cmp.border = { fg = "#8ba4b0"; };
      tasks = {
        border = { fg = "#8ba4b0"; };
        hovered = { fg = "#a292a3"; bold = true; };
      };
      help = {
        border = { fg = "#8ba4b0"; };
        chord = { fg = "#8ea4a2"; };
      };
    };
  };
}
