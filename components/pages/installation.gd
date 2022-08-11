extends Component

class_name Installation

func _init(_props):
	super("installation",_props)

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
				Gui.label({preset="title", text="Installation"}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Code.new({gdscript=false,text="git clone https://github.com/andresgamboaa/guidot.git"}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Copy the guidot folder in your project and enable the Guidot, Gui and Utils singletons (Autoload)."}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.rich_label({preset="rich-paragraph", text='Next: [url=Concepts]Concepts[/url]', on_meta_clicked=handle_meta_clicked}),
			]),
		])
	])
