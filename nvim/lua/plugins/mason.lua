-- Mason is mainly useful on Windows, where the Nix-provided tools are absent.
-- On Linux the same tools come from Nix, so only missing ones are installed.
require("mason").setup()

local is_windows = vim.fn.has("win32") == 1
if not is_windows then
  return
end

local registry = require("mason-registry")
registry.refresh(function()
  for _, name in ipairs({ "clangd", "ruff", "ty", "markdown-oxide", "clang-format" }) do
    local ok, pkg = pcall(registry.get_package, name)
    if ok and not pkg:is_installed() then
      pkg:install()
    end
  end
end)
