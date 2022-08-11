extends Component

class_name CustomComponentPage

func _init(p):
	super("customcomponentpage",p)

func component_ready():
	var scroll = get_control("scroll")
	var tween = scroll.create_tween()
	tween.set_parallel(true)
	tween.tween_property(scroll, "modulate:a", 1.0, 0.3).from(0.0).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(scroll, "position:y", scroll.position.y, 0.3).from(scroll.position.y+20.0).set_trans(Tween.TRANS_CUBIC)
	
	var image1 : TextureRect
	image1 = get_control("image1")
	image1.texture = load("res://assets/addRootComp.png")
	image1.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED
	
	var image2 : TextureRect
	image2 = get_control("image2")
	image2.texture = load("res://assets/tree.png")
	image2.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED

func handle_meta_clicked(meta):
	props.on_option_pressed.call(meta)

func view():
	return\
	Gui.smoothScrollbox({preset="scroll-cc-exp",id="scroll"},[
		Gui.margin({preset="margin-cc-exp-h", custom_minimum_size=Vector2(0,0)},[
			Gui.vbox({preset="vbox-cc-exp-h"},[
				Gui.label({preset="title", text="Custom Components"}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Custom Components are called Components for simplicity. They are composed by basic components and other components."}),
				Gui.label({preset="paragraph", text="There is an spectial Component called RootComponent. This component is the starting point of an application and will contain all the other components."}),
				Gui.label({preset="paragraph", text="To create the UI with Guidot, make a scene with a control node and add the RootComponent to it as a child."}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.scrollbox({preset="expand-h",custom_minimum_size=Vector2(0,360)},[
					Gui.center({preset="expand-h",custom_minimum_size=Vector2(640,360)},[
						Gui.texture_rect({id="image1"}),
					])
				]),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.scrollbox({preset="expand-h",custom_minimum_size=Vector2(0,80)},[
					Gui.center({preset="expand-h"},[
						Gui.texture_rect({id="image2"}),
					])
				]),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="The RootComponent have a script with a basic example, a simple counter, you can run the scene to see it in action."}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="subtitle", text="Creating your own components"}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="To create a component, make a script. Inside the script, create a class that extends from Component."}),
				Code.new({gdscript=true, text='extends Component\nclass_name MyComponent'}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="All components that you create have to implement the '_init' and 'view' methods."}),
				Code.new({gdscript=true, text='func _init()\n\tsuper("mycomponent")'}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Always call the _init function (super) of the parent class (Component) and pass it a string that will be used to identify objects of this class."}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="The view method is where you defined how the component looks like. It has to return a BasicComponent"}),
				Code.new({gdscript=true, text='func view() -> BasicComponent:\n\treturn\\\n\tGui.center({preset="full"},[\n\t\tGui.label({text="Hello!"})\n\t])'}),
				Gui.margin({custom_minimum_size=Vector2(0,20)}),
				Gui.rich_label({preset="rich-paragraph", text='Next: [url=State]State[/url]', on_meta_clicked=handle_meta_clicked}),
			]),
		])
	])
