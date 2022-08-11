extends Component

class_name Lifecycle

func _init(_props):
	super("lifecycle",_props)

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
				Gui.label({preset="title", text="Lifecycle methods"}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="The component_ready() method is executed right after the component and its children have been rendered the first time."}),
				Code.new({gdscript=true,text="func component_ready():\n\tvar text_edit = get_control(\"text_edit\")"}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="The component_updated() method is executed every time the component has been updated after state or props changes."}),
				Code.new({gdscript=true,text="func component_updated():\n\tprint(\"component updated\")"}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="The component_will_die() method is executed when the component is about to be destroyed."}),
				Code.new({gdscript=true,text="func component_will_die():\n\tprint(\"Good bye\")"}),
				Gui.label({preset="paragraph", text="* The RootComponent does not have a component_will_die() method."}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.rich_label({preset="rich-paragraph", text='Next: [url=Getting a control node]Getting a control node[/url]', on_meta_clicked=handle_meta_clicked}),
			]),
		])
	])
