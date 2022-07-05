extends Component
class_name SimpleCounter

func _init():
	super("simplecounter")
	state = {"count":0}

func increment():
	state.count = state.count+1

func gui():
	return\
	Goo.control({preset="expand"},[
		Goo.color_rect({preset="full",color=Color("#202531")}),
		Goo.center({preset="full"},[
			Goo.button({text=str(state.count),on_pressed=increment})
		])
	])
