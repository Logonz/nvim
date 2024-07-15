-- Function to convert hex color to RGB
function Hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
end

-- Function to convert RGB to hex color
function Rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", r, g, b)
end

-- Function to blend two colors
function Blend_colors(color1, color2, ratio)
  local r1, g1, b1 = Hex_to_rgb(color1)
  local r2, g2, b2 = Hex_to_rgb(color2)

  local r = r1 * ratio + r2 * (1 - ratio)
  local g = g1 * ratio + g2 * (1 - ratio)
  local b = b1 * ratio + b2 * (1 - ratio)

  return Rgb_to_hex(math.floor(r), math.floor(g), math.floor(b))
end

return {
  Blend_colors = Blend_colors
}
