$ = jQuery

$ ->
	#Prepare the gridTable
	for i in [0...3]
		($ "#gridTable>tbody").append("""
			<tr>
  		""")
		for j in [0...3]
			($ "#gridTable>tbody").append("""
  				<td><div class="gridCell"></div></td>
  			""")
		($ "#gridTable>tbody").append("""
  			</tr>
  		""")

		($ ".gridCell,.toolBox").droppable {
			hoverClass: "drop-hover",
			accept: ".logicBox",
			drop: ((ev, ui) ->
				ui.draggable.parent().removeClass "filled"
				ui.draggable.detach()

				ui.draggable.appendTo ($ this)
				ui.draggable.offset {left:($ this).offset().left + 9, top:($ this).offset().top + 9}
				($ this).addClass "filled"
			)
		}

	#Prepare the logic boxes
	($ ".logicBox").draggable {}

	#prepare their arrows
	($ ".logicBoxArrow").draggable {
		drag: (ev, ui) ->
			parent = ui.helper.parent()
			angle = computeAngleFromParent(ui)

			distance = 50

			ui.position.left = Math.cos(angle) * -distance + parent.width() / 2 - ui.helper.width() / 2
			ui.position.top = Math.sin(angle) * -distance + parent.height() / 2 - ui.helper.height() / 2
		,
		stop: (ev, ui) ->
			parent = ui.helper.parent()
			angle = computeAngleFromParent(ui)

			distance = 50
			angle = Math.round(angle * 4 / (2 * Math.PI)) / (4 / (2 * Math.PI))

			ui.helper.css {left: Math.cos(angle) * -distance + parent.width() / 2 - ui.helper.width() / 2}
			ui.helper.css {top:  Math.sin(angle) * -distance + parent.height() / 2 - ui.helper.height() / 2}

			#ui.helper.css {left : 0}
			#ui.helper.css {top : 0}
	}

	($ ".logicBoxArrow").offset {top:20 + $(this).parent().offset.top, left:$(this).parent().offset.left}

computeAngleFromParent = (ui) ->
	parent = ui.helper.parent()

	dx = ui.position.left - (parent.width() / 2 - ui.helper.width() / 2)
	dy = ui.position.top - (parent.height() / 2 - ui.helper.height() / 2)
			
	angle = Math.atan(dy / dx)
	if dx > 0
		angle += Math.PI

	angle