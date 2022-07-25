extends Component

class_name PropsPage

func _init():
	super("props")

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
				Gui.label({preset="title", text="Props"}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="To pass data to a Component, make a parameter of type Dictionary and pass it to super() like this:"}),
				Code.new({gdscript=true,text="func _init(_props:Dictionary):\n\tsuper(\"myComponent\", _props)"}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Then you will be able to access the data."}),
				Code.new({gdscript=true,text="func view():\n\treturn\\\n\tGui.center({preset=\"full\"},[\n\t\tGui.button({text=props.text, on_pressed=props.a_funtion})\n\t])"}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.rich_label({preset="rich-paragraph", text='Next: [url=]Your first Guidot app[/url]'}),
			]),
		])
	])
