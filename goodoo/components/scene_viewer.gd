extends Component
class_name SceneViewer

var subViewportContainer: SubViewportContainer
var viewport: SubViewport

func _init(_props):
	super("SceneViewer", _props)

func ready():
	subViewportContainer = get_control("viewport")
	viewport = subViewportContainer.get_children()[0]
	viewport.size = props.size
	var scene = load(props.scene).instantiate()
	viewport.add_child(scene)

func gui():
	return\
	Goo.center({preset="expand-h"},[
		Goo.subviewportbox({size=props.size, id="viewport"})
	])
