-- Conky Lua Script
-- 
-- called with ${lua example_func}
require 'cairo'
function conky_ring(width, radius, colorR, colorG, colorB, colorA, start, perc)
	if conky_window == nil then return end
	if cs == nil or cairo_xlib_surface_get_width(cs) ~= conky_window.width or cairo_xlib_surface_get_height(cs) ~= conky_window.height then
		if cs then cairo_surface_destroy(cs)end
		cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	end
	if cr then cairo_destroy(cr) end
	cr = cairo_create(cs)
	cairo_set_line_width (cr, width)
	cairo_set_source_rgba (cr, colorR, colorG, colorB, colorA)
	cairo_arc (cr, radius+(width/2), radius+(width/2), radius, start, perc*2*math.pi+start)
	cairo_stroke(cr)
end

-- Memory ring
function conky_mem(x)
	local starting_point = 3*math.pi / 2
	conky_ring(10, (tonumber(x)-10)/2, 0.15, 0.43, 0.5, 1.0, starting_point, tonumber(conky_parse("${memperc}"))/100)
end

function conky_netup(x)
	local starting_point = 3*math.pi / 2
end
-- Cleanup
function conky_cairo_cleanup()
	cairo_surface_destroy(cs)
	cs = nil
end