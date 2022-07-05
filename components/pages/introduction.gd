extends Component

class_name Introduction

func _init(_props):
	super("intro", _props)


func ready():
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


func handle_meta_clicked(meta):
	props.on_option_pressed.call(meta)


func gui():
	return\
	Goo.scrollbox({"preset":"scroll-cc-exp","id":"scroll"},[
		Goo.margin({"preset":"margin-cc-exp-h", "minimum_size":Vector2(400,0)},[
			Goo.vbox({"preset":"vbox-cc-exp-h"},[
				Goo.rich_label({"preset":"animated-title","text":"[center][wave]Goodoo[/wave][/center]"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({"preset":"paragraph", "text":"Goodoo is a GDScript library for building interactive user interfaces with Godot Engine 4.\nInspired by React, Goodoo renders and updates the UI of components based on their state. When data in the state changes, Goodoo will update all the control nodes that need to change, making easier to keep the data and the UI in sync."}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.hbox({preset="expand-h"},[
					Goo.hbox({preset="expand-h", size_flags_stretch_ratio=2},[
						Code.new({gdscript=true, text='func _init():\n\tsuper()\n\tstate = {count=0}\n\nfunc increment():\n\tstate.count += 1\n\nfunc gui():\n\treturn\\\n\tGoo.center({preset="full"}, [\n\t\tGoo.button({\n\t\t\ttext=str(state.count)\n\t\t\ton_pressed=increment\n\t\t})\n\t])'}),						
					]),
					SimpleCounter.new()
				]),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="Create reusable components that can be easily used throughout the application."}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.hbox({preset="expand-h"},[
					Goo.hbox({preset="expand-h", size_flags_stretch_ratio=2},[
						Code.new({gdscript=true, text='func gui():\n\treturn\\\n\tGoo.center({preset="full"}, [\n\t\tGoo.vbox({},[\n\t\t\tCounter.new(),\n\t\t\tCounter.new(),\n\t\t\tCounter.new()\n\t\t})\n\t])'}),
					]),
					Goo.control({preset="expand"},[
						Goo.color_rect({preset="full",color=Color("#202531")}),
						Goo.center({preset="full"},[
							Goo.vbox({preset="expand"},[
								Counter.new(),
								Counter.new(),
								Counter.new()
							])
						])
					])
				]),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="Configure control nodes in the inspector, and use their properties as presets to easily styled the UI."}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.scrollbox({preset="expand-h",minimum_size=Vector2(0,360)},[
					Goo.center({preset="expand-h",minimum_size=Vector2(640,360)},[
						Goo.texture_rect({id="image1"}),
					])
				]),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.hbox({preset="expand-h"},[
					Goo.hbox({preset="expand-h", size_flags_stretch_ratio=2},[
						Code.new({gdscript=true, text='func gui():\n\treturn\\\n\tGoo.center({preset="full"}, [\n\t\tGoo.vbox({},[\n\t\t\tGoo.button({preset="blue", text="Blue"}),\n\t\t\tGoo.button({preset="red", text="Red"}),\n\t\t\tGoo.button({preset="green", text="Green"}),\n\t\t})\n\t])'}),
					]),
					Goo.control({preset="expand"},[
						Goo.color_rect({preset="full",color=Color("#202531")}),
						Goo.center({preset="full"},[
							Goo.vbox({preset="expand"},[
								Goo.button({preset="blue", text="Blue"}),
								Goo.button({preset="red", text="Red"}),
								Goo.button({preset="green", text="Green"}),
							])
						])
					])
				]),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="Goodoo will help you to create complex apps in Godot with a more readable and mantainable code."}),
				Goo.label({preset="paragraph", text="Here is part of the code of this application:"}),
				Goo.hbox({preset="expand-h", size_flags_stretch_ratio=2},[
					Code.new({gdscript=true, text='func gui():\n\treturn\\\n\tGoo.hbox({preset="full"},[\n\t\tSideBar.new({\n\t\t\tvisible=state.sideBarVisible, \n\t\t\toptions=state.options,\n\t\t\ton_option_pressed=handle_option_pressed\n\t\t}),\n\t\tGoo.vbox({preset="expand"},[\n\t\t\tTopBar.new({on_menu_buttom_toggled=toggleSideBar}),\n\t\t\tcurrent_page()\n\t\t])\n\t])'}),
				]),
				Goo.rich_label({preset="rich-paragraph", text='Next: [url=Installation]Installation[/url]', on_meta_clicked=handle_meta_clicked}),
				Goo.margin({minimum_size=Vector2(0,10)}),
			]),
		])
	])
