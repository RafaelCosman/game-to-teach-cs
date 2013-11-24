dist = (x, y) ->
	Math.sqrt(x*x + y*y)
	
computeAngleFromParent = (ui) ->
	parent = ui.helper.parent()

	dx = ui.position.left - (parent.width() / 2 - ui.helper.width() / 2)
	dy = ui.position.top - (parent.height() / 2 - ui.helper.height() / 2)
			
	angle = Math.atan(dy / dx)
	if dx > 0
		angle += Math.PI

	angle