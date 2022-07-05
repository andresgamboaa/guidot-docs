extends Component

class_name Installation

func _init():
	super("installation")

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
				Goo.label({preset="title", text="Installation"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Code.new({gdscript=false,text="git clone https://github.com/AndresGamboaA/Goodoo.git"}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.label({preset="paragraph", text="You can work from this project or copy the goodoo folder inside your own. Just make sure to enable the Goodoo, Goo and Utils autoloads."}),
				Goo.margin({minimum_size=Vector2(0,20)}),
				Goo.rich_label({preset="rich-paragraph", text='Next: [url=]Your first Goodoo app[/url]'}),
			]),
		])
	])
