extends Component

class_name BasicComponentPage

func _init():
	super("basiccomponentpage")

func component_ready():
	var scroll = get_control("scroll")
	var tween = scroll.create_tween()
	tween.set_parallel(true)
	tween.tween_property(scroll, "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(scroll, "position:y", scroll.position.y, 0.3).from(scroll.position.y+20.0).set_trans(Tween.TRANS_CUBIC)

func handle_meta_clicked(meta):
	print(meta)
	props.on_option_pressed.call(meta)

func view():
	return\
	Gui.scrollbox({preset="scroll-cc-exp",id="scroll"},[
		Gui.margin({preset="margin-cc-exp-h", minimum_size=Vector2(0,0)},[
			Gui.vbox({preset="vbox-cc-exp-h"},[
				Gui.label({preset="title", text="Basic Components"}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Basic Components represent control nodes.\nThey are created with the methods provided by the Gui singleton (Autoload)."}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.hbox({preset="expand-h"},[
					Code.new({gdscript=true, text='func vbox(properties:Dictionary={}, children:Array=[]):\n\treturn BasicComponent.new(properties, "vbox", children)'}),
				]),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph",text='This methods recieve a dictionary with the properties of the control node that the BasicComponent represents and an array of children (Other Basic Components or Custom Components).'}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.hbox({preset="expand-h"},[
					Code.new({gdscript=true, text='Gui.vbox({},[\n\t Gui.button({text="Click me"}),\n\t Gui.label({text="Hello World!"}),\n\t MyComponent.new()\n})'}),
				]),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.rich_label({preset="rich-paragraph", text='Next: [url=]Your first G app[/url]'}),
			]),
		])
	])
