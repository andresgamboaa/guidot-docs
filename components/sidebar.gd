extends Component
class_name SideBar

var scroll:ScrollContainer
var visible = false

func _init(_input):
	super("sidebar",_input)

func ready():
	scroll = get_control("scroll")

func updated():
	print(props.visible)
	if props.visible and not visible:
		print("extending")
		var tween = scroll.create_tween()
		tween.set_parallel(true)
		visible = true
		tween.tween_property(scroll, "minimum_size:x", 220.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(scroll, "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	elif not props.visible and visible:
		print("collapsing")
		var tween = scroll.create_tween()
		tween.set_parallel(true)
		visible = false
		tween.tween_property(scroll, "minimum_size:x", 0.0, 0.3).from(220.0).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(scroll, "modulate:a", 0.0, 0.3).from(1.0).set_trans(Tween.TRANS_CUBIC)


func options():
	var output = []
	for option in props.options:
		var preset = "option"
		if option.current:
			preset = "current"
		output.append(
			Goo.button({
				id=option.name,
				preset=preset,
				text=option.name,
				on_pressed=func():props.on_option_pressed.call(option.name)
			})
		)
	return output

func gui():
	return \
	Goo.scrollbox({preset="sidebar-scroll clip_contents", id="scroll"}, [
		Goo.color_rect({preset="expand",color=Color("#0f141a")}),
		Goo.margin({preset="expand", const_margin_all=8},[
			Goo.vbox({preset="expand clip_contents"}, 
				options()
			)
		]),
	])
