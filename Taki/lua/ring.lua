-- Conky Lua Script
--
--called with ${lua example_func}
require 'cairo'
function conky_ring()
	if conky_window == nil then return end
	if cs == nil or cairo_xlib_surface_get_width(cs) ~= conky_window.width or cairo_xlib_surface_get_height(cs) ~= conky_window.height then
		if cs then cairo_surface_destroy(cs)end
		cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	end
	if cr then cairo_destroy(cr) end
	cr = cairo_create(cs)
	cairo_arc(cr, 150, 500, 120, 0, 2*math.pi)
	cairo_close_path(cr)
	cairo_stroke(cr)
end

function conky_cairo_cleanup()
	cairo_surface_destroy(cs)
	cs = nil
end
