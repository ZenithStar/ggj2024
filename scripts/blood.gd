extends GPUParticles2D


func _on_lifetime_timer_timeout():
	set_process(false)
	set_physics_process(false)
	queue_free()
