extends Component
class_name AnimatedButton

var button: Button
var tween: Tween

func _init():
	super("animatedbutton")

func component_ready():
	button = get_control("button")

func animate():
	tween = button.create_tween()
	tween.tween_property(button, "scale", Vector2(2.0, 2.0), 0.1).from(Vector2(2.0,2.0)).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(button, "scale", Vector2(1.0,1.0), 0.1).from(Vector2(2.0,2.0)).set_trans(Tween.TRANS_BOUNCE)


func view():
	return\
	Gui.center({preset="expand"},[
		Gui.button({text="click me", on_pressed=animate, id="button"})
	])
