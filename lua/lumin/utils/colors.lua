local M = {}

function M.hex_to_rgb(hex)
    hex = hex:gsub("#", "")

    return {
        r = tonumber(hex:sub(1, 2), 16),
        g = tonumber(hex:sub(3, 4), 16),
        b = tonumber(hex:sub(5, 6), 16),
    }
end

function M.rgb_to_hex(rgb)
    return string.format("#%02x%02x%02x", rgb.r, rgb.g, rgb.b)
end

function M.blend(fg, bg, alpha)
    local f = M.hex_to_rgb(fg)
    local b = M.hex_to_rgb(bg)

    return M.rgb_to_hex({
        r = math.floor(f.r * alpha + b.r * (1 - alpha) + 0.5),
        g = math.floor(f.g * alpha + b.g * (1 - alpha) + 0.5),
        b = math.floor(f.b * alpha + b.b * (1 - alpha) + 0.5),
    })
end

function M.rgba_to_rgb(rgba, bg)
    rgba = rgba:gsub("#", "")

    local rgb = "#" .. rgba:sub(1, 6)
    local alpha_hex = rgba:sub(7, 8)
    if alpha_hex == "" then
        return rgb
    end

    local alpha = tonumber(alpha_hex, 16) / 255
    return M.blend(rgb, bg, alpha)
end

return M
