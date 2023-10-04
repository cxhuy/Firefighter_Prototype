extends Node2D

var hose_segment = preload("res://Scenes/hose_segment.tscn")
var hose_length = 50
var hose_segment_length = 30

func _ready():
	var player = get_node("../Character")
	var previous_segment = null
	for i in range(hose_length):
		var segment_instance = hose_segment.instantiate()
		segment_instance.position = player.global_position + Vector2(0, hose_segment_length * i)
		add_child(segment_instance)
		if previous_segment != null:
			var joint = PinJoint2D.new()
			joint.bias = 0.7
			joint.position = player.global_position + Vector2(0, hose_segment_length * (i - 1) + hose_segment_length / 2)
			joint.node_a = previous_segment.get_path()
			joint.node_b = segment_instance.get_path()
			add_child(joint)
		previous_segment = segment_instance
		if i == 0:
			var mainJoint = PinJoint2D.new()
			mainJoint.position = player.global_position + Vector2(0, -(hose_segment_length / 2))
			mainJoint.node_a = player.get_path()
			mainJoint.node_b = previous_segment.get_path()
			add_child(mainJoint)


