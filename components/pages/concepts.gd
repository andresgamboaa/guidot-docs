extends Component

class_name Concepts

func _init(_props):
	super("concepts",_props)

func component_ready():
	var scroll = get_control("scroll")
	var tween = scroll.create_tween()
	tween.set_parallel(true)
	tween.tween_property(scroll, "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(scroll, "position:y", scroll.position.y, 0.3).from(scroll.position.y+20.0).set_trans(Tween.TRANS_CUBIC)

func handle_meta_clicked(meta):
	props.on_option_pressed.call(meta)

func view():
	return\
	Gui.scrollbox({preset="scroll-cc-exp",id="scroll"},[
		Gui.margin({preset="margin-cc-exp-h", custom_minimum_size=Vector2(0,0)},[
			Gui.vbox({preset="vbox-cc-exp-h"},[
				Gui.label({preset="title", text="Concepts"}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="If you have ever worked with a frontent library like React, Guidot will feel familiar. There are some important things you need to know before starting to use this library. It is also important that you already know how to create UI with the control nodes and have a good understanding of how they work."}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.rich_label({preset="rich-paragraph", text='Next: [url=Basic Components]Basic Components[/url]', on_meta_clicked=handle_meta_clicked}),
			]),
		])
	])
