local minuet = {
  'milanglacier/minuet-ai.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    provider = "codestral",
    provider_options = {
        codestral = {
            optional = {
                max_tokens = 256,
                stop = { '\n\n' },
            },
        },
    },
    virtualtext = {
      auto_trigger_ft = {'*'},
      auto_trigger_ignore_ft = { 'txt', 'md' },
      keymap = {
        -- accept whole completion
        accept = '<A-A>',
        -- accept one line
        accept_line = '<A-a>',
        -- accept n lines (prompts for number)
        -- e.g. "A-z 2 CR" will accept 2 lines
        accept_n_lines = '<A-z>',
        -- Cycle to prev completion item, or manually invoke completion
        prev = '<A-p>',
        -- Cycle to next completion item, or manually invoke completion
        next = '<A-n>',
        dismiss = '<A-e>',
      },
    },
  },
}


local codestral_api_key = os.getenv("CODESTRAL_API_KEY")
if codestral_api_key ~= nil and codestral_api_key ~= "" then
  print("Codestral API Key found! LLM mode on.")
  return minuet
else
  return {}
end
