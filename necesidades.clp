(clear)

(mapclass Vivienda)
(mapclass Cliente)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; REGLA PARA RECOMENDAR LAS VIVIENDAS SEGÚN ;;;;;;;;;;;;;
;;;;;;;;;;;;; SUS NECESIDADES. SIN MINUSVALÍA ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; UTILIZANDO HERENCIA ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule necesidadesSinMinusvaliaHerencia

  (object (OBJECT ?v)(precio ?p) (dormitorios ?dor))

  (test (member$ Vivienda(class-superclasses (class ?v) inherit) ))
  (object (is-a Cliente)(nombre ?nom)(presupuesto ?pre)(minusvalia FALSE)(num_familiares ?fam) (nombre ?nom)(recomendaciones $?re)(OBJECT ?c))
  (test (not (member$ ?v ?re)))
  (test (>= ?dor ?fam))
  (test (<= ?p ?pre))

  =>
  (printout t  ?nom crlf)
  (slot-insert$ ?c recomendaciones 1 ?v)
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; REGLAS PARA RECOMENDAR LAS VIVIENDAS SEGÚN ;;;;;;;;;;;;
;;;;;;;;;;;;; SUS NECESIDADES. CON MINUSVALÍA ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule necesidadesPisoMinusvalia
	(object (is-a Piso)(planta ?pl)(ascensor ?asc)(dormitorios ?dor)(precio ?p) (OBJECT ?v))

	(object (is-a Cliente)(nombre ?nom)(presupuesto ?pre)(minusvalia TRUE)(num_familiares ?fam) (nombre ?nom)(recomendaciones $?re)(OBJECT ?c))
	(test (not (member$ ?v ?re)))
	(test (>= ?dor ?fam))
	(test (<= ?p ?pre))

	(or(test (eq ?asc TRUE))(test (eq ?pl bajo)) )


	=>
	(printout t  ?nom crlf)
	(slot-insert$ ?c recomendaciones 1 ?v)

)

(defrule necesidadesChalet
		(object (is-a Chalet)(dormitorios ?dor)(precio ?p)(OBJECT ?v))

		(object (is-a Cliente)(nombre ?nom)(presupuesto ?pre)(minusvalia ?min)(num_familiares ?fam) (nombre ?nom)(recomendaciones $?re)(OBJECT ?c))
		(test (not (member$ ?v ?re)))
		(test (>= ?dor ?fam))
		(test (<= ?p ?pre))

		=>
		(printout t  ?nom crlf)
		(slot-insert$ ?c recomendaciones 1 ?v)
)

(defrule necesidadesEstudioMinusvalia
	(object (is-a Estudio)(ascensor ?asc)(dormitorios ?dor)(precio ?p) (OBJECT ?v))

	(object (is-a Cliente)(nombre ?nom)(presupuesto ?pre)(minusvalia TRUE)(num_familiares ?fam) (nombre ?nom)(recomendaciones $?re)(OBJECT ?c))
	(test (not (member$ ?v ?re)))
	(test (>= ?dor ?fam))
	(test (<= ?p ?pre))

	(test (eq ?asc TRUE))


	=>
  (printout t  ?nom crlf)

	(slot-insert$ ?c recomendaciones 1 ?v)

)




(reset)
(run)
(facts)
