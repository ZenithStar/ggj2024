extends GPUParticles2D


func _on_lifetime_timer_timeout():
	queue_free()
