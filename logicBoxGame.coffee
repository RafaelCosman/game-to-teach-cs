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

		($ ".gridCell").droppable {hoverClass: "drop-hover", drop: ((ev, ui) ->

			ui.draggable.parent().removeClass("filled")
			ui.draggable.detach()
			
			console.log ($ this).offset()

			ui.draggable.appendTo ($ this)
			ui.draggable.offset( ($ this).offset() )
			($ this).addClass "filled"
		)}

	#Prepare the logic boxes
	($ ".logicBox").draggable {}
	console.log $( ".logicBox" ).draggable( "option", "zIndex" )

	($ ".logicBox").on("drag", (->
		console.log $(this).x
		))

	#prepare their arrows
	($ ".logicBoxArrow").draggable {
		drag: ((ev, ui) ->
			console.log ev.clientX
			($ this).clientX = 0
			)
	}