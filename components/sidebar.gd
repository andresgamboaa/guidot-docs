extends Component
class_name SideBar

var scroll:ScrollContainer
var visible = false

func _init(_props:Dictionary):
	super("sidebar", _props)

func component_ready():
	scroll = get_control("scroll")

func component_updated():
	print(scroll)
	if props.visible and not visible:
		var tween = scroll.create_tween()
		tween.set_parallel(true)
		visible = true
		tween.tween_property(scroll, "custom_minimum_size:x", 220.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(scroll, "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	elif not props.visible and visible:
		var tween = scroll.create_tween()
		tween.set_parallel(true)
		visible = false
		tween.tween_property(scroll, "custom_minimum_size:x", 0.0, 0.3).from(220.0).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(scroll, "modulate:a", 0.0, 0.3).from(1.0).set_trans(Tween.TRANS_CUBIC)


func options():
	var output = []
	for option in props.options:
		var preset = "option"
		if option.current:
			preset = "current"
		output.append(
			Gui.button({
				id=option.name,
				preset=preset,
				text=option.name,
				on_pressed=func():props.on_option_pressed.call(option.name)
			})
		)
	return output

func view():
	return \
	Gui.scrollbox({preset="sidebar-scroll clip_contents", id="scroll"}, [
		Gui.color_rect({preset="expand",color=Color("#0f141a")}),
		Gui.margin({preset="expand", const_margin_all=8},[
			Gui.vbox({preset="expand clip_contents"}, 
				options()
			)
		]),
	])
