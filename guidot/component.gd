extends BaseComponent

class_name Component

var state:Dictionary = {}:
	set(value):
		var call_update_gui = state != {}
		state = value
		if call_update_gui:
			update_view()

var container
var parent_control
var key = null

func _init(_type:String, _props:Dictionary={}):
	type = _type
	props = _props.duplicate(true)
	if props.has("key"):
		key = props.key
	control = Node.new()
	container = Node.new()
	add_child(control)
	add_child(container)

# __________________
# Completes the tree of the component.
func complete():
	container.add_child(view())

# The representation of the Graphical User Interface (the view composed of control nodes) of the component.
# Similar to render function in React.
# It generates a tree structure (similar to the Virtual Dom in React) that will be use to render 
# the component the first time and to generate updated versions that can be used to update what has been changed.

func view(): # -> BasicComponent:
	pass

func get_view() -> BasicComponent:
	return container.get_children()[0]


# Compares the current gui of the component agains the updated gui to make the necessary changes to control nodes.
func update_view() -> void:
	var time_before = Time.get_ticks_msec()
	Guidot.diff(self.get_view(), view())
	var total_time = Time.get_ticks_msec() - time_before
	print("Time taken to update "+ type + ": " + str(total_time) +"ms")


# Lifecycle methods
func component_ready():
	pass

func component_updated():
	pass

func component_will_die():
	pass


# For Debug porpuses
func get_data():
	# Return the component tree as a dictionary.
	var data = {
		"type": type,
		"props": props,
		"control": control,
		"container": container,
		"parent_control": parent_control,
		"children": get_view().get_data(),
	}
	return data


func get_control(value) -> Control:
	var _gui = get_view()
	if _gui.props.has("id"):
		if _gui.props.id == value:
			return _gui.control
	return _gui.get_control(value)
