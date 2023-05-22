local M = {}
local defaults = {
    extensions = {
        autoSetHints = true,

        inlay_hints = {
            only_current_line = false,
            only_current_line_autocmd = "CursorHold",
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            parameter_hints_formatter = function(label, prefix)
              return prefix .. label:sub(1, -3)
            end,
            other_hints_prefix = "=> ",
            other_hints_formatter = function(label, prefix)
              if label:sub(1, 2) == ": " then
                return prefix .. label:sub(3)
              end
              return prefix .. label
            end,
            max_len_align = false,
            max_len_align_padding = 1,
            inline = false,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
            priority = 100,
        },

        ast = {
            role_icons = {
                 type = "🄣",
                 declaration = "🄓",
                 expression = "🄔",
                 statement = ";",
                 specifier = "🄢",
                 ["template argument"] = "🆃",
            },

            kind_icons = {
                Compound = "🄲",
                Recovery = "🅁",
                TranslationUnit = "🅄",
                PackExpansion = "🄿",
                TemplateTypeParm = "🅃",
                TemplateTemplateParm = "🅃",
                TemplateParamObject = "🅃",
            },

            highlights = {
                detail = "Comment",
            },
        },

        memory_usage = {
            border = "none",
        },

        symbol_info = {
            border = "none",
        },
    },

    server = {},
}

M.options = {}

function M.setup(options)
    M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

return M
