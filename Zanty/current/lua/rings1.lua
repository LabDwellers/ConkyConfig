-- Conky Lua Script
-- A special thanks to:
-- CrunchBang and ArchLinux forums for inspiration (along with many others)
-- Friend Sataki for being debugging buddy
-- Zanterian 2012
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

-- For filling
function conky_circle(width, radius, colorR, colorG, colorB, colorA, start, perc, height)
	if conky_window == nil then return end
	if cs == nil or cairo_xlib_surface_get_width(cs) ~= conky_window.width or cairo_xlib_surface_get_height(cs) ~= conky_window.height then
		if cs then cairo_surface_destroy(cs)end
		cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	end
	if cr then cairo_destroy(cr) end
	cr = cairo_create(cs)
	cairo_set_line_width (cr, width)
	cairo_set_source_rgba (cr, colorR, colorG, colorB, colorA)
	cairo_arc (cr, height/2, height/2, radius, start, perc*2*math.pi+start)
	cairo_fill(cr)
end

-- Memory ring
function conky_mem(x)
	local starting_point = 3*math.pi / 2
	-- Measurement Ring
	conky_ring(10, (tonumber(x)-10)/2, 0.15, 0.43, 0.5, 1.0, starting_point, tonumber(conky_parse("${memperc}"))/100)
	conky_ring(10, (tonumber(x)-10)/2, 0.43, 0.43, 0.43, 0.2, starting_point, 1)
end

-- Swap ring
function conky_swap(x)
	local starting_point = 3*math.pi / 2
	conky_ring(3, (tonumber(x)-3)/2, 0.64, 0.95, 0.14, 1.0, starting_point, tonumber(conky_parse("${swapperc}"))/100)
	conky_ring(3, (tonumber(x)-3)/2, 0.43, 0.43, 0.43, 0.2, starting_point, 1)
end

function conky_core1(x)
	local starting_point = 3*math.pi / 2
	conky_ring(3, (tonumber(x)-3)/2, 0.64, 0.95, 0.14, 1.0, starting_point, tonumber(conky_parse("${cpu cpu5}"))/100)
	conky_ring(3, (tonumber(x)-3)/2, 0.43, 0.43, 0.43, 0.2, starting_point, 1)
	
	conky_circle(3, ((tonumber(conky_parse("${cpu cpu1}")))/100)*(((tonumber(x)-3)/2) - 3), 0.56, 0.01, 0.99, 1.0, starting_point, 1, x)
	conky_circle(3, ((tonumber(x)-3)/2) - 3, 0.43, 0.43, 0.43, 0.2, starting_point, 1, x)
end

function conky_core2(x)
	local starting_point = 3*math.pi / 2
	conky_ring(3, (tonumber(x)-3)/2, 0.64, 0.95, 0.14, 1.0, starting_point, tonumber(conky_parse("${cpu cpu6}"))/100)
	conky_ring(3, (tonumber(x)-3)/2, 0.43, 0.43, 0.43, 0.2, starting_point, 1)
	
	conky_circle(3, ((tonumber(conky_parse("${cpu cpu2}")))/100)*(((tonumber(x)-3)/2) - 3), 0.56, 0.01, 0.99, 1.0, starting_point, 1, x)
	conky_circle(3, ((tonumber(x)-3)/2) - 3, 0.43, 0.43, 0.43, 0.2, starting_point, 1, x)
end

function conky_core3(x)
	local starting_point = 3*math.pi / 2
	conky_ring(3, (tonumber(x)-3)/2, 0.64, 0.95, 0.14, 1.0, starting_point, tonumber(conky_parse("${cpu cpu7}"))/100)
	conky_ring(3, (tonumber(x)-3)/2, 0.43, 0.43, 0.43, 0.2, starting_point, 1)
	
	conky_circle(3, ((tonumber(conky_parse("${cpu cpu3}")))/100)*(((tonumber(x)-3)/2) - 3), 0.56, 0.01, 0.99, 1.0, starting_point, 1, x)
	conky_circle(3, ((tonumber(x)-3)/2) - 3, 0.43, 0.43, 0.43, 0.2, starting_point, 1, x)
end

function conky_core4(x)
	local starting_point = 3*math.pi / 2
	conky_ring(3, (tonumber(x)-3)/2, 0.64, 0.95, 0.14, 1.0, starting_point, tonumber(conky_parse("${cpu cpu8}"))/100)
	conky_ring(3, (tonumber(x)-3)/2, 0.43, 0.43, 0.43, 0.2, starting_point, 1)
	
	conky_circle(3, ((tonumber(conky_parse("${cpu cpu4}")))/100)*(((tonumber(x)-3)/2) - 3), 0.56, 0.01, 0.99, 1.0, starting_point, 1, x)
	conky_circle(3, ((tonumber(x)-3)/2) - 3, 0.43, 0.43, 0.43, 0.2, starting_point, 1, x)
end

-- Cleanup
function conky_cairo_cleanup()
	cairo_surface_destroy(cs)
	cs = nil
end