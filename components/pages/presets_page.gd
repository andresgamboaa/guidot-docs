extends Component

class_name PresetsPage

func _init(_props):
	super("presetspage",_props)

func component_ready():
	var scroll = get_control("scroll")
	var tween = scroll.create_tween()
	tween.set_parallel(true)
	tween.tween_property(scroll, "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(scroll, "position:y", scroll.position.y, 0.3).from(scroll.position.y+20.0).set_trans(Tween.TRANS_CUBIC)

func handle_meta_clicked(meta): props.on_option_pressed.call(meta)

func view():
	return\
	Gui.smoothScrollbox({preset="scroll-cc-exp",id="scroll"},[
		Gui.margin({preset="margin-cc-exp-h", minimum_size=Vector2(0,0)},[
			Gui.vbox({preset="vbox-cc-exp-h"},[
				Gui.label({preset="title", text="Presets"}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Configuring a control node through code could be difficult, even more when you have to specify the properties that you want to change in a dictionary, without code completion. This is why presets exists. You can create a scene with some control nodes, change their properties and use them as presets to style and configure BasicComponents."}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.scrollbox({preset="expand-h",custom_minimum_size=Vector2(0,360)},[
					Gui.center({preset="expand-h",custom_minimum_size=Vector2(640,360)},[
						Gui.texture_rect({texture=load("res://assets/image1.png"),stretch_mode = TextureRect.STRETCH_KEEP_CENTERED}),
					])
				]),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Set the path of the scene in your RootComponent."}),
				Code.new({gdscript=true, text='extends BaseRootComponent\nclass_name RootComponent\n\nfunc _init():\n\tsuper()\n\tpresets_path = "res://styles.tscn"'}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="The names of the nodes will be the names of the presets. Use an underscore before the name of the node to ignore a node that you don't want as a preset, useful to ignore nodes that are only there to contain other nodes, like the _buttons control node."}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
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
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="If you are a web developer you can think of presets as CSS classes.\nYou can use more than one preset in a BasicComponent where the second one overwrites the first one."}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Code.new({gdscript=true, text='Gui.label({preset="red-label title"})'}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Guidot includes some presets that are useful to position control nodes"}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Code.new({gdscript=true, text='"top-left": anchors_preset = 0\n"top-right":anchors_preset = 1\n"bottom-right": anchors_preset = 3\n"bottom-left": anchors_preset = 2\n"center-left": anchors_preset = 4\n"center-top": anchors_preset = 5\n"center-right": anchors_preset = 6\n"center-bottom": anchors_preset = 7\n"center": anchors_preset = 8\n"left-w": anchors_preset = 9\n"top-w": anchors_preset = 10\n"right-w": anchors_preset = 11\n"bottom-w": anchors_preset = 12\n"v-center-w": anchors_preset = 13\n"h-center-w":anchors_preset = 14\n"full":anchors_preset = 15\n\nchild of containers\n"expand-h": {\n\tsize_flags_horizontal = 3,\n\tsize_flags_vertical = 0,\n}\n"expand-v": {\n\tsize_flags_horizontal = 3,\n\tsize_flags_vertical = 0,\n}\n"expand": {\n\tsize_flags_horizontal = 3,\n\tsize_flags_vertical = 3,\n}\n\n"clip_contents": {\n\tclip_contents = true\n}\n'}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.rich_label({preset="rich-paragraph", text='Next: [url=Lists]Lists[/url]', on_meta_clicked=handle_meta_clicked}),
			]),
		])
	])
