extends Component

class_name AddNodes

func _init(_props):
	super("addnodes",_props)

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
				Gui.label({preset="title", text="Adding nodes"}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Nodes like HttpRequest or Timer need to be added to the scene. If you need them you must add them to control."}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Code.new({gdscript=true,text='extends Component\nclass_name HttpComponent\n\nfunc _init():\n\tsuper("httpcomponent")\n\nfunc component_ready():\n\tvar http_request = HTTPRequest.new()\n\tcontrol.add_child(http_request)\n'}),
				Gui.margin({custom_minimum_size=Vector2(0,20)})
			]),
		])
	])
