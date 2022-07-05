extends Component

class_name BaseRootComponent

var root_control:Control
var presets_path

func _init():
	super("rootComponent")
	Goo.root_control = get_parent()

func _ready():
	mount()

func mount():
	Goo.initialize_presets(presets_path)
	var rc = Control.new()
	rc.anchors_preset = 15
	root_control = rc
	call_deferred("add_sibling", rc)
	Goodoo.render(rc, self)

func update_gui():
	var time_before = Time.get_ticks_msec()
	var next = gui()
	Goodoo.diff(self.get_gui(), next)
	var total_time = Time.get_ticks_msec() - time_before
	print("Time taken to update "+ type + ": " + str(total_time/1000.0) + "s")
	updated()

