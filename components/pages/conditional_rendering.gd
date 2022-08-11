extends Component

class_name ConditionalRendering

func _init(_props):
	super("cond_rend",_props)

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
				Gui.label({preset="title", text="Conditional Rendering"}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="If you need to render a component base on a condition you can use:"}),
				Code.new({gdscript=true, text='Gui.show_if(condition, component)\n'}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.hbox({preset="expand-h"},[
					Gui.hbox({preset="expand-h", size_flags_stretch_ratio=2},[
						Code.new({gdscript=true, text='func view():\n\treturn Gui.control({preset="expand"},[\n\t\tGui.center({preset="full"},[\n\t\t\tGui.show_if(state.show_label,\n\t\t\t\tGui.label({text="Hi"})\n\t\t\t)\n\t\t]),\n\t\tGui.button({preset="center-bottom",text="hide"if state.show_label else "show", on_pressed=toggle})\n\t])\n'}),
					]),
					Conditional.new()
				]),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.rich_label({preset="rich-paragraph", text='Next: [url=Lifecycle methods]Lifecycle methods[/url]', on_meta_clicked=handle_meta_clicked}),
			]),
		])
	])
