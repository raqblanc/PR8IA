(clear)

(mapclass Vivienda)
(mapclass Perfil)
; ejemplo de regla para subclases 
(defrule herencia
	
	(object (OBJECT ?b) (precio ?p))
    (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
	=>
		(printout t ?p " "  crlf)

)	


(reset)
(run)
(facts)




(clear)

(mapclass Vivienda)
(mapclass Perfil)
(mapclass Distrito)

(defrule ViviendaDeportista3

	(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
    (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
	(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 0)(criminalidad 0)(zonas_verdes TRUE ))
	
	(object(is-a Perfil)(OBJECT ?p)(nombre "deportista")(valoracion 3))
	
	(test (not (member$ ?p ?per)))
	
	
	=>
	(slot-insert$ ?b perfiles 1 ?p)
	(printout t ?b " " ?no crlf)
	
 )
 

 
 
 (defrule ViviendaDeportista2

	(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
    (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
	(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 1)(criminalidad 1)(zonas_verdes TRUE ))
	
	(object(is-a Perfil)(OBJECT ?p)(nombre "deportista")(valoracion 2))
	
	(test (not (member$ ?p ?per)))
	
	
	=>
	(slot-insert$ ?b perfiles 1 ?p)
	(printout t ?b " " ?no crlf)
	
 )
 
 
 
 (defrule ViviendaDeportista1

	(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
    (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
	(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion 2)(criminalidad 3)(zonas_verdes TRUE ))
	
	(object(is-a Perfil)(OBJECT ?p)(nombre "deportista")(valoracion 1))
	
	(test (not (member$ ?p ?per)))
	
	
	
	=>
	(slot-insert$ ?b perfiles 1 ?p)
	(printout t ?b " " ?no crlf)
	
 )
 
 
(reset)
(run)
(facts)

(mapclass Vivienda)
(mapclass Perfil)
(mapclass Distrito)

 
 
 
 (defrule ViviendaDeportista0

	(object (OBJECT ?b)(distrito ?dis)(perfiles $?per))
    (test (member$ Vivienda(class-superclasses (class ?b) inherit) ))
	
	(object(is-a Distrito)(OBJECT ?dis)(nombre ?no)(contaminacion ?f)(criminalidad ?o)(zonas_verdes ?u ))
	
	(object(is-a Perfil)(OBJECT ?p1)(nombre "deportista")(valoracion 1))
	(object(is-a Perfil)(OBJECT ?p2)(nombre "deportista")(valoracion 2))
	(object(is-a Perfil)(OBJECT ?p3)(nombre "deportista")(valoracion 3))
	(object(is-a Perfil)(OBJECT ?p0)(nombre "deportista")(valoracion 0))
	
	(test (not (member$ ?p1 ?per)))
	(test (not (member$ ?p2 ?per)))
	(test (not (member$ ?p3 ?per)))
	(test (not (member$ ?p0 ?per)))
	
	(object(is-a Perfil)(OBJECT ?p)(nombre "deportista")(valoracion 0))
	
	
	
	
	
	
	=>
	(slot-insert$ ?b perfiles 1 ?p)
	(printout t ?b " " ?no crlf)
	
 )
 
 




(reset)
(run)




