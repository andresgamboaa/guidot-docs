extends Component

class_name TodoItem

func _init(_props:Dictionary):
	super("todoitem", _props)

func updated():
	get_control("rich").text = props.data.todo

func view():
	return\
	Gui.hbox({preset="expand-h"},[
		Gui.label({id="rich",preset="expand-h",text=props.data.todo}),
		Gui.button({
			text="X",
			on_pressed=func():props.on_delete.call(props.data.id)
		})
	])
