extends Node2D

var hose_segment = preload("res://Scenes/hose_segment.tscn")
var hose_length = 30
var hose_segment_length = 15

func _ready():
	var previous_segment = null
	for i in range(hose_length):
		var segment_instance = hose_segment.instantiate()
		segment_instance.position = Vector2(0, hose_segment_length * (i - 2))
		add_child(segment_instance)
		if previous_segment != null:
			var joint = PinJoint2D.new()
			joint.position = Vector2(0, hose_segment_length * (i - 3) + hose_segment_length / 2)
			joint.node_a = previous_segment.get_path()
			joint.node_b = segment_instance.get_path()
			add_child(joint)
		previous_segment = segment_instance
		if i == 0:
			var mainJoint = PinJoint2D.new()
			mainJoint.position = Vector2(0, -(hose_segment_length / 2 + hose_segment_length * 2))
			mainJoint.node_a = get_node("../StaticBody2D").get_path()
			mainJoint.node_b = previous_segment.get_path()
			add_child(mainJoint)


