return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    --lazy = false,
    priority = 1000,
    opts = {
      flavour = "macchiato", -- Vyvážený tmavý motiv
      color_overrides = {
        macchiato = {
          base = "#181818", -- Hlavní pozadí editoru (čistá tmavě šedá)
          mantle = "#141414", -- Pozadí postranních panelů (strom souborů, terminál)
          crust = "#111111", -- Nejmavší prvky (např. oddělovače oken)
        },
        -- Pokud bys přepnul na Mochu, aplikují se tyto barvy:
        mocha = {
          base = "#181818",
          mantle = "#141414",
          crust = "#111111",
        },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
