extends Component

class_name BaseRootComponent

var root_control:Control
var presets_path

func _init():
	super("rootComponent")

func _ready() -> void:
	mount()

func mount() -> void:
	Gui.initialize_presets(presets_path)
	var rc = Control.new()
	rc.anchors_preset = 15
	root_control = rc
	call_deferred("add_sibling", rc)
	Guidot.render(rc, self)

func update_view() -> void:
	var next = view()
	var time_before = Time.get_ticks_msec()
	Guidot.diff(self.get_view(), next)
	var total_time = Time.get_ticks_msec() - time_before
	print("Time taken to update "+ type + ": " + str(total_time) +"ms")
	component_updated()
