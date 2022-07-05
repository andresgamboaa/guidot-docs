extends Component

class_name CustomComponentPage

func _init():
	super("customcomponentpage")

func ready():
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
	print(meta)
	props.on_option_pressed.call(meta)

func gui():
	return\
	Goo.scrollbox({preset="scroll-cc-exp",id="scroll"},[
		Goo.margin({preset="margin-cc-exp-h", minimum_size=Vector2(0,0)},[
			Goo.vbox({preset="vbox-cc-exp-h"},[
				Goo.label({preset="title", text="Custom Components"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="Custom Components are called Components for simplicity. They are composed by basic components and other components."}),
				Goo.label({preset="paragraph", text="There is an spectial Component called RootComponent. This component is the starting point of an application and will contain all the other components."}),
				Goo.label({preset="paragraph", text="To create the UI with Goodoo, make a scene with a control node and add the RootComponent to it."}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.scrollbox({preset="expand-h",minimum_size=Vector2(0,360)},[
					Goo.center({preset="expand-h",minimum_size=Vector2(640,360)},[
						Goo.texture_rect({id="image1"}),
					])
				]),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.scrollbox({preset="expand-h",minimum_size=Vector2(0,80)},[
					Goo.center({preset="expand-h"},[
						Goo.texture_rect({id="image2"}),
					])
				]),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="The RootComponent have a script with a basic example, a simple counter, you can run the scene to see it in action."}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="subtitle", text="Creating your own components"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="To create a component, make a script. Inside the script, create a class that extends from Component."}),
				Code.new({gdscript=true, text='extends Component\nclass_name MyComponent'}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="All components that you create have to have the _init function and the gui function."}),
				Code.new({gdscript=true, text='func _init()\n\tsuper("mycomponent")'}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="Always call the _init function (super) of the parent class (Component) and pass it a string that will be used to identify objects of this class."}),
				Goo.label({preset="paragraph", text="The gui function is where you defined the view of the component. It has to return a BasicComponent"}),
				Code.new({gdscript=true, text='func gui() -> BasicComponent:\n\treturn\\\n\tGoo.center({preset="full"},[\n\t\tGoo.label({text="Hello!"})\n\t])'}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.rich_label({preset="rich-paragraph", text='Next: [url=]State[/url]'}),
			]),
		])
	])
