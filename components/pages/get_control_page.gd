extends Component

class_name ControlPage

func _init(_props):
	super("controlPage",_props)

func component_ready():
	var scroll = get_control("scroll")
	var tween = scroll.create_tween()
	tween.set_parallel(true)
	tween.tween_property(scroll, "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(scroll, "position:y", scroll.position.y, 0.3).from(scroll.position.y+20.0).set_trans(Tween.TRANS_CUBIC)

func handle_meta_clicked(meta): props.on_option_pressed.call(meta)

func view():
	return\
	Gui.scrollbox({preset="scroll-cc-exp",id="scroll"},[
		Gui.margin({preset="margin-cc-exp-h", minimum_size=Vector2(0,0)},[
			Gui.vbox({preset="vbox-cc-exp-h"},[
				Gui.label({preset="title", text="Getting a control node"}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="If you need it you can get a control node by passing an id."}),
				Code.new({gdscript=true,text='func component_ready():\n\tvar button = get_control("my_button")\n\nfunc view():\n\treturn Gui.center({preset="full"}, [\n\t\tGui.button({id="my_button"})\n\t])\n'}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Call the get_control(id) method in the component_ready() method."}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.rich_label({preset="rich-paragraph", text='Next: [url=Animations]Animations[/url]', on_meta_clicked=handle_meta_clicked}),
			]),
		])
	])

