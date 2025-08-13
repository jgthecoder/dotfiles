return {
  {
    enabled = false,
    dir = "~/code/luaplugins/testplugin.nvim/",
    config = function()
      local testplugin = require "testplugin"

      testplugin.setup {
        foo = "custom foo",
      }

      testplugin.greet()
    end,
  },
}
