//setting position of inventory
rowLength = 8;
x = 750;
y = display_get_gui_height() - (12 + (((INVENTORY_SLOTS - 1) div rowLength) + 1) * 36) - 10;

//drawing inventory 
draw_sprite_stretched
(
//sprite
Inventory_item,
//frame
0,
//x value
x,
//y value
y,
//width
12+rowLength*36,
//height
12+(((INVENTORY_SLOTS-1) div rowLength)+1)*36
);

//drawing sprites
for(var i = 0; i <INVENTORY_SLOTS; i ++)
{
	var xx = x + ( i mod rowLength)*36 + 2;
	var yy = y + (i div rowLength)*36 + 2;
	
	draw_sprite(Inventory_Slot, 0 ,xx, yy)
	if(inventory[i] != -1)
	{
		draw_sprite(Inventory_item, inventory[i], xx, yy);
	}
}