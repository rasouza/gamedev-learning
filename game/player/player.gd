extends KinematicBody2D

onready var DIRS = preload("../directions.gd");

onready var input = get_node("/root/input");
onready var body = get_node("Body").get_children();

var anim = "idle_left";
var new_anim = "idle_left";
var speed = Vector2();
var direction;
var canonical_dir = 0;

var COMMON_SPEED = 200;

func _ready():
	input.connect("mouse_click", self, "get_mouse_click");
	set_fixed_process(true);
	
func _fixed_process(delta):
	check_animation();
	apply_speed(delta);
	
func apply_speed(delta):
	if (input.get_action() == "MOVE"):
		speed = direction * COMMON_SPEED * delta;
		move(speed);
	else:
		speed = Vector2();

func check_animation():
	if (speed.length() == 0):
		new_anim = "idle_%s" % DIRS.ANIMS[canonical_dir];
	elif(speed.length() != 0):
		new_anim = "running_%s" % DIRS.ANIMS[canonical_dir];
		
	# Play animation
	if (new_anim != anim):
		play_anim(new_anim);
		anim = new_anim;

func play_anim(animation):
	for child in body:
		child.get_child(0).play(animation);
	
func get_mouse_click(dir):
	direction = (dir - get_pos()).normalized();
	canonical_dir = DIRS.get_closest_direction(direction)
	