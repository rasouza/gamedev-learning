extends TextureProgress

var value = 0;
var hp = 0;

func _ready():
	set_process(true);
	
func _process(delta):
	if(Input.is_action_pressed("ui_left") and value > 0):
		value -= 1;
	if(Input.is_action_pressed("ui_right") and value < 100):
		value += 1;
	set_value(value);
	hp = max(5, min(value, 95));
	hp *= get_size().x/100.0; 
	get_node("Cursor").set_pos(Vector2(hp - 22, 16));
	get_node("Text").set_text("%s/100" % value);
