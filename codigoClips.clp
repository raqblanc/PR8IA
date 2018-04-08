(clear)

(mapclass Vivienda)
(mapclass Cliente)



(defrule necesidadesPisoMinusvalia
	(object (is-a Piso)(planta ?pl)(ascensor ?asc)(distrito ?dis )(dormitorios ?dor)(inmobiliaria ?inm)(m2 ?m)(precio ?p) (OBJECT ?v))

	(object (is-a Cliente)(presupuesto ?pre)(minusvalia TRUE)(num_familiares ?fam) (nombre ?nom)(recomendaciones $?re)(OBJECT ?c))
	(test (not (member$ ?v ?re)))
	(test (>= ?dor ?fam))
	(test (<= ?p ?pre))

	(or(test (eq ?asc TRUE))(test (eq ?pl bajo)) )


	=>
	(printout t  ?c crlf)
	(slot-insert$ ?c recomendaciones 1 ?v)

)
	
	(defrule necesidadesPisoSinMinusvalia
		(object (is-a Piso)(planta ?pl)(ascensor ?asc)(distrito ?dis )(dormitorios ?dor)(inmobiliaria ?inm)(m2 ?m)(precio ?p) (OBJECT ?v))

		(object (is-a Cliente)(presupuesto ?pre)(minusvalia FALSE)(num_familiares ?fam) (nombre ?nom)(recomendaciones $?re)(OBJECT ?c))
		(test (not (member$ ?v ?re)))
		(test (>= ?dor ?fam))
		(test (<= ?p ?pre))

		=>
		(printout t  ?c crlf)
		(slot-insert$ ?c recomendaciones 1 ?v)

		)

		;para el chalet no hay que mirar nada de minusvalia porque vale siempre, solo una regla
		(defrule necesidadesChalet
			(object (is-a Chalet)(B ?b)(chimenea ?chim)(distrito ?dis)(dormitorios ?dor)(inmobiliaria ?inm)(jardin ?jar)(m2 ?m)(plazas_garaje ?pg)(precio ?p)(OBJECT ?v))

			(object (is-a Cliente)(presupuesto ?pre)(minusvalia ?min)(num_familiares ?fam) (nombre ?nom)(recomendaciones $?re)(OBJECT ?c))
			(test (not (member$ ?v ?re)))
			(test (>= ?dor ?fam))
			(test (<= ?p ?pre))

			=>
			(printout t  ?c crlf)
			(slot-insert$ ?c recomendaciones 1 ?v)

			)

			(defrule necesidadesEstudioMinusvalia
				(object (is-a Estudio)(ascensor ?asc)(cocina_indep ?coc)(distrito ?dis)(dormitorios ?dor)(inmobiliaria ?inm)(m2 ?m)(precio ?p) (OBJECT ?v))

				(object (is-a Cliente)(presupuesto ?pre)(minusvalia TRUE)(num_familiares ?fam) (nombre ?nom)(recomendaciones $?re)(OBJECT ?c))
				(test (not (member$ ?v ?re)))
				(test (>= ?dor ?fam))
				(test (<= ?p ?pre))

				(test (eq ?asc TRUE))


				=>
				(printout t  ?c crlf)
				(slot-insert$ ?c recomendaciones 1 ?v)

			)

			(defrule necesidadesEstudioSinMinusvalia
					(object (is-a Estudio)(ascensor ?asc)(cocina_indep ?coc)(distrito ?dis)(dormitorios ?dor)(inmobiliaria ?inm)(m2 ?m)(precio ?p) (OBJECT ?v))

					(object (is-a Cliente)(presupuesto ?pre)(minusvalia FALSE)(num_familiares ?fam) (nombre ?nom)(recomendaciones $?re)(OBJECT ?c))
					(test (not (member$ ?v ?re)))
					(test (>= ?dor ?fam))
					(test (<= ?p ?pre))

					=>
					(printout t  ?c crlf)
					(slot-insert$ ?c recomendaciones 1 ?v)

			)
;a y sin querer he borrado un piso de la latina de tengo que reponerlo
;para probarlo borra antes la lista de pisos que hay en un cliente

(reset)
(run) 
(facts) 
