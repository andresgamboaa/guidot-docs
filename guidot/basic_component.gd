extends BaseComponent

class_name BasicComponent

var list = false
var key = null

func _init(_props:Dictionary, _type:String, children:Array):
	type = _type
	props = _props.duplicate(true)

	if props.has("list"):
		list = props.list

	if props.has("key"):
		key = props.key

	for child in children:
		add_child(child)


func get_control(value):
	for child in get_children():
		if child.props.has("id"):
			if child.props.id == value:
				return child.control
		var found = child.get_control(value)
		if found:
			return found
	return null


func get_data():
	var children_data = []
	for child in get_children():
		children_data.append(child.get_data())

	var data = {
		"type": type,
		"props": props,
		"children": children_data,
		"control": control,
		"parent": control.get_parent()
	}
	return data
