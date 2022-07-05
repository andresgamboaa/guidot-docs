extends Component

class_name Signals

func _init():
	super("signals")

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
				Goo.label({preset="title", text="Signals"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="Conecting a signal with a function is easy with Goodoo. A funtion has to be asigned to a key with the name of the signal with the prefix on_ inside the dictionary of properties of a BasicComponent."}),
				Goo.label({preset="paragraph", text="Here we are connecting the signal (pressed) of a button with the increment function."}),
				Goo.margin({minimum_size=Vector2(0,10)}),
				Goo.hbox({preset="expand-h"},[
					Goo.hbox({preset="expand-h", size_flags_stretch_ratio=2},[
						Code.new({gdscript=true, text='func _init():\n\tsuper()\n\tstate = {count=0}\n\nfunc increment():\n\tstate.count += 1\n\nfunc gui():\n\treturn\\\n\tGoo.center({preset="full"}, [\n\t\tGoo.button({\n\t\t\ttext=str(state.count)\n\t\t\ton_pressed=increment\n\t\t})\n\t])'}),
					]),
					SimpleCounter.new()
				]),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="Updates of the gui will only happen when you use the '=' operator to update the state, like in the previous case, if you, for example, have to append an item to an array, you must call the update_gui function explicitelly."}),
				Code.new({gdscript=true, text='func _init():\n\tsuper()\n\tstate = {items=[]}\n\nfunc add_item(item):\n\tstate.items.append(item)\n\tupdate_gui()'}),
				Goo.rich_label({preset="rich-paragraph", text='Next: [url=]Your first Goodoo app[/url]'}),
			]),
		])
	])
