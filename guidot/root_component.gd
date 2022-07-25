extends BaseRootComponent
class_name RootComponent

func _init():
	super()
	presets_path = "res://styles.tscn"
	
	state = {
		sideBarVisible=false,
		options=[
			{name="Introduction", current=true},
			{name="Installation", current=false},
			{name="Concepts:", current=false},
			{name="Basic Components", current=false},
			{name="Custom Components", current=false},
			{name="State", current=false},
			{name="Signals", current=false},
			{name="Props", current=false},
			{name="Presets", current=false},
			{name="Lists", current=false},
			{name="Conditional rendering", current=false},
			{name="Getting a control node", current=false},
			{name="Animations", current=false},
			{name="Http requests", current=false},
		]
	}


func toggleSideBar() -> void:
	print("toggle")
	state.sideBarVisible = not state.sideBarVisible


func handle_option_pressed(_name) -> void:
	state.options.filter(func(item): return item.current )[0].current = false
	state.options.filter(func(item): return item.name==_name)[0].current = true
	update_view()


func current_page() -> BaseComponent:
	var current_option = state.options.filter(func(item): return item.current )[0]
	match current_option.name:
		"Introduction": return Introduction.new({on_option_pressed=handle_option_pressed})
		"Installation": return Installation.new()
		"Concepts:": return Concepts.new()
		"Basic Components": return BasicComponentPage.new()
		"Custom Components": return CustomComponentPage.new()
		"State": return State.new()
		"Signals": return Signals.new()
		"Props": return PropsPage.new()
		"Lists": return ListsPage.new()
		_:         return Gui.nothing()


func view() -> BasicComponent:
	return\
	Gui.hbox({preset="full"},[
		SideBar.new({
			visible=state.sideBarVisible, 
			options=state.options,
			on_option_pressed=handle_option_pressed
		}),
		Gui.vbox({preset="expand"},[
			TopBar.new({on_menu_buttom_toggled=toggleSideBar}),
			current_page()
		])
	])
