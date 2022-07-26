extends Component

class_name Introduction

func _init(_props):
	super("intro", _props)


func component_ready() -> void:
	var scroll :ScrollContainer
	scroll = get_control("scroll")
	var tween = scroll.create_tween()
	tween.set_parallel(true)
	tween.tween_property(scroll, "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(scroll, "position:y", scroll.position.y, 0.3).from(scroll.position.y+10.0).set_trans(Tween.TRANS_CUBIC)
	
	var image1 : TextureRect
	image1 = get_control("image1")
	image1.texture = load("res://assets/image1.png")
	image1.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED


func handle_meta_clicked(meta) -> void:
	props.on_option_pressed.call(meta)


func view() -> BasicComponent:
	return\
	Gui.smoothScrollbox({"preset":"scroll-cc-exp","id":"scroll"},[
		Gui.margin({"preset":"margin-cc-exp-h", "minimum_size":Vector2(400,0)},[
			Gui.vbox({"preset":"vbox-cc-exp-h"},[
				Gui.rich_label({"preset":"animated-title","text":"[center][wave]Guidot[/wave][/center]"}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({"preset":"paragraph", "text":"Guidot is a GDScript library for building interactive user interfaces with Godot Engine 4.\nInspired by React, Guidot renders and updates the UI of components based on their state. When data in the state changes, Guidot will update all the control nodes that need to change, making easier to keep the data and the UI in sync."}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.hbox({preset="expand-h"},[
					Gui.hbox({preset="expand-h", size_flags_stretch_ratio=2},[
						Code.new({gdscript=true, text='func _init():\n\tsuper()\n\tstate = {count=0}\n\nfunc increment():\n\tstate.count += 1\n\nfunc view():\n\treturn\\\n\tGui.center({preset="full"}, [\n\t\tGui.button({\n\t\t\ttext=str(state.count)\n\t\t\ton_pressed=increment\n\t\t})\n\t])'}),						
					]),
					SimpleCounter.new()
				]),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Create reusable components that can be easily used throughout the application."}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.hbox({preset="expand-h"},[
					Gui.hbox({preset="expand-h", size_flags_stretch_ratio=2},[
						Code.new({gdscript=true, text='func view():\n\treturn\\\n\tGui.center({preset="full"}, [\n\t\tGui.vbox({},[\n\t\t\tCounter.new(),\n\t\t\tCounter.new(),\n\t\t\tCounter.new()\n\t\t})\n\t])'}),
					]),
					Gui.control({preset="expand"},[
						Gui.color_rect({preset="full",color=Color("#202531")}),
						Gui.center({preset="full"},[
							Gui.vbox({preset="expand"},[
								Counter.new(),
								Counter.new(),
								Counter.new()
							])
						])
					])
				]),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Configure control nodes in the inspector, and use their properties as presets to easily styled the UI."}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.scrollbox({preset="expand-h",minimum_size=Vector2(0,360)},[
					Gui.center({preset="expand-h",minimum_size=Vector2(640,360)},[
						Gui.texture_rect({id="image1"}),
					])
				]),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.hbox({preset="expand-h"},[
					Gui.hbox({preset="expand-h", size_flags_stretch_ratio=2},[
						Code.new({gdscript=true, text='func view():\n\treturn\\\n\tGui.center({preset="full"}, [\n\t\tGui.vbox({},[\n\t\t\tGui.button({preset="blue", text="Blue"}),\n\t\t\tGui.button({preset="red", text="Red"}),\n\t\t\tGui.button({preset="green", text="Green"}),\n\t\t\tGui.button({preset="blue", text="Another Blue"}),\n\t\t})\n\t])'}),
					]),
					Gui.control({preset="expand"},[
						Gui.color_rect({preset="full",color=Color("#202531")}),
						Gui.center({preset="full"},[
							Gui.vbox({preset="expand"},[
								Gui.button({preset="blue", text="Blue"}),
								Gui.button({preset="red", text="Red"}),
								Gui.button({preset="green", text="Green"}),
								Gui.button({preset="blue", text="Another Blue"}),
							])
						])
					])
				]),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Guidot will help you to create complex apps in Godot with a more readable and mantainable code."}),
				Gui.label({preset="paragraph", text="Here is part of the code of this application:"}),
				Gui.hbox({preset="expand-h", size_flags_stretch_ratio=2},[
					Code.new({gdscript=true, text='func view():\n\treturn\\\n\tGui.hbox({preset="full"},[\n\t\tSideBar.new({\n\t\t\tvisible=state.sideBarVisible, \n\t\t\toptions=state.options,\n\t\t\ton_option_pressed=handle_option_pressed\n\t\t}),\n\t\tGui.vbox({preset="expand"},[\n\t\t\tTopBar.new({on_menu_buttom_toggled=toggleSideBar}),\n\t\t\tcurrent_page()\n\t\t])\n\t])'}),
				]),
				Gui.rich_label({preset="rich-paragraph", text='Next: [url=Installation]Installation[/url]', on_meta_clicked=handle_meta_clicked}),
				Gui.margin({minimum_size=Vector2(0,10)}),
			]),
		])
	])
