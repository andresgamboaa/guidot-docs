extends Component
class_name Counter

func _init():
	super("counter")
	state = {"count":0}

func increment():
	state.count = state.count+1

func decrement():
	state.count = state.count-1

func gui():
	return\
	Goo.center({preset="expand-h"},[
		Goo.hbox({preset="expand-h"},[
			Goo.button({preset="button",text="-",on_pressed = decrement}),
			Goo.label({text=str(state.count), preset="subtitle", minimum_size=Vector2(50,0), horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER}),
			Goo.button({preset="button",text="+",on_pressed = increment})
		])
	])
