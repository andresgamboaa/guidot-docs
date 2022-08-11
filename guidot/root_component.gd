extends BaseRootComponent
class_name RootComponent

func _init():
	super()
	presets_path = "res://styles.tscn"
	
	state = {
		sideBarVisible=false,
		options=[
			{name="Introduction",          current=true},
			{name="Installation",          current=false},
			{name="Concepts",              current=false},
			{name="Basic Components",      current=false},
			{name="Custom Components",     current=false},
			{name="State",                 current=false},
			{name="Signals",               current=false},
			{name="Props",                 current=false},
			{name="Presets",               current=false},
			{name="Lists",                 current=false},
			{name="Conditional rendering", current=false},
			{name="Lifecycle methods",     current=false},
			{name="Getting a control node",current=false},
			{name="Animations",            current=false},
			{name="Add Nodes",         current=false},
		]
	}


func toggleSideBar() -> void: 
	print_orphan_nodes()
	state.sideBarVisible = not state.sideBarVisible
	update_view()
	print_orphan_nodes()


func handle_option_pressed(_name) -> void:
	state.options.filter(func(item): return item.current )[0].current = false
	state.options.filter(func(item): return item.name==_name)[0].current = true
	update_view()


func current_page() -> BaseComponent:
	var current_option = state.options.filter(func(item): return item.current )[0]
	match current_option.name:
		"Introduction":      return Introduction.new({on_option_pressed=handle_option_pressed})
		"Installation":      return Installation.new({on_option_pressed=handle_option_pressed})
		"Concepts":          return Concepts.new({on_option_pressed=handle_option_pressed})
		"Basic Components":  return BasicComponentPage.new({on_option_pressed=handle_option_pressed})
		"Custom Components": return CustomComponentPage.new({on_option_pressed=handle_option_pressed})
		"State":             return State.new({on_option_pressed=handle_option_pressed})
		"Signals":           return Signals.new({on_option_pressed=handle_option_pressed})
		"Props":             return PropsPage.new({on_option_pressed=handle_option_pressed})
		"Lists":             return ListsPage.new({on_option_pressed=handle_option_pressed})
		"Conditional rendering": return ConditionalRendering.new({on_option_pressed=handle_option_pressed})
		"Lifecycle methods": return Lifecycle.new({on_option_pressed=handle_option_pressed})
		"Getting a control node": return ControlPage.new({on_option_pressed=handle_option_pressed})
		"Animations":       return Animations.new({on_option_pressed=handle_option_pressed})
		"Presets":       return PresetsPage.new({on_option_pressed=handle_option_pressed})
		"Add Nodes":       return AddNodes.new({on_option_pressed=handle_option_pressed})
		
	return Gui.nothing()


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
