extends TextureProgress

onready var cursor = get_node("Cursor");
onready var text = get_node("Text");
onready var value = get_value();

func _ready():
	set_process_input(true);
	
func _input(event):
	if(event.is_action_pressed("ui_left")):
		value -= 10;
	if(event.is_action_pressed("ui_right")):
		value += 10;
	value = clamp(value, 0, 100);
	set_value(value);

func _on_Bar_value_changed( value ):
	var dx = get_size().width/100.0;
	cursor.set_pos(Vector2(dx*value,  cursor.get_pos().y));
	text.set_text("%s/100" % value);
	
