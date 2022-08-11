extends Component
class_name Counter

func _init():
	super("counter")
	state = {"count":0}

func increment():
	state.count = state.count+1
	update_view()

func decrement():
	state.count = state.count-1
	update_view()

func view():
	return\
	Gui.center({preset="expand-h"},[
		Gui.hbox({preset="expand-h"},[
			Gui.button({preset="button",text="-",on_pressed = decrement}),
			Gui.label({text=str(state.count), preset="subtitle", custom_minimum_size=Vector2(50,0), horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER}),
			Gui.button({preset="button",text="+",on_pressed = increment})
		])
	])
