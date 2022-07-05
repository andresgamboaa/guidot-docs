extends Component

class_name Concepts

func _init():
	super("concepts")

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
				Goo.label({preset="title", text="Concepts"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="If you have ever worked with a frontent framework like React, Goodoo will feel familiar. There some important things you need to know before starting to use this library. It is also important that you already know how to create UI with the control nodes and have a good understanding of how they work."}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.rich_label({preset="rich-paragraph", text='Next: [url=]BasicComponent[/url]'}),
			]),
		])
	])
