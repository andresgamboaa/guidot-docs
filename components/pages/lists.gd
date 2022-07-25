extends Component

class_name ListsPage

func _init():
	super("list")

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
				Gui.label({preset="title", text="Lists"}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="Sometimes you need to add, delete or rearrange items.\nLet's say you are creating a To Do app."}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.hbox({preset="expand-h"},[
					Gui.hbox({preset="expand-h", size_flags_stretch_ratio=2},[
						Code.new({gdscript=true,text="func view():\n\treturn\\\n\tGui.center({preset=\"full\"},[\n\t\tGui.vbox({preset=\"expand\", list=state.todos.hash()},[\n\t\t\tstate.todos.map(func(item):return TodoItem.new({\n\t\t\t\tkey=item.id,\n\t\t\t\tdata=item,\n\t\t\t\ton_delete=self.delete_todo\n\t\t\t])\n\t\t}))\n\t])"}),
					]),
					ToDoApp.new()
				]),
				Gui.label({preset="paragraph", text="The 'list' key is use to indicate Guidot that this BasicComponent will have children that can be added, deleted or rearranged. Without it, deletions, additions or rearrangments will not ocurred correctly."}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="The hash of the array has to be passed to ensure the BasicComponent(vbox) will be updated correctly each time the array has been updated."}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.label({preset="paragraph", text="It is very important to add a key with an unique value to each item."}),
				Gui.margin({minimum_size=Vector2(0,20)}),
				Gui.rich_label({preset="rich-paragraph", text='Next: [url=]Your first Guidot app[/url]'}),
			]),
		])
	])
