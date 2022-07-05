extends Component

class_name State

func _init():
	super("state")

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
				Goo.label({preset="title", text="State"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
#				Code.new({gdscript=false,text="git clone https://github.com/AndresGamboaA/Goodoo.git"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="Components can hava a state. The state is a Godot Dictionary with the relevant data of the component. Every time the state is updated an updated representation of the gui will be created (by calling the gui funtion behind the scenes) and Goodoo will compare it with the current one to see what it needs to change, it will do that by comparing the dictionary of properties of each BasicComponent and the props of components created by you."}),
				Goo.label({preset="paragraph", text="Initialize the state of the component inside the _init function."}),
				Code.new({gdscript=true,text='func _init():\n\tsuper("counter")\n\tstate={name="Godot"}'}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="Now you can use it in the gui function."}),
				Code.new({gdscript=true,text='func gui():\n\treturn\\\n\tGoo.label({text="My favorite game engine is " + state.name})'}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.rich_label({preset="rich-paragraph", text='Next: [url=]Signals[/url]'}),
			]),
		])
	])
