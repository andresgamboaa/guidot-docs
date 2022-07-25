extends Component

class_name Signals

func _init():
	super("signals")

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
				Gui.label({preset="title", text="Signals"}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Conecting a signal with a function is easy with Guidot. A function has to be asigned to a key with the name of the signal with the prefix on_ inside the dictionary of properties of a BasicComponent."}),
				Gui.label({preset="paragraph", text="Here we are connecting the signal (pressed) of a button with the increment function."}),
				Gui.margin({minimum_size=Vector2(0,10)}),
				Gui.hbox({preset="expand-h"},[
					Gui.hbox({preset="expand-h", size_flags_stretch_ratio=2},[
						Code.new({gdscript=true, text='func _init():\n\tsuper()\n\tstate = {count=0}\n\nfunc increment():\n\tstate.count += 1\n\nfunc view():\n\treturn\\\n\tGui.center({preset="full"}, [\n\t\tGui.button({\n\t\t\ttext=str(state.count)\n\t\t\ton_pressed=increment\n\t\t})\n\t])'}),
					]),
					SimpleCounter.new()
				]),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Updates of the view will only happen when you use the '=' operator to update the state, like in the previous case. If you, for example, have to append an item to an array, you must call the update_view method explicitelly."}),
				Code.new({gdscript=true, text='func _init():\n\tsuper()\n\tstate = {items=[]}\n\nfunc add_item(item):\n\tstate.items.append(item)\n\tupdate_view()'}),
				Gui.rich_label({preset="rich-paragraph", text='Next: [url=]Your first Goodoo app[/url]'}),
			]),
		])
	])
