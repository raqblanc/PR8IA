(clear)

(mapclass Vivienda)
(mapclass Cliente)



(defrule necesidades
	(object (is-a Piso)(planta ?pl)(ascensor ?asc)(distrito ?dis )(dormitorios ?dor)(inmobiliaria ?inm)(m2 ?m)(precio ?p) (OBJECT ?v))
	
	(object (is-a Cliente)(presupuesto ?pre)(minusvalia TRUE)(num_familiares ?fam) (nombre ?nom)(recomendaciones $?re)(OBJECT ?c))
	(test (not (member$ ?v ?re)))
	(test (> ?dor ?fam))
	(test (< ?p ?pre))
	 
	(or(test (eq ?asc TRUE))(test (eq ?pl bajo)) ) 

	  
	=>
	(printout t  ?c crlf)
	(slot-insert$ ?c recomendaciones 1 ?v)
	
	)
	
;hay que hacer sin minusvalia para piso y los de chalet y estudio con y si minusvalia
;he optado por hacer una regla para con y otra para sin minusvalia porque no me salia con un if
;a y sin querer he borrado un piso de la latina de tengo que reponerlo
;para probarlo borra antes la lista de pisos que hay en un cliente

(reset)
(run) 
(facts) 
