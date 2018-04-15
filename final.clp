

(clear )

(mapclass Cliente)
(mapclass Perfil)
(mapclass Vivienda)
(mapclass vivienda_perfil_puntos)

(deftemplate vivienda_perfil_puntos
	(slot perfil)
	(slot puntos)
	(slot vivienda)
	(slot nombre))

	






(defrule final

	(object (is-a Cliente)(OBJECT ?c)(nombre ?nom)(perfiles $? ?pe $? )(recomendaciones $? ?b $?)(NyP $?np))

	(object(is-a Perfil)(OBJECT ?pe)(nombre ?per)(valoracion ?val1))
	

	(object (OBJECT ?b) (perfiles $? ?p $?))
    (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
	
	
	(object(is-a Perfil)(OBJECT ?p)(nombre ?per)(valoracion ?val2))
	
	(test (neq ?val1 0))
	(test (neq ?val2 0))
	
	=>
	(printout t ?c " "  crlf)
	(make-instance of vivienda_perfil_puntos (cliente ?nom)(perfil "deportista")(vivienda ?b)(puntos (* ?val1 ?val2)))



)
(reset)
(run)


(clear)

(mapclass Cliente)
(mapclass Perfil)
(mapclass Vivienda)
(mapclass vivienda_perfil_puntos)

(deftemplate vivienda_perfil_puntos
	(slot perfil)
	(slot puntos)
	(slot vivienda)
	(slot nombre))

(defrule asignacion
     (declare(salience -100))
	(object (is-a Cliente)(OBJECT ?c)(nombre ?nom)(NyP $?np))

	(object(is-a vivienda_perfil_puntos )(OBJECT ?v)(cliente ?nom))

	
	(test (not (member$ ?v ?np)))
	=>
	(slot-insert$ ?c NyP 1 ?v)
	(printout t ?nom " " ?v  crlf)

)


(reset)
(run)


