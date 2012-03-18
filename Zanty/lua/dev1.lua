--[[
Conky Widgets by londonali1010 (2009)

Call this script in Conky using the following before TEXT (assuming you save this script to ~/scripts/conky_widgets.lua):
	lua_load ~/Scripts/conky_widgets.lua
	lua_draw_hook_pre load_text ]]

require 'cairo'
function draw_text()
	if conky_window==nil then return end
	local w=conky_window.width
	local h=conky_window.height
	local cs=cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, w, h)
	cr=cairo_create(cs)

	
		
-- Font
cairo_select_font_face (cr, "Impact", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);

-- font size
cairo_set_font_size (cr, 60.0);

--font color
cairo_set_source_rgba (cr, 0.192156863, 0.180392157, 0.156862745, 1);

cairo_translate (cr, -0.0, 0.0);
-- angle
cairo_rotate(cr,-0.52);

-- text position
cairo_move_to (cr, -150.0, 770.0);

-- shown text
cairo_show_text (cr, conky_parse('${time %H:%M}'));

cairo_set_font_size (cr, 40.0);
cairo_move_to (cr, 550.0, 725.0);
cairo_set_source_rgba (cr, 0.192156863, 0.180392157, 0.156862745, 0.7);
cairo_show_text (cr, conky_parse('${cpu cpu1}%'));

cairo_set_font_size (cr, 55.0);
cairo_move_to (cr, 530.0, 785.0);
cairo_set_source_rgba (cr, 0.325490196, 0.258823529, 0.035294118, 0.2);
cairo_show_text (cr, 'CPU1');

cairo_set_font_size (cr, 40.0);
cairo_move_to (cr, 650.0, 680.0);
cairo_set_source_rgba (cr, 0.192156863, 0.180392157, 0.156862745, 0.7);
cairo_show_text (cr, conky_parse('${cpu cpu2}%'));

cairo_set_font_size (cr, 60.0);
cairo_move_to (cr, 620.0, 630.0);
cairo_set_source_rgba (cr, 0.325490196, 0.258823529, 0.035294118, 0.2);
cairo_show_text (cr, 'CPU2');

cairo_set_font_size (cr, 40.0);
cairo_move_to (cr, 155.0, 485.0);
cairo_set_source_rgba (cr, 0.192156863, 0.180392157, 0.156862745, 0.7);
cairo_show_text (cr, conky_parse('${mem}'));

cairo_set_font_size (cr, 60.0);
cairo_move_to (cr, 160.0, 430.0);
cairo_set_source_rgba (cr, 0.325490196, 0.258823529, 0.035294118, 0.2);
cairo_show_text (cr, 'RAM');

cairo_set_font_size (cr, 40.0);
cairo_move_to (cr, 355.0, 565.0);
cairo_set_source_rgba (cr, 0.192156863, 0.180392157, 0.156862745, 0.7);
cairo_show_text (cr, conky_parse('${fs_free /}'));

cairo_set_font_size (cr, 55.0);
cairo_move_to (cr, 355.0, 640.0);
cairo_set_source_rgba (cr, 0.325490196, 0.258823529, 0.035294118, 0.2);
cairo_show_text (cr, 'ROOT');

cairo_stroke (cr);




end



function conky_load_text()
 if conky_window==nil then return end
    local cs=cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)
    
    local cr=cairo_create(cs)    
    
    local updates=conky_parse('${updates}')
    update_num=tonumber(updates)
    
    if update_num>5 then
       draw_text()
    end
end


