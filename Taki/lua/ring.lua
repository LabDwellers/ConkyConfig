-- Conky Lua Script
--
--called with ${lua example_func}
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
	cairo_arc (cr, 200, 500, radius, start, perc*2*math.pi+start)
	cairo_stroke(cr)
end

function conky_clock()
	local seconds = tonumber(os.date("%S"))
	seconds = seconds / 60.0
	conky_ring(8, 120, 1.0, 1.0, 1.0, 0.2, 0, 1)
	conky_ring(8, 120, 0.3, 0.86, 1.0, 1.0, 0, seconds)

	local minutes = tonumber(os.date("%M"))
	minutes = minutes / 60.0
	conky_ring(12, 108, 0.44, 0.44, 0.44, 0.2, 0, 1)
	conky_ring(12, 108, 0.0, 0.37, 0.44, 1.0, 0, minutes)

	local hours = tonumber(os.date("%H"))
	hours = hours / 24.0
	conky_ring(6, 97, 0.73, 0.73, 0.73, 0.2, 0, 1)
	conky_ring(6, 97, 0.0, 0.73, 0.60, 1.0, 0, hours)

	local day = tonumber(os.date("%d"))
	day = day / 31.0
	conky_ring(4, 90, 0.46, 0.46, 0.46, 0.2, 0, 1)
	conky_ring(4, 90, 0.0, 0.46, 0.38, 1.0, 0, day)

	local month = tonumber(os.date("%m"))
	month = month / 12.0
	conky_ring(10, 81, 0.82, 0.82, 0.82, 0.2, 0, 1)
	conky_ring(10, 81, 0.23, 0.63, 0.82, 1.0, 0, month)
	--Clock ring seperators
	--conky_ring(2, 115, 0.0, 0.0, 0.0, 1.0, 0, 1)
	--conky_ring(2, 101, 0.0, 0.0, 0.0, 1.0, 0, 1)
	--conky_ring(2, 93, 0.0, 0.0, 0.0, 1.0, 0, 1)
	--conky_ring(2, 87, 0.0, 0.0, 0.0, 1.0, 0, 1)
	--conky_ring(2, 75, 0.0, 0.0, 0.0, 1.0, 0, 1)
end

function conky_cairo_cleanup()
	cairo_surface_destroy(cs)
	cs = nil
end
