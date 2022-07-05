extends Component

class_name Treed

func _init():
	super("tree")

func gui():
	return\
	Goo.scrollbox({preset="expand"},[
		SceneViewer.new({scene="res://node_3d.tscn", size=Vector2(300,300)})
	])
