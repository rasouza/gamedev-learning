extends Node2D

signal mouse_click(direction);

var act;

func _ready():
	set_process_input(true);
	set_fixed_process(true);
	
func _fixed_process(delta):
	check_mouse_move();
	
func _input(event):
	get_action();

func get_action():
	act = null;
	if (Input.is_action_pressed("mouse_click")):
		act = "MOVE";
	return act;
	
func check_mouse_move():
	if (Input.is_action_pressed("mouse_click")):
		emit_signal("mouse_click", get_global_mouse_pos());