-- Conky Lua Script
--
--called with ${lua example_func}
require 'cairo'
do
    function conky_ring(width, xc, yc, radius, colorR, colorG, colorB, colorA, start, perc)     if conky_window == nil then return end
    	if cs == nil or cairo_xlib_surface_get_width(cs) ~= conky_window.width or cairo_xlib_surface_get_height(cs) ~= conky_window.height then
	    	if cs then cairo_surface_destroy(cs)end
		    cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    	end
    	if cr then cairo_destroy(cr) end
	    cr = cairo_create(cs)
    	cairo_set_line_width (cr, width)
	    cairo_set_source_rgba (cr, colorR, colorG, colorB, colorA)
    	cairo_arc (cr, xc, yc, radius, start, perc*2*math.pi+start)
	    cairo_stroke(cr)
    end

    function conky_clock(xc, yc, interval)
	    local start = 3*math.pi / 2
        local time = os.date("%m %d %H %M %S")
    	local seconds = tonumber(string.sub(time, 13,14))
	    local cRed = 0.3
    	local cGreen = 0.86
	    local cBlue = 1.0
    	seconds = seconds / 60.0
	    conky_ring(8, xc, yc, 120, 1.0, 1.0, 1.0, 0.2, 0, 1)
    	conky_ring(1, xc, yc, 116.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, seconds)
	    conky_ring(1, xc, yc, 117.5, cRed*.75, cGreen*.75, cBlue*.75, 1.0, start, seconds)
    	conky_ring(4, xc, yc, 120, cRed, cGreen, cBlue, 1.0, start, seconds)
	    conky_ring(1, xc, yc, 122.5, cRed*.75, cGreen*.75, cBlue*.75, 1.0, start, seconds)
    	conky_ring(1, xc, yc, 123.5, cRed*.5, cGreen*.75, cBlue*.5, 1.0, start, seconds)
    
        cRed = 0.0
        cGreen = 0.37
        cBlue = 0.44
    	local minutes = tonumber(string.sub(time, 10, 11)) + seconds
	    minutes = minutes / 60.0
    	conky_ring(12, xc, yc, 108, 0.44, 0.44, 0.44, 0.2, 0, 1)
	    conky_ring(1, xc, yc, 102.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, minutes)
    	conky_ring(2, xc, yc, 104, cRed*.75, cGreen*.75, cBlue*.75, 1.0, start, minutes)
	    conky_ring(6, xc, yc, 108, cRed, cGreen, cBlue, 1.0, start, minutes)
    	conky_ring(2, xc, yc, 112, cRed*.75, cGreen*.75, cBlue*.5, 1.0, start, minutes)
	    conky_ring(1, xc, yc, 113.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, minutes)

        cRed = 0.0
        cGreen = 0.73
        cBlue = 0.60
	    local hours = tonumber(string.sub(time, 7, 8)) + minutes
    	hours = hours / 24.0
	    conky_ring(6, xc, yc, 97, 0.73, 0.73, 0.73, 0.2, 0, 1)
    	conky_ring(1, xc, yc, 94.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, hours)
	    conky_ring(4, xc, yc, 97, cRed, cGreen, cBlue, 1.0, start, hours)
    	conky_ring(1, xc, yc, 99.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, hours)

        cRed = 0.0
        cGreen = 0.46
        cBlue = 0.38
    	local day = tonumber(string.sub(time, 4, 5)) + hours
	    day = day / 31.0
    	conky_ring(4, xc, yc, 90, 0.46, 0.46, 0.46, 0.2, 0, 1)
	    conky_ring(1, xc, yc, 88.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, day)
	    conky_ring(2, xc, yc, 90, cRed, cGreen, cBlue, 1.0, start, day)
    	conky_ring(1, xc, yc, 91.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, day)

        cRed = 0.23
        cGreen = 0.63
        cBlue = 0.82
	    local month = tonumber(string.sub(time, 1, 2)) + day
    	month = month / 12.0
	    conky_ring(10, xc, yc, 81, 0.82, 0.82, 0.82, 0.2, 0, 1)
    	conky_ring(1, xc, yc, 76.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, month)
	    conky_ring(1, xc, yc, 77.5, cRed*.75, cGreen*.75, cBlue*.75, 1.0, start, month)
    	conky_ring(6, xc, yc, 81, cRed, cGreen, cBlue, 1.0, start, month)
	    conky_ring(1, xc, yc, 84.5, cRed*.75, cGreen*.75, cBlue*.75, 1.0, start, month)
    	conky_ring(1, xc, yc, 85.5, cRed*.5, cGreen*.5, cBlue*.5, 1.0, start, month)
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
end
