-- Conky Lua Script
--
--called with ${lua example_func}
require 'cairo'
function conky_ring(width, radius, colorR, colorG, colorB, colorA, start, perc)     if conky_window == nil then return end
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
	local start = 3*math.pi / 2
	local seconds = tonumber(os.date("%S"))
	local cRed = 0.3
	local cGreen = 0.86
	local cBlue = 1.0
	seconds = seconds / 60.0
	conky_ring(8, 120, 1.0, 1.0, 1.0, 0.2, 0, 1)
	conky_ring(1, 116.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, seconds)
	conky_ring(1, 117.5, cRed*.75, cGreen*.75, cBlue*.75, 1.0, start, seconds)
	conky_ring(4, 120, cRed, cGreen, cBlue, 1.0, start, seconds)
	conky_ring(1, 122.5, cRed*.75, cGreen*.75, cBlue*.75, 1.0, start, seconds)
	conky_ring(1, 123.5, cRed*.5, cGreen*.75, cBlue*.5, 1.0, start, seconds)

    cRed = 0.0
    cGreen = 0.37
    cBlue = 0.44
	local minutes = tonumber(os.date("%M"))
	minutes = minutes / 60.0
	conky_ring(12, 108, 0.44, 0.44, 0.44, 0.2, 0, 1)
	conky_ring(1, 102.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, minutes)
	conky_ring(2, 104, cRed*.75, cGreen*.75, cBlue*.75, 1.0, start, minutes)
	conky_ring(6, 108, cRed, cGreen, cBlue, 1.0, start, minutes)
	conky_ring(2, 112, cRed*.75, cGreen*.75, cBlue*.5, 1.0, start, minutes)
	conky_ring(1, 113.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, minutes)

    cRed = 0.0
    cGreen = 0.73
    cBlue = 0.60
	local hours = tonumber(os.date("%H"))
	hours = hours / 24.0
	conky_ring(6, 97, 0.73, 0.73, 0.73, 0.2, 0, 1)
	conky_ring(1, 94.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, hours)
	conky_ring(4, 97, cRed, cGreen, cBlue, 1.0, start, hours)
	conky_ring(1, 99.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, hours)

    cRed = 0.0
    cGreen = 0.46
    cBlue = 0.38
	local day = tonumber(os.date("%d"))
	day = day / 31.0
	conky_ring(4, 90, 0.46, 0.46, 0.46, 0.2, 0, 1)
	conky_ring(1, 88.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, day)
	conky_ring(2, 90, cRed, cGreen, cBlue, 1.0, start, day)
	conky_ring(1, 91.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, day)

    cRed = 0.23
    cGreen = 0.63
    cBlue = 0.82
	local month = tonumber(os.date("%m"))
	month = month / 12.0
	conky_ring(10, 81, 0.82, 0.82, 0.82, 0.2, 0, 1)
	conky_ring(1, 76.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, month)
	conky_ring(1, 77.5, cRed*.75, cGreen*.75, cBlue*.75, 1.0, start, month)
	conky_ring(6, 81, cRed, cGreen, cBlue, 1.0, start, month)
	conky_ring(1, 84.5, cRed*.75, cGreen*.75, cBlue*.75, 1.0, start, month)
	conky_ring(1, 85.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, month)
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
