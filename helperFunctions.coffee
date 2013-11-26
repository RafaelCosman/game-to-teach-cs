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

setCenter = (selector, offsets) ->
	($ selector).css {left: offsets.left - ($ selector).width() / 2, top: offsets.top - ($ selector).height() / 2}

getCenter = (selector) ->
	tag = ($ selector)
	offset = tag.offset()
	{left: offset.left + tag.width() / 2, top: offset.top + tag.height() / 2}