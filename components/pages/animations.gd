extends Component

class_name Animations

func _init(_props):
	super("animations",_props)

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
				Gui.label({preset="title", text="Animations"}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="You can animate a component with tweens by getting its control nodes."}),
				Gui.hbox({preset="expand-h"},[
					Gui.hbox({preset="expand-h", size_flags_stretch_ratio=2},[
						Code.new({gdscript=true, text='extends Component\nclass_name AnimatedButton\n\nvar button: Button\nvar tween: Tween\n\nfunc _init():\n\tsuper("animatedbutton")\n\nfunc component_ready():\n\tbutton = get_control("button")\n\nfunc animate():\n\ttween = button.create_tween()\n\ttween.tween_property(button, "scale", Vector2(2.0, 2.0), 0.1).from(Vector2(2.0,2.0)).set_trans(Tween.TRANS_BOUNCE)\n\ttween.tween_property(button, "scale", Vector2(1.0,1.0), 0.1).from(Vector2(2.0,2.0)).set_trans(Tween.TRANS_BOUNCE)\n\nfunc view():\n\treturn\\\n\tGui.center({preset="expand"},[\n\t\tGui.button({text="click me", on_pressed=animate, id="button"})\n\t])\n'}),						
					]),
					AnimatedButton.new()
				]),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.rich_label({preset="rich-paragraph", text='Next: [url=Add Nodes]Add Nodes[/url]', on_meta_clicked=handle_meta_clicked}),
			]),
		])
	])
