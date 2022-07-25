extends Component

class_name Code

func _init(_input):
	super("code", _input)

func component_ready():
	var code:CodeEdit = get_control("code")
	code.syntax_highlighter = code.syntax_highlighter.duplicate()
	if props.gdscript == true:
		var gds_keywords = [
			"func",
			"if",
			"else",
			"return"
		]
		for keyword in gds_keywords:
			code.syntax_highlighter.add_keyword_color(keyword, Color("#e56578"))
		code.syntax_highlighter.add_keyword_color("Gui", Color("#c072ff"))
	else:
		code.syntax_highlighter = null

func view():
	var height = (props.text.count("\n")+1)*29
	return\
	Gui.control({preset="expand-h", minimum_size=Vector2(0,height)},[
		Gui.code_edit({preset="code", text=props.text, id="code"}),
		Gui.button({preset="top-right",text="copy", 
			on_pressed=func():DisplayServer.clipboard_set(props.text)
		})
	])
