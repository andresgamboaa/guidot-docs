extends Component
class_name Conditional

func _init():
	super("condi")
	state = {"show_label":false}

func toggle():
	state.show_label = !state.show_label
	update_view()

func view():
	return\
	Gui.control({preset="expand"},[
		Gui.color_rect({preset="full",color=Color("#202531")}),
		Gui.center({preset="full"},[
			Gui.show_if(state.show_label,
				Gui.label({text="Hi"})
			)
		]),
		Gui.button({preset="center-bottom",text="hide"if state.show_label else "show", on_pressed=toggle})
	])
