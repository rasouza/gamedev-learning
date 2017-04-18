extends Node

const DOWN = 0;
const DOWN_RIGHT = 1;
const RIGHT = 2;
const UP_RIGHT = 3;
const UP = 4;
const UP_LEFT = 5;
const LEFT = 6;
const DOWN_LEFT = 7;

const VECTOR = [
	Vector2(cos(-2*PI/4 ), -sin(-2*PI/4 )),
	Vector2(cos(-1 * PI/4), -sin(-1 * PI/4)),
	Vector2(cos( 0*PI/4 ), -sin( 0*PI/4 )),
	Vector2(cos( 1 * PI/4), -sin( 1 * PI/4)),
	Vector2(cos( 2*PI/4 ), -sin( 2*PI/4 )),
	Vector2(cos( 3 * PI/4), -sin( 3 * PI/4)),
	Vector2(cos( 4*PI/4 ), -sin( 4*PI/4 )),
	Vector2(cos(-3 * PI/4), -sin(-3 * PI/4)),
]

const ANIMS = [
	"down",
	"down_right",
	"right",
	"up_right",
	"up",
	"up_left",
	"left",
	"down_left"
]

static func get_closest_direction(direction):
	var angle = direction.angle();
	return fmod(round( 8 * angle / (2*PI) + 8 ), 8);