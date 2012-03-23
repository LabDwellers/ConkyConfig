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

function reverse_conky_ring(width, radius, colorR, colorG, colorB, colorA, start, perc)
	if conky_window == nil then return end
	if cs == nil or cairo_xlib_surface_get_width(cs) ~= conky_window.width or cairo_xlib_surface_get_height(cs) ~= conky_window.height then
		if cs then cairo_surface_destroy(cs)end
		cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	end
	if cr then cairo_destroy(cr) end
	cr = cairo_create(cs)
	cairo_set_line_width (cr, width)
	cairo_set_source_rgba (cr, colorR, colorG, colorB, colorA)
	cairo_arc_negative (cr, radius+(width/2), radius+(width/2), radius, start, start-perc*2*math.pi)
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

function conky_cpu(x)
	local starting_point = 3*math.pi / 2
	conky_ring(6, (tonumber(x)-6)/2, 0.96, 0.01, 0.23, 1.0, starting_point, tonumber(conky_parse("${cpu cpu0}"))/100)
	conky_ring(6, (tonumber(x)-6)/2, 0.43, 0.43, 0.43, 0.2, starting_point, 1)
end

function conky_core1(x)
	local starting_point = 3*math.pi / 2
	conky_ring(3, (tonumber(x)-3)/2, 1, 0.61, 0.01, 1.0, starting_point, tonumber(conky_parse("${cpu cpu5}"))/100)
	conky_ring(3, (tonumber(x)-3)/2, 0.43, 0.43, 0.43, 0.2, starting_point, 1)
	
	conky_circle(3, ((tonumber(conky_parse("${cpu cpu1}")))/100)*(((tonumber(x)-3)/2) - 3), 0.56, 0.01, 0.99, 1.0, starting_point, 1, x)
	conky_circle(3, ((tonumber(x)-3)/2) - 3, 0.43, 0.43, 0.43, 0.2, starting_point, 1, x)
end

function conky_core2(x)
	local starting_point = 3*math.pi / 2
	conky_ring(3, (tonumber(x)-3)/2, 1, 0.61, 0.01, 1.0, starting_point, tonumber(conky_parse("${cpu cpu6}"))/100)
	conky_ring(3, (tonumber(x)-3)/2, 0.43, 0.43, 0.43, 0.2, starting_point, 1)
	
	conky_circle(3, ((tonumber(conky_parse("${cpu cpu2}")))/100)*(((tonumber(x)-3)/2) - 3), 0.56, 0.01, 0.99, 1.0, starting_point, 1, x)
	conky_circle(3, ((tonumber(x)-3)/2) - 3, 0.43, 0.43, 0.43, 0.2, starting_point, 1, x)
end

function conky_core3(x)
	local starting_point = 3*math.pi / 2
	conky_ring(3, (tonumber(x)-3)/2, 1, 0.61, 0.01, 1.0, starting_point, tonumber(conky_parse("${cpu cpu7}"))/100)
	conky_ring(3, (tonumber(x)-3)/2, 0.43, 0.43, 0.43, 0.2, starting_point, 1)
	
	conky_circle(3, ((tonumber(conky_parse("${cpu cpu3}")))/100)*(((tonumber(x)-3)/2) - 3), 0.56, 0.01, 0.99, 1.0, starting_point, 1, x)
	conky_circle(3, ((tonumber(x)-3)/2) - 3, 0.43, 0.43, 0.43, 0.2, starting_point, 1, x)
end

function conky_core4(x)
	local starting_point = 3*math.pi / 2
	conky_ring(3, (tonumber(x)-3)/2, 1, 0.61, 0.01, 1.0, starting_point, tonumber(conky_parse("${cpu cpu8}"))/100)
	conky_ring(3, (tonumber(x)-3)/2, 0.43, 0.43, 0.43, 0.2, starting_point, 1)
	
	conky_circle(3, ((tonumber(conky_parse("${cpu cpu4}")))/100)*(((tonumber(x)-3)/2) - 3), 0.56, 0.01, 0.99, 1.0, starting_point, 1, x)
	conky_circle(3, ((tonumber(x)-3)/2) - 3, 0.43, 0.43, 0.43, 0.2, starting_point, 1, x)
end

function conky_network(x)
	local starting_point = 3*math.pi / 2
	local upload_speed = tonumber(conky_parse("${upspeedf wlan0}"))
	local download_speed = tonumber(conky_parse("${downspeedf wlan0}"))
	-- Time for percents
	local upload_percent = 0
	local download_percent = 0
	-- Color values
	-- upload
	local u_r = 0.015
	local u_g = 0.999
	local u_b = 0.592
	-- download 0.96, 0.01, 0.23
	local d_r = 0.96
	local d_g = 0.01
	local d_b = 0.23
	-- Upload Speed conditions
	if upload_speed < 100 then
		upload_percent = upload_speed / 100
		else
		upload_percent = 1
	end
	
	if download_speed < 500 then
		download_percent = download_speed / 500
		else
		download_percent = 1
	end
	
	conky_circle(10, ((tonumber(conky_parse("${wireless_link_qual_perc wlan0}")))/100)*(((tonumber(x)-10)/2) - 10), 0.56, 0.01, 0.99, 1.0, starting_point, 1, x)
	conky_circle(10, 1*(((tonumber(x)-10)/2) - 10), 0.43, 0.43, 0.43, 0.2, starting_point, 1, x)
	
	conky_ring(5, (tonumber(x)-5)/2, 0.43, 0.43, 0.43, 0.2, starting_point, 1)
	conky_ring(5, (tonumber(x)-5)/2, u_r, u_g, u_b, 1, starting_point, upload_percent/2)
	reverse_conky_ring(5, (tonumber(x)-5)/2, d_r, d_g, d_b, 1, starting_point, download_percent/2)
end

-- Cleanup
function conky_cairo_cleanup()
	cairo_surface_destroy(cs)
	cs = nil
end