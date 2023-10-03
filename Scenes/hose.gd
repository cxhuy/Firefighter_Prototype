extends Node2D

var rope_segment = preload("res://Scenes/hose_segment.tscn")
var rope_length = 10

func _ready():
	var previous_segment = null
	for i in range(rope_length):
		var segment_instance = rope_segment.instantiate()
		segment_instance.position = Vector2(0, 30 * i)
		add_child(segment_instance)
		if previous_segment != null:
			var joint = PinJoint2D.new()
			joint.position = Vector2(0, 30 * (i - 1) + 15)
			joint.node_a = previous_segment.get_path()
			joint.node_b = segment_instance.get_path()
			add_child(joint)
		previous_segment = segment_instance
		if i == 0:
			var mainJoint = PinJoint2D.new()
			mainJoint.position = Vector2(0, -15)
			mainJoint.node_a = get_node("../StaticBody2D").get_path()
			mainJoint.node_b = previous_segment.get_path()
			add_child(mainJoint)


