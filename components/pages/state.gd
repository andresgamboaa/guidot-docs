extends Component

class_name State

func _init():
	super("state")

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
				Gui.label({preset="title", text="State"}),
				Gui.margin({minimum_size=Vector2(0,20)}),
#				Code.new({gdscript=false,text="git clone https://github.com/AndresGamboaA/Goodoo.git"}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Components can hava a state. The state is a Godot Dictionary with the relevant data of the component. Every time the state is updated an updated representation of the view will be created (by calling the view method behind the scenes) and Guidot will compare it with the current one to see what it needs to change, it will do that by comparing the dictionary of properties of each BasicComponent and the props of components created by you."}),
				Gui.label({preset="paragraph", text="Initialize the state of the component inside the _init function."}),
				Code.new({gdscript=true,text='func _init():\n\tsuper("counter")\n\tstate={name="Godot"}'}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Now you can use it in the view method."}),
				Code.new({gdscript=true,text='func view():\n\treturn\\\n\tGui.label({text="My favorite game engine is " + state.name})'}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.rich_label({preset="rich-paragraph", text='Next: [url=]Signals[/url]'}),
			]),
		])
	])
