extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var acc = 0;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true);
	pass

func _process(delta):
	acc += delta;
	set_text(str(acc));