return {
  "nvim-neotest/neotest",
  dependencies = {
    "olimorris/neotest-rspec",
    "zidhuss/neotest-minitest",
  },
  opts = {
    adapters = {
      ["neotest-rspec"] = {},
      ["neotest-minitest"] = {},
    },
  },
}
