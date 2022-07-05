extends Component

class_name BasicComponentPage

func _init():
	super("basiccomponentpage")

func ready():
	var scroll = get_control("scroll")
	var tween = scroll.create_tween()
	tween.set_parallel(true)
	tween.tween_property(scroll, "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(scroll, "position:y", scroll.position.y, 0.3).from(scroll.position.y+20.0).set_trans(Tween.TRANS_CUBIC)

func handle_meta_clicked(meta):
	print(meta)
	props.on_option_pressed.call(meta)

func gui():
	return\
	Goo.scrollbox({preset="scroll-cc-exp",id="scroll"},[
		Goo.margin({preset="margin-cc-exp-h", minimum_size=Vector2(0,0)},[
			Goo.vbox({preset="vbox-cc-exp-h"},[
				Goo.label({preset="title", text="Basic Components"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="Basic Components represent control nodes.\nThey are created with the methods provided by the Goo singleton (Autoload)."}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.hbox({preset="expand-h"},[
					Code.new({gdscript=true, text='func vbox(properties:Dictionary={}, children:Array=[]):\n\treturn BasicComponent.new(properties, "vbox", children)'}),
				]),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph",text='This methods recieve a dictionary with the properties of the control node that the BasicComponent represents and an array of children (Other Basic Components or Custom Components).'}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.hbox({preset="expand-h"},[
					Code.new({gdscript=true, text='Goo.vbox({},[\n\tGoo.button({text="Click me"}),\n\tGoo.label({text="Hello World!"}),\n\tMyComponent.new()\n})'}),
				]),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.rich_label({preset="rich-paragraph", text='Next: [url=]Your first Goodoo app[/url]'}),
			]),
		])
	])
