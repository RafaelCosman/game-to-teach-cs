$ = jQuery

$ ->
	#Prepare the gridTable
	for i in [0...3]
		($ "#gridTable>tbody").append("""
			<tr>
  		""")
		for j in [0...3]
			($ "#gridTable>tbody").append """
  				<td><div class="gridCell"></div></td>
  			"""
		($ "#gridTable>tbody").append """
  			</tr>
  		"""

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

			ui.position.left = (Math.cos angle) * -distance + parent.width() / 2 - ui.helper.width() / 2
			ui.position.top = (Math.sin angle) * -distance + parent.height() / 2 - ui.helper.height() / 2
		,
		stop: (ev, ui) ->
			parent = ui.helper.parent()
			angle = computeAngleFromParent(ui)

			distance = 50
			angle = Math.round(angle * 4 / (2 * Math.PI)) / (4 / (2 * Math.PI))

			setCenter ui.helper, {left: Math.cos(angle) * -distance + parent.width() / 2, top: Math.sin(angle) * -distance + parent.height() / 2}
	}
	setCenter ".logicBoxArrow", {left: ($ ".logicBox").width(), top: ($ ".logicBox").height() / 2}

	#($ ".logicBoxArrow").offset {top:20 + $(this).parent().offset.top, left:$(this).parent().offset.left}

	#buttons
	($ ".testButton").click(->
		($ ".gameBoard").append """
			<div class="testString">TEST</div>
		"""
		setCenter ".testString", getCenter(".startBox")

		($ ".testString") 
	)