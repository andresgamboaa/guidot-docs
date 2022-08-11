extends Component
class_name SimpleCounter

func _init():
	super("simplecounter")
	state = {"count":0}

func increment():
	state.count = state.count+1
	update_view()

func view():
	return\
	Gui.control({preset="expand"},[
		Gui.color_rect({preset="full",color=Color("#202531")}),
		Gui.center({preset="full"},[
			Gui.button({text=str(state.count),on_pressed=increment})
		])
	])
