extends Component

class_name TopBar

func _init(_props):
	super("topbar",_props)
	state = {menu_open=false}

func toggle_menu():
	props.on_menu_buttom_toggled.call()
	state.menu_open = not state.menu_open
	update_view()

func view():
	return\
	Gui.control({"preset":"expand-h","minimum_size":Vector2(0,30)},[
		Gui.hbox({"preset":"full"},[
			Gui.margin({minimum_size=Vector2(0,0)}),
			Gui.button({
				"preset":"button " + "icon-close-menu" if state.menu_open else "icon-menu",
				"hint_tooltip": "Toggle sidebar",
				"on_pressed":toggle_menu,
			})
		])
	])
