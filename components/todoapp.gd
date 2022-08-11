extends Component

class_name ToDoApp
var last_id = 2
var line_edit:LineEdit

# Called when the component is initialized. Use it to initialize the state.
func _init():
	super("todoapp")
	state = {todos=[
		{id=1, todo="Learn Guidot"},
		{id=2, todo="Make a fun videogame"}
	]}

func component_ready():
	line_edit = get_control("userInput")

func add_todo(text):
	last_id += 1
	state.todos.push_front({id=last_id, todo=text})
	line_edit.text = ""
	update_view()

func delete_todo(id):
	state.todos = state.todos.filter(func(todo):return todo.id!=id)
	update_view()

func on_todo_completed(id):
	var todo = state.todos.filter(func(todo):return todo.id == id)[0]
	state.todos = state.todos.filter(func(todo):return todo.id!=id)
	todo.todo = "[s]"+todo.todo+"[/s]"
	state.todos.append(todo)
	update_view()

func view():
	return\
	Gui.control({preset="expand"},[
		Gui.color_rect({preset="full", color=Color.html("#202531")}),
		Gui.margin({preset="full", const_margin_all=20},[
			Gui.vbox({preset="expand"},[
				Gui.scrollbox({preset="expand"},[
					Gui.vbox({preset="expand", list=true, h=state.todos.hash()},
						state.todos.map(func(item):return TodoItem.new({
							key=item.id, 
							data=item,
							on_delete=self.delete_todo,
							on_completed=self.on_todo_completed
						}))
					),
				]),
				Gui.line_edit({
					id="userInput", 
					text="", 
					on_text_submitted=add_todo
				})
			])
		])
	])
